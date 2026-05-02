<?php



class Wallet
{
    public static function createForUser(int $userId): void
    {
        $stmt = db()->prepare("
            INSERT INTO wallets (
                user_id,
                balance
            ) VALUES (
                :user_id,
                0.00
            )
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);
    }

    public static function findByUserId(int $userId): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM wallets
            WHERE user_id = :user_id
            LIMIT 1
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        $wallet = $stmt->fetch();

        return $wallet ?: null;
    }
}