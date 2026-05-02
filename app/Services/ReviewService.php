<?php

class ReviewService
{
    private PDO $pdo;

    public function __construct(?PDO $pdo = null)
    {
        if ($pdo instanceof PDO) {
            $this->pdo = $pdo;
            return;
        }

        if (function_exists('db')) {
            $this->pdo = db();
            return;
        }

        if (isset($GLOBALS['pdo']) && $GLOBALS['pdo'] instanceof PDO) {
            $this->pdo = $GLOBALS['pdo'];
            return;
        }

        throw new RuntimeException('PDO bağlantısı bulunamadı.');
    }

    public function canReview(int $consumerId, int $orderItemId): array
    {
        if ($consumerId <= 0) {
            return [
                'success' => false,
                'message' => 'Yorum yapabilmek için giriş yapmalısınız.',
            ];
        }

        if ($orderItemId <= 0) {
            return [
                'success' => false,
                'message' => 'Geçerli bir sipariş ürünü seçilmedi.',
            ];
        }

        $stmt = $this->pdo->prepare("
            SELECT 
                oi.id AS order_item_id,
                oi.product_id,
                o.id AS order_id,
                o.consumer_id,
                o.producer_id,
                o.order_status
            FROM order_items oi
            INNER JOIN orders o ON o.id = oi.order_id
            WHERE oi.id = :order_item_id
            LIMIT 1
        ");

        $stmt->execute([
            ':order_item_id' => $orderItemId,
        ]);

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return [
                'success' => false,
                'message' => 'Sipariş ürünü bulunamadı.',
            ];
        }

        if ((int) $row['consumer_id'] !== $consumerId) {
            return [
                'success' => false,
                'message' => 'Bu sipariş ürünü size ait değil.',
            ];
        }

        if (($row['order_status'] ?? '') !== 'delivered') {
            return [
                'success' => false,
                'message' => 'Sadece teslim edilmiş sipariş ürünlerine yorum yapabilirsiniz.',
            ];
        }

        if ($this->hasReviewForOrderItem($orderItemId)) {
            return [
                'success' => false,
                'message' => 'Bu sipariş ürünü için daha önce yorum yapılmış.',
            ];
        }

        return [
            'success' => true,
            'message' => 'Yorum yapılabilir.',
            'data' => $row,
        ];
    }

    public function createReview(int $consumerId, array $input): array
    {
        $orderItemId = (int) ($input['order_item_id'] ?? 0);
        $rating = (int) ($input['rating'] ?? 0);
        $comment = trim((string) ($input['comment'] ?? ''));

        $errors = [];

        if ($orderItemId <= 0) {
            $errors['order_item_id'][] = 'Geçerli bir sipariş ürünü seçilmedi.';
        }

        if ($rating < 1 || $rating > 5) {
            $errors['rating'][] = 'Puan 1 ile 5 arasında olmalıdır.';
        }

        if (mb_strlen($comment) > 1000) {
            $errors['comment'][] = 'Yorum en fazla 1000 karakter olabilir.';
        }

        if (!empty($errors)) {
            return [
                'success' => false,
                'message' => 'Lütfen formdaki hataları düzeltin.',
                'errors' => $errors,
            ];
        }

        $canReview = $this->canReview($consumerId, $orderItemId);

        if (!$canReview['success']) {
            return [
                'success' => false,
                'message' => $canReview['message'],
                'errors' => [],
            ];
        }

        $data = $canReview['data'];
        $producerId = (int) $data['producer_id'];
        $productId = isset($data['product_id']) ? (int) $data['product_id'] : null;

        try {
            $this->pdo->beginTransaction();

            $stmt = $this->pdo->prepare("
                INSERT INTO reviews (
                    order_item_id,
                    consumer_id,
                    producer_id,
                    product_id,
                    rating,
                    comment,
                    status,
                    created_at
                ) VALUES (
                    :order_item_id,
                    :consumer_id,
                    :producer_id,
                    :product_id,
                    :rating,
                    :comment,
                    'visible',
                    NOW()
                )
            ");

            $stmt->execute([
                ':order_item_id' => $orderItemId,
                ':consumer_id' => $consumerId,
                ':producer_id' => $producerId,
                ':product_id' => $productId,
                ':rating' => $rating,
                ':comment' => $comment !== '' ? $comment : null,
            ]);

            $this->updateProductRating($productId);
            $this->updateProducerRating($producerId);

            $this->pdo->commit();

            return [
                'success' => true,
                'message' => 'Yorum başarıyla oluşturuldu.',
            ];
        } catch (Throwable $e) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }

            return [
                'success' => false,
                'message' => 'Yorum kaydedilirken bir hata oluştu.',
                'errors' => [],
            ];
        }
    }

    public function hasReviewForOrderItem(int $orderItemId): bool
    {
        $stmt = $this->pdo->prepare("
            SELECT COUNT(*)
            FROM reviews
            WHERE order_item_id = :order_item_id
        ");

        $stmt->execute([
            ':order_item_id' => $orderItemId,
        ]);

        return (int) $stmt->fetchColumn() > 0;
    }

    private function updateProductRating(?int $productId): void
    {
        if ($productId === null || $productId <= 0) {
            return;
        }

        $stmt = $this->pdo->prepare("
            SELECT 
                COALESCE(AVG(rating), 0) AS average_rating,
                COUNT(*) AS rating_count
            FROM reviews
            WHERE product_id = :product_id
            AND status = 'visible'
        ");

        $stmt->execute([
            ':product_id' => $productId,
        ]);

        $ratingData = $stmt->fetch(PDO::FETCH_ASSOC);

        $update = $this->pdo->prepare("
            UPDATE products
            SET 
                average_rating = :average_rating,
                rating_count = :rating_count
            WHERE id = :product_id
        ");

        $update->execute([
            ':average_rating' => round((float) $ratingData['average_rating'], 2),
            ':rating_count' => (int) $ratingData['rating_count'],
            ':product_id' => $productId,
        ]);
    }

    private function updateProducerRating(int $producerId): void
    {
        if ($producerId <= 0) {
            return;
        }

        $stmt = $this->pdo->prepare("
            SELECT 
                COALESCE(AVG(rating), 0) AS average_rating,
                COUNT(*) AS rating_count
            FROM reviews
            WHERE producer_id = :producer_id
            AND status = 'visible'
        ");

        $stmt->execute([
            ':producer_id' => $producerId,
        ]);

        $ratingData = $stmt->fetch(PDO::FETCH_ASSOC);

        $update = $this->pdo->prepare("
            UPDATE producer_profiles
            SET 
                average_rating = :average_rating,
                rating_count = :rating_count
            WHERE user_id = :producer_id
        ");

        $update->execute([
            ':average_rating' => round((float) $ratingData['average_rating'], 2),
            ':rating_count' => (int) $ratingData['rating_count'],
            ':producer_id' => $producerId,
        ]);
    }
}