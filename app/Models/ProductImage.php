<?php

class ProductImage
{
    public static function create(array $data): int
    {
        $stmt = db()->prepare("
            INSERT INTO product_images (
                product_id,
                image_path,
                sort_order,
                is_cover
            ) VALUES (
                :product_id,
                :image_path,
                :sort_order,
                :is_cover
            )
        ");

        $stmt->execute([
            'product_id' => $data['product_id'],
            'image_path' => $data['image_path'],
            'sort_order' => $data['sort_order'] ?? 0,
            'is_cover' => !empty($data['is_cover']) ? 1 : 0,
        ]);

        return (int) db()->lastInsertId();
    }

    public static function getByProductId(int $productId): array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM product_images
            WHERE product_id = :product_id
            ORDER BY is_cover DESC, sort_order ASC, id ASC
        ");

        $stmt->execute([
            'product_id' => $productId,
        ]);

        return $stmt->fetchAll();
    }

    public static function getCoverByProductId(int $productId): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM product_images
            WHERE product_id = :product_id
            ORDER BY is_cover DESC, sort_order ASC, id ASC
            LIMIT 1
        ");

        $stmt->execute([
            'product_id' => $productId,
        ]);

        $image = $stmt->fetch();

        return $image ?: null;
    }

    public static function setCover(int $productId, int $imageId): void
    {
        db_transaction(function () use ($productId, $imageId) {
            $stmt = db()->prepare("
                UPDATE product_images
                SET is_cover = 0
                WHERE product_id = :product_id
            ");

            $stmt->execute([
                'product_id' => $productId,
            ]);

            $stmt = db()->prepare("
                UPDATE product_images
                SET is_cover = 1
                WHERE id = :id
                  AND product_id = :product_id
                LIMIT 1
            ");

            $stmt->execute([
                'id' => $imageId,
                'product_id' => $productId,
            ]);
        });
    }

    public static function delete(int $imageId, int $productId): void
    {
        $stmt = db()->prepare("
            DELETE FROM product_images
            WHERE id = :id
              AND product_id = :product_id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $imageId,
            'product_id' => $productId,
        ]);
    }

    public static function deleteByProductId(int $productId): void
    {
        $stmt = db()->prepare("
            DELETE FROM product_images
            WHERE product_id = :product_id
        ");

        $stmt->execute([
            'product_id' => $productId,
        ]);
    }

    public static function countByProductId(int $productId): int
    {
        $stmt = db()->prepare("
            SELECT COUNT(*) AS total
            FROM product_images
            WHERE product_id = :product_id
        ");

        $stmt->execute([
            'product_id' => $productId,
        ]);

        $row = $stmt->fetch();

        return (int) ($row['total'] ?? 0);
    }
}