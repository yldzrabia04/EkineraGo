<?php

class Review
{
    public static function create(array $data): int
    {
        $stmt = db()->prepare("
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
                :status
            )
        ");

        $stmt->execute([
            'order_item_id' => $data['order_item_id'],
            'consumer_id' => $data['consumer_id'],
            'producer_id' => $data['producer_id'],
            'product_id' => $data['product_id'] ?? null,
            'rating' => $data['rating'],
            'comment' => $data['comment'] ?? null,
            'status' => $data['status'] ?? 'visible',
        ]);

        return (int) db()->lastInsertId();
    }

    public static function findByOrderItemId(int $orderItemId): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM reviews
            WHERE order_item_id = :order_item_id
            LIMIT 1
        ");

        $stmt->execute([
            'order_item_id' => $orderItemId,
        ]);

        $review = $stmt->fetch();

        return $review ?: null;
    }

    public static function getVisibleByProductId(int $productId): array
    {
        $stmt = db()->prepare("
            SELECT
                r.*,
                u.full_name AS consumer_name
            FROM reviews r
            JOIN users u ON u.id = r.consumer_id
            WHERE r.product_id = :product_id
              AND r.status = 'visible'
            ORDER BY r.created_at DESC
        ");

        $stmt->execute([
            'product_id' => $productId,
        ]);

        return $stmt->fetchAll();
    }

    public static function getVisibleByProducerId(int $producerId): array
    {
        $stmt = db()->prepare("
            SELECT
                r.*,
                u.full_name AS consumer_name,
                p.title AS product_title
            FROM reviews r
            JOIN users u ON u.id = r.consumer_id
            LEFT JOIN products p ON p.id = r.product_id
            WHERE r.producer_id = :producer_id
              AND r.status = 'visible'
            ORDER BY r.created_at DESC
        ");

        $stmt->execute([
            'producer_id' => $producerId,
        ]);

        return $stmt->fetchAll();
    }

    public static function ratingSummaryForProduct(int $productId): array
    {
        $stmt = db()->prepare("
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

        return $stmt->fetch() ?: [
            'average_rating' => 0,
            'rating_count' => 0,
        ];
    }

    public static function ratingSummaryForProducer(int $producerId): array
    {
        $stmt = db()->prepare("
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

        return $stmt->fetch() ?: [
            'average_rating' => 0,
            'rating_count' => 0,
        ];
    }

    public static function hide(int $reviewId): void
    {
        $stmt = db()->prepare("
            UPDATE reviews
            SET status = 'hidden',
                updated_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $reviewId,
        ]);
    }

    public static function deleteSoft(int $reviewId): void
    {
        $stmt = db()->prepare("
            UPDATE reviews
            SET status = 'deleted',
                updated_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $reviewId,
        ]);
    }
}