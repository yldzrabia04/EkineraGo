<?php



class ProducerProfile
{
    public static function create(int $userId, array $data): void
    {
        $storeName = trim($data['store_name']);
        $slug = self::uniqueSlug($storeName);

        $stmt = db()->prepare("
            INSERT INTO producer_profiles (
                user_id,
                store_name,
                slug,
                description,
                contact_email,
                contact_phone,
                contact_whatsapp,
                verification_status
            ) VALUES (
                :user_id,
                :store_name,
                :slug,
                :description,
                :contact_email,
                :contact_phone,
                :contact_whatsapp,
                :verification_status
            )
        ");

        $stmt->execute([
            'user_id' => $userId,
            'store_name' => $storeName,
            'slug' => $slug,
            'description' => $data['description'] ?? null,
            'contact_email' => $data['contact_email'] ?? null,
            'contact_phone' => $data['contact_phone'] ?? null,
            'contact_whatsapp' => $data['contact_whatsapp'] ?? null,
            'verification_status' => 'pending',
        ]);
    }

    public static function findByUserId(int $userId): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM producer_profiles
            WHERE user_id = :user_id
            LIMIT 1
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        $profile = $stmt->fetch();

        return $profile ?: null;
    }

    public static function findBySlug(string $slug): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM producer_profiles
            WHERE slug = :slug
            LIMIT 1
        ");

        $stmt->execute([
            'slug' => $slug,
        ]);

        $profile = $stmt->fetch();

        return $profile ?: null;
    }

    public static function uniqueSlug(string $storeName): string
    {
        $baseSlug = slugify($storeName);
        $slug = $baseSlug;
        $counter = 1;

        while (self::findBySlug($slug) !== null) {
            $slug = $baseSlug . '-' . $counter;
            $counter++;
        }

        return $slug;
    }
}
