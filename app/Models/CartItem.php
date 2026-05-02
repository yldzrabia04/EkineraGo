<?php

class CartItem
{
    public static function findByCartAndProduct(int $cartId, int $productId): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM cart_items
            WHERE cart_id = :cart_id
              AND product_id = :product_id
            LIMIT 1
        ");

        $stmt->execute([
            'cart_id' => $cartId,
            'product_id' => $productId,
        ]);

        $item = $stmt->fetch();

        return $item ?: null;
    }

    public static function findById(int $id): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM cart_items
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $id,
        ]);

        $item = $stmt->fetch();

        return $item ?: null;
    }

    public static function create(int $cartId, int $productId, float $quantity): int
    {
        $stmt = db()->prepare("
            INSERT INTO cart_items (
                cart_id,
                product_id,
                quantity
            ) VALUES (
                :cart_id,
                :product_id,
                :quantity
            )
        ");

        $stmt->execute([
            'cart_id' => $cartId,
            'product_id' => $productId,
            'quantity' => $quantity,
        ]);

        return (int) db()->lastInsertId();
    }

    public static function increaseQuantity(int $cartItemId, float $quantity): void
    {
        $stmt = db()->prepare("
            UPDATE cart_items
            SET quantity = quantity + :quantity,
                updated_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $cartItemId,
            'quantity' => $quantity,
        ]);
    }

    public static function updateQuantity(int $cartItemId, float $quantity): void
    {
        $stmt = db()->prepare("
            UPDATE cart_items
            SET quantity = :quantity,
                updated_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $cartItemId,
            'quantity' => $quantity,
        ]);
    }

    public static function delete(int $cartItemId): void
    {
        $stmt = db()->prepare("
            DELETE FROM cart_items
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $cartItemId,
        ]);
    }

    public static function getItemsByCartId(int $cartId): array
    {
        $stmt = db()->prepare("
            SELECT
                ci.*,
                p.title,
                p.price,
                p.unit_type,
                p.stock_quantity,
                p.status AS product_status,
                p.producer_id,
                u.full_name AS producer_name,
                pp.store_name
            FROM cart_items ci
            JOIN products p ON p.id = ci.product_id
            JOIN users u ON u.id = p.producer_id
            LEFT JOIN producer_profiles pp ON pp.user_id = u.id
            WHERE ci.cart_id = :cart_id
            ORDER BY ci.created_at DESC
        ");

        $stmt->execute([
            'cart_id' => $cartId,
        ]);

        return $stmt->fetchAll();
    }

    public static function clearByCartId(int $cartId): void
    {
        $stmt = db()->prepare("
            DELETE FROM cart_items
            WHERE cart_id = :cart_id
        ");

        $stmt->execute([
            'cart_id' => $cartId,
        ]);
    }
}