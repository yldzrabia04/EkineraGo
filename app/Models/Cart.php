<?php

class Cart
{
    public static function findActiveByUserId(int $userId): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM carts
            WHERE user_id = :user_id
              AND status = 'active'
            ORDER BY id DESC
            LIMIT 1
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        $cart = $stmt->fetch();

        return $cart ?: null;
    }

    public static function create(int $userId): int
    {
        $stmt = db()->prepare("
            INSERT INTO carts (
                user_id,
                status
            ) VALUES (
                :user_id,
                'active'
            )
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        return (int) db()->lastInsertId();
    }

    public static function getOrCreateActiveByUserId(int $userId): array
    {
        $cart = self::findActiveByUserId($userId);

        if ($cart) {
            return $cart;
        }

        $cartId = self::create($userId);

        return self::findById($cartId);
    }

    public static function findById(int $id): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM carts
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $id,
        ]);

        $cart = $stmt->fetch();

        return $cart ?: null;
    }

    public static function markCheckedOut(int $cartId): void
    {
        $stmt = db()->prepare("
            UPDATE carts
            SET status = 'checked_out',
                updated_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $cartId,
        ]);
    }

    public static function markAbandoned(int $cartId): void
    {
        $stmt = db()->prepare("
            UPDATE carts
            SET status = 'abandoned',
                updated_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $cartId,
        ]);
    }
}