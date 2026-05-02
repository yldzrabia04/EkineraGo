<?php

class Category
{
    public static function allActive(): array
    {
        $stmt = db()->query("
            SELECT *
            FROM categories
            WHERE is_active = 1
            ORDER BY name ASC
        ");

        return $stmt->fetchAll();
    }

    public static function findById(int $id): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM categories
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $id,
        ]);

        $category = $stmt->fetch();

        return $category ?: null;
    }

    public static function findBySlug(string $slug): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM categories
            WHERE slug = :slug
            LIMIT 1
        ");

        $stmt->execute([
            'slug' => $slug,
        ]);

        $category = $stmt->fetch();

        return $category ?: null;
    }

    public static function create(array $data): int
    {
        $name = trim($data['name']);
        $slug = $data['slug'] ?? slugify($name);

        $stmt = db()->prepare("
            INSERT INTO categories (
                parent_id,
                name,
                slug,
                type,
                is_active
            ) VALUES (
                :parent_id,
                :name,
                :slug,
                :type,
                :is_active
            )
        ");

        $stmt->execute([
            'parent_id' => $data['parent_id'] ?? null,
            'name' => $name,
            'slug' => $slug,
            'type' => $data['type'] ?? 'other',
            'is_active' => isset($data['is_active']) ? (int) $data['is_active'] : 1,
        ]);

        return (int) db()->lastInsertId();
    }

    public static function getOptionsForSelect(): array
    {
        $categories = self::allActive();
        $options = [];

        foreach ($categories as $category) {
            $options[(int) $category['id']] = $category['name'];
        }

        return $options;
    }
}