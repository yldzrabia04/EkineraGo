<?php

class Favorite
{
    public static function exists(int $userId, int $productId): bool
    {
        $stmt = db()->prepare("
            SELECT product_id
            FROM favorites
            WHERE user_id = :user_id
              AND product_id = :product_id
            LIMIT 1
        ");

        $stmt->execute([
            'user_id' => $userId,
            'product_id' => $productId,
        ]);

        return (bool) $stmt->fetch();
    }

    public static function add(int $userId, int $productId): void
    {
        $stmt = db()->prepare("
            INSERT IGNORE INTO favorites (
                user_id,
                product_id
            ) VALUES (
                :user_id,
                :product_id
            )
        ");

        $stmt->execute([
            'user_id' => $userId,
            'product_id' => $productId,
        ]);
    }

    public static function remove(int $userId, int $productId): void
    {
        $stmt = db()->prepare("
            DELETE FROM favorites
            WHERE user_id = :user_id
              AND product_id = :product_id
        ");

        $stmt->execute([
            'user_id' => $userId,
            'product_id' => $productId,
        ]);
    }

    public static function toggle(int $userId, int $productId): bool
    {
        if (self::exists($userId, $productId)) {
            self::remove($userId, $productId);
            return false;
        }

        self::add($userId, $productId);
        return true;
    }

    public static function getByUserId(int $userId): array
    {
        $stmt = db()->prepare("
            SELECT
                f.created_at AS favorited_at,
                p.*,
                u.full_name AS producer_name,
                pp.store_name
            FROM favorites f
            JOIN products p ON p.id = f.product_id
            JOIN users u ON u.id = p.producer_id
            LEFT JOIN producer_profiles pp ON pp.user_id = u.id
            WHERE f.user_id = :user_id
              AND p.deleted_at IS NULL
            ORDER BY f.created_at DESC
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        return $stmt->fetchAll();
    }

    public static function countByProductId(int $productId): int
    {
        $stmt = db()->prepare("
            SELECT COUNT(*) AS total
            FROM favorites
            WHERE product_id = :product_id
        ");

        $stmt->execute([
            'product_id' => $productId,
        ]);

        $row = $stmt->fetch();

        return (int) ($row['total'] ?? 0);
    }
}