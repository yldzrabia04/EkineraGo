<?php



class ConsumerProfile
{
    public static function create(int $userId, ?string $bio = null): void
    {
        $stmt = db()->prepare("
            INSERT INTO consumer_profiles (
                user_id,
                bio
            ) VALUES (
                :user_id,
                :bio
            )
        ");

        $stmt->execute([
            'user_id' => $userId,
            'bio' => $bio,
        ]);
    }

    public static function findByUserId(int $userId): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM consumer_profiles
            WHERE user_id = :user_id
            LIMIT 1
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        $profile = $stmt->fetch();

        return $profile ?: null;
    }
}