<?php



class User
{
    public static function findById(int $id): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM users
            WHERE id = :id
              AND deleted_at IS NULL
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $id,
        ]);

        $user = $stmt->fetch();

        return $user ?: null;
    }

    public static function findByEmail(string $email): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM users
            WHERE email = :email
              AND deleted_at IS NULL
            LIMIT 1
        ");

        $stmt->execute([
            'email' => mb_strtolower(trim($email), 'UTF-8'),
        ]);

        $user = $stmt->fetch();

        return $user ?: null;
    }

    public static function emailExists(string $email): bool
    {
        return self::findByEmail($email) !== null;
    }

    public static function create(array $data): int
    {
        $stmt = db()->prepare("
            INSERT INTO users (
                role,
                full_name,
                email,
                password_hash,
                phone,
                whatsapp_phone,
                province_id,
                district_id,
                address_text,
                status
            ) VALUES (
                :role,
                :full_name,
                :email,
                :password_hash,
                :phone,
                :whatsapp_phone,
                :province_id,
                :district_id,
                :address_text,
                :status
            )
        ");

        $stmt->execute([
            'role' => $data['role'],
            'full_name' => $data['full_name'],
            'email' => mb_strtolower(trim($data['email']), 'UTF-8'),
            'password_hash' => password_hash($data['password'], PASSWORD_DEFAULT),
            'phone' => $data['phone'] ?? null,
            'whatsapp_phone' => $data['whatsapp_phone'] ?? null,
            'province_id' => $data['province_id'] ?? null,
            'district_id' => $data['district_id'] ?? null,
            'address_text' => $data['address_text'] ?? null,
            'status' => $data['status'] ?? USER_STATUS_ACTIVE,
        ]);

        return (int) db()->lastInsertId();
    }

    public static function updateLastLogin(int $id): void
    {
        $stmt = db()->prepare("
            UPDATE users
            SET last_login_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $id,
        ]);
    }
}