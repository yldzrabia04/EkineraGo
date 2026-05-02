<?php

class WalletTransaction
{
    public static function create(array $data): int
    {
        $stmt = db()->prepare("
            INSERT INTO wallet_transactions (
                user_id,
                transaction_type,
                amount,
                balance_after,
                order_id,
                description
            ) VALUES (
                :user_id,
                :transaction_type,
                :amount,
                :balance_after,
                :order_id,
                :description
            )
        ");

        $stmt->execute([
            'user_id' => $data['user_id'],
            'transaction_type' => $data['transaction_type'],
            'amount' => $data['amount'],
            'balance_after' => $data['balance_after'],
            'order_id' => $data['order_id'] ?? null,
            'description' => $data['description'] ?? null,
        ]);

        return (int) db()->lastInsertId();
    }

    public static function getByUserId(int $userId, int $limit = 30): array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM wallet_transactions
            WHERE user_id = :user_id
            ORDER BY created_at DESC
            LIMIT {$limit}
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        return $stmt->fetchAll();
    }

    public static function getByOrderId(int $orderId): array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM wallet_transactions
            WHERE order_id = :order_id
            ORDER BY created_at DESC
        ");

        $stmt->execute([
            'order_id' => $orderId,
        ]);

        return $stmt->fetchAll();
    }

    public static function createDeposit(int $userId, float $amount, float $balanceAfter): int
    {
        return self::create([
            'user_id' => $userId,
            'transaction_type' => WALLET_TRANSACTION_DEPOSIT,
            'amount' => $amount,
            'balance_after' => $balanceAfter,
            'description' => 'Sanal bakiye yükleme',
        ]);
    }

    public static function createPurchase(int $userId, float $amount, float $balanceAfter, ?int $orderId = null): int
    {
        return self::create([
            'user_id' => $userId,
            'transaction_type' => WALLET_TRANSACTION_PURCHASE,
            'amount' => -abs($amount),
            'balance_after' => $balanceAfter,
            'order_id' => $orderId,
            'description' => 'Sanal bakiye ile satın alma',
        ]);
    }

    public static function createRefund(int $userId, float $amount, float $balanceAfter, ?int $orderId = null): int
    {
        return self::create([
            'user_id' => $userId,
            'transaction_type' => WALLET_TRANSACTION_REFUND,
            'amount' => abs($amount),
            'balance_after' => $balanceAfter,
            'order_id' => $orderId,
            'description' => 'Sipariş iadesi',
        ]);
    }
}