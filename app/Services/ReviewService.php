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

        $row = $this->findReviewableOrderItem($orderItemId);

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

        $deliveredStatus = defined('ORDER_STATUS_DELIVERED') ? ORDER_STATUS_DELIVERED : 'delivered';

        if ((string) ($row['order_status'] ?? '') !== $deliveredStatus) {
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
        $orderItemId = (int) ($input['order_item_id'] ?? $input['review_order_item_id'] ?? 0);
        $rating = (int) ($input['rating'] ?? 0);
        $comment = trim((string) ($input['comment'] ?? ''));

        $errors = [];

        if ($orderItemId <= 0) {
            $errors['order_item_id'][] = 'Geçerli bir sipariş ürünü seçilmedi.';
        }

        if ($rating < 1 || $rating > 5) {
            $errors['rating'][] = 'Puan 1 ile 5 arasında olmalıdır.';
        }

        if ($this->textLength($comment) > 1000) {
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
                'message' => $canReview['message'] ?? 'Bu ürün için yorum yapılamaz.',
                'errors' => [],
            ];
        }

        $reviewData = $canReview['data'];
        $producerId = (int) $reviewData['producer_id'];
        $productId = isset($reviewData['product_id']) && $reviewData['product_id'] !== null
            ? (int) $reviewData['product_id']
            : null;

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
                    status
                ) VALUES (
                    :order_item_id,
                    :consumer_id,
                    :producer_id,
                    :product_id,
                    :rating,
                    :comment,
                    'visible'
                )
            ");

            $stmt->execute([
                'order_item_id' => $orderItemId,
                'consumer_id' => $consumerId,
                'producer_id' => $producerId,
                'product_id' => $productId,
                'rating' => $rating,
                'comment' => $comment !== '' ? $comment : null,
            ]);

            $reviewId = (int) $this->pdo->lastInsertId();

            $this->updateProductRating($productId);
            $this->updateProducerRating($producerId);
            $this->createNewReviewNotification($reviewId, $reviewData, $rating);

            $this->pdo->commit();

            return [
                'success' => true,
                'message' => 'Yorum başarıyla oluşturuldu.',
                'data' => [
                    'review_id' => $reviewId,
                    'order_item_id' => $orderItemId,
                    'order_id' => (int) $reviewData['order_id'],
                    'product_id' => $productId,
                    'producer_id' => $producerId,
                    'rating' => $rating,
                    'comment' => $comment,
                    'redirect_url' => $this->reviewTargetUrl($productId, $orderItemId),
                ],
            ];
        } catch (Throwable $e) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }

            if ($e instanceof PDOException && $e->getCode() === '23000') {
                return [
                    'success' => false,
                    'message' => 'Bu sipariş ürünü için daha önce yorum yapılmış.',
                    'errors' => [],
                ];
            }

            return [
                'success' => false,
                'message' => 'Yorum kaydedilirken bir hata oluştu: ' . $e->getMessage(),
                'errors' => [],
            ];
        }
    }

    public function store(int $consumerId, array $input): array
    {
        return $this->createReview($consumerId, $input);
    }

    public function hasReviewForOrderItem(int $orderItemId): bool
    {
        if ($orderItemId <= 0) {
            return false;
        }

        $stmt = $this->pdo->prepare("
            SELECT COUNT(*)
            FROM reviews
            WHERE order_item_id = :order_item_id
        ");

        $stmt->execute([
            'order_item_id' => $orderItemId,
        ]);

        return (int) $stmt->fetchColumn() > 0;
    }

    public function getReviewableOrderItemsForProduct(int $consumerId, int $productId): array
    {
        if ($consumerId <= 0 || $productId <= 0) {
            return [];
        }

        $deliveredStatus = defined('ORDER_STATUS_DELIVERED') ? ORDER_STATUS_DELIVERED : 'delivered';

        $stmt = $this->pdo->prepare("
            SELECT
                oi.id AS order_item_id,
                oi.order_id,
                oi.product_id,
                oi.product_title_snapshot,
                oi.quantity,
                oi.unit_type_snapshot,
                oi.created_at AS order_item_created_at,
                o.order_no,
                o.created_at AS order_created_at
            FROM order_items oi
            INNER JOIN orders o ON o.id = oi.order_id
            LEFT JOIN reviews r ON r.order_item_id = oi.id
            WHERE o.consumer_id = :consumer_id
              AND oi.product_id = :product_id
              AND o.order_status = :delivered_status
              AND r.id IS NULL
            ORDER BY o.created_at DESC, oi.id DESC
        ");

        $stmt->execute([
            'consumer_id' => $consumerId,
            'product_id' => $productId,
            'delivered_status' => $deliveredStatus,
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function getVisibleByProductId(int $productId, int $limit = 20): array
    {
        if ($productId <= 0) {
            return [];
        }

        $limit = max(1, min($limit, 100));

        $stmt = $this->pdo->prepare("
            SELECT
                r.*,
                u.full_name AS consumer_name,
                oi.product_title_snapshot
            FROM reviews r
            INNER JOIN users u ON u.id = r.consumer_id
            LEFT JOIN order_items oi ON oi.id = r.order_item_id
            WHERE r.product_id = :product_id
              AND r.status = 'visible'
            ORDER BY r.created_at DESC
            LIMIT {$limit}
        ");

        $stmt->execute([
            'product_id' => $productId,
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function getVisibleByProducerId(int $producerId, int $limit = 20): array
    {
        if ($producerId <= 0) {
            return [];
        }

        $limit = max(1, min($limit, 100));

        $stmt = $this->pdo->prepare("
            SELECT
                r.*,
                u.full_name AS consumer_name,
                COALESCE(p.title, oi.product_title_snapshot) AS product_title
            FROM reviews r
            INNER JOIN users u ON u.id = r.consumer_id
            LEFT JOIN products p ON p.id = r.product_id
            LEFT JOIN order_items oi ON oi.id = r.order_item_id
            WHERE r.producer_id = :producer_id
              AND r.status = 'visible'
            ORDER BY r.created_at DESC
            LIMIT {$limit}
        ");

        $stmt->execute([
            'producer_id' => $producerId,
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    private function findReviewableOrderItem(int $orderItemId): ?array
    {
        $stmt = $this->pdo->prepare("
            SELECT
                oi.id AS order_item_id,
                oi.order_id,
                oi.product_id,
                oi.product_title_snapshot,
                o.order_no,
                o.consumer_id,
                o.producer_id,
                o.order_status,
                o.created_at AS order_created_at,
                u.full_name AS consumer_name,
                p.title AS product_title,
                pp.store_name AS producer_store_name
            FROM order_items oi
            INNER JOIN orders o ON o.id = oi.order_id
            INNER JOIN users u ON u.id = o.consumer_id
            LEFT JOIN products p ON p.id = oi.product_id
            LEFT JOIN producer_profiles pp ON pp.user_id = o.producer_id
            WHERE oi.id = :order_item_id
            LIMIT 1
        ");

        $stmt->execute([
            'order_item_id' => $orderItemId,
        ]);

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ?: null;
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
            'product_id' => $productId,
        ]);

        $ratingData = $stmt->fetch(PDO::FETCH_ASSOC) ?: [
            'average_rating' => 0,
            'rating_count' => 0,
        ];

        $update = $this->pdo->prepare("
            UPDATE products
            SET average_rating = :average_rating,
                rating_count = :rating_count,
                updated_at = NOW()
            WHERE id = :product_id
            LIMIT 1
        ");

        $update->execute([
            'average_rating' => round((float) $ratingData['average_rating'], 2),
            'rating_count' => (int) $ratingData['rating_count'],
            'product_id' => $productId,
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
            'producer_id' => $producerId,
        ]);

        $ratingData = $stmt->fetch(PDO::FETCH_ASSOC) ?: [
            'average_rating' => 0,
            'rating_count' => 0,
        ];

        $update = $this->pdo->prepare("
            UPDATE producer_profiles
            SET average_rating = :average_rating,
                rating_count = :rating_count,
                updated_at = NOW()
            WHERE user_id = :producer_id
            LIMIT 1
        ");

        $update->execute([
            'average_rating' => round((float) $ratingData['average_rating'], 2),
            'rating_count' => (int) $ratingData['rating_count'],
            'producer_id' => $producerId,
        ]);
    }

    private function createNewReviewNotification(int $reviewId, array $reviewData, int $rating): void
    {
        $producerId = (int) ($reviewData['producer_id'] ?? 0);

        if ($producerId <= 0) {
            return;
        }

        $productId = isset($reviewData['product_id']) && $reviewData['product_id'] !== null
            ? (int) $reviewData['product_id']
            : null;

        $consumerName = trim((string) ($reviewData['consumer_name'] ?? 'Bir tüketici'));
        $productTitle = trim((string) ($reviewData['product_title'] ?? $reviewData['product_title_snapshot'] ?? 'ürününüz'));

        $title = 'Yeni ürün yorumu geldi';
        $message = $consumerName . ', ' . $productTitle . ' için ' . $rating . ' yıldızlı yorum bıraktı.';

        $data = [
            'review_id' => $reviewId,
            'order_id' => (int) ($reviewData['order_id'] ?? 0),
            'order_item_id' => (int) ($reviewData['order_item_id'] ?? 0),
            'order_no' => $reviewData['order_no'] ?? null,
            'product_id' => $productId,
            'producer_id' => $producerId,
            'consumer_id' => (int) ($reviewData['consumer_id'] ?? 0),
            'rating' => $rating,
            'url' => $this->reviewTargetUrl($productId, (int) ($reviewData['order_item_id'] ?? 0)),
        ];

        $this->createNotification($producerId, 'new_review', $title, $message, $data);
    }

    private function createNotification(int $userId, string $type, string $title, string $message, array $data = []): void
    {
        if ($userId <= 0) {
            return;
        }

        $stmt = $this->pdo->prepare("
            INSERT INTO notifications (
                user_id,
                type,
                title,
                message,
                data_json,
                is_read
            ) VALUES (
                :user_id,
                :type,
                :title,
                :message,
                :data_json,
                0
            )
        ");

        $stmt->execute([
            'user_id' => $userId,
            'type' => $type,
            'title' => $title,
            'message' => $message,
            'data_json' => !empty($data)
                ? json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES)
                : null,
        ]);
    }

    private function reviewTargetUrl(?int $productId, int $orderItemId = 0): string
    {
        if ($productId !== null && $productId > 0) {
            return 'product-detail.php?id=' . $productId . '#reviews';
        }

        return 'consumer/orders.php?review_order_item_id=' . $orderItemId;
    }

    private function textLength(string $text): int
    {
        if (function_exists('mb_strlen')) {
            return mb_strlen($text, 'UTF-8');
        }

        return strlen($text);
    }
}