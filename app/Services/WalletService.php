<?php

class WalletService
{
    public function getBalance(int $userId): float
    {
        $wallet = $this->getOrCreateWallet($userId);

        return (float) ($wallet['balance'] ?? 0);
    }

    public function getWallet(int $userId): array
    {
        return $this->getOrCreateWallet($userId);
    }

    public function deposit(int $userId, float $amount): array
    {
        if ($userId <= 0) {
            return [
                'success' => false,
                'message' => 'Bakiye işlemi için giriş yapmalısınız.',
            ];
        }

        if ($amount <= 0) {
            return [
                'success' => false,
                'message' => 'Yüklenecek tutar 0’dan büyük olmalıdır.',
            ];
        }

        try {
            $result = db_transaction(function () use ($userId, $amount) {
                $wallet = $this->getWalletForUpdate($userId);
                $currentBalance = (float) ($wallet['balance'] ?? 0);
                $newBalance = $currentBalance + $amount;

                $stmt = db()->prepare("
                    UPDATE wallets
                    SET balance = :balance,
                        updated_at = NOW()
                    WHERE user_id = :user_id
                    LIMIT 1
                ");

                $stmt->execute([
                    'user_id' => $userId,
                    'balance' => $newBalance,
                ]);

                WalletTransaction::createDeposit($userId, $amount, $newBalance);

                return [
                    'balance_before' => $currentBalance,
                    'balance_after' => $newBalance,
                ];
            });

            return [
                'success' => true,
                'message' => 'Sanal bakiye başarıyla yüklendi.',
                'data' => [
                    'user_id' => $userId,
                    'amount' => $amount,
                    'balance_before' => $result['balance_before'],
                    'balance_after' => $result['balance_after'],
                ],
            ];
        } catch (Throwable $e) {
            return [
                'success' => false,
                'message' => 'Bakiye yükleme sırasında bir hata oluştu.',
            ];
        }
    }

    public function withdrawForPurchase(int $userId, float $amount, ?int $orderId = null): array
    {
        if ($userId <= 0) {
            return [
                'success' => false,
                'message' => 'Bakiye işlemi için giriş yapmalısınız.',
            ];
        }

        if ($amount <= 0) {
            return [
                'success' => false,
                'message' => 'Çekilecek tutar 0’dan büyük olmalıdır.',
            ];
        }

        try {
            $result = db_transaction(function () use ($userId, $amount, $orderId) {
                $wallet = $this->getWalletForUpdate($userId);
                $currentBalance = (float) ($wallet['balance'] ?? 0);

                if ($currentBalance < $amount) {
                    throw new RuntimeException('Sanal bakiye yetersiz.');
                }

                $newBalance = $currentBalance - $amount;

                $stmt = db()->prepare("
                    UPDATE wallets
                    SET balance = :balance,
                        updated_at = NOW()
                    WHERE user_id = :user_id
                    LIMIT 1
                ");

                $stmt->execute([
                    'user_id' => $userId,
                    'balance' => $newBalance,
                ]);

                WalletTransaction::createPurchase($userId, $amount, $newBalance, $orderId);

                return [
                    'balance_before' => $currentBalance,
                    'balance_after' => $newBalance,
                ];
            });

            return [
                'success' => true,
                'message' => 'Satın alma için bakiye düşüldü.',
                'data' => [
                    'user_id' => $userId,
                    'amount' => $amount,
                    'balance_before' => $result['balance_before'],
                    'balance_after' => $result['balance_after'],
                    'order_id' => $orderId,
                ],
            ];
        } catch (Throwable $e) {
            return [
                'success' => false,
                'message' => $e->getMessage() ?: 'Bakiye düşme işlemi başarısız.',
            ];
        }
    }

    public function refund(int $userId, float $amount, ?int $orderId = null): array
    {
        if ($userId <= 0) {
            return [
                'success' => false,
                'message' => 'Bakiye işlemi için giriş yapmalısınız.',
            ];
        }

        if ($amount <= 0) {
            return [
                'success' => false,
                'message' => 'İade tutarı 0’dan büyük olmalıdır.',
            ];
        }

        try {
            $result = db_transaction(function () use ($userId, $amount, $orderId) {
                $wallet = $this->getWalletForUpdate($userId);
                $currentBalance = (float) ($wallet['balance'] ?? 0);
                $newBalance = $currentBalance + $amount;

                $stmt = db()->prepare("
                    UPDATE wallets
                    SET balance = :balance,
                        updated_at = NOW()
                    WHERE user_id = :user_id
                    LIMIT 1
                ");

                $stmt->execute([
                    'user_id' => $userId,
                    'balance' => $newBalance,
                ]);

                WalletTransaction::createRefund($userId, $amount, $newBalance, $orderId);

                return [
                    'balance_before' => $currentBalance,
                    'balance_after' => $newBalance,
                ];
            });

            return [
                'success' => true,
                'message' => 'İade işlemi yapıldı.',
                'data' => [
                    'user_id' => $userId,
                    'amount' => $amount,
                    'balance_before' => $result['balance_before'],
                    'balance_after' => $result['balance_after'],
                    'order_id' => $orderId,
                ],
            ];
        } catch (Throwable $e) {
            return [
                'success' => false,
                'message' => 'İade işlemi sırasında bir hata oluştu.',
            ];
        }
    }

    public function getTransactions(int $userId): array
    {
        if ($userId <= 0) {
            return [];
        }

        return WalletTransaction::getByUserId($userId);
    }

    private function getOrCreateWallet(int $userId): array
    {
        if ($userId <= 0) {
            return [
                'id' => null,
                'user_id' => null,
                'balance' => 0,
            ];
        }

        $wallet = Wallet::findByUserId($userId);

        if ($wallet) {
            return $wallet;
        }

        Wallet::createForUser($userId);

        return Wallet::findByUserId($userId) ?: [
            'id' => null,
            'user_id' => $userId,
            'balance' => 0,
        ];
    }

    private function getWalletForUpdate(int $userId): array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM wallets
            WHERE user_id = :user_id
            LIMIT 1
            FOR UPDATE
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        $wallet = $stmt->fetch();

        if ($wallet) {
            return $wallet;
        }

        Wallet::createForUser($userId);

        $stmt = db()->prepare("
            SELECT *
            FROM wallets
            WHERE user_id = :user_id
            LIMIT 1
            FOR UPDATE
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        $wallet = $stmt->fetch();

        if (!$wallet) {
            throw new RuntimeException('Cüzdan oluşturulamadı.');
        }

        return $wallet;
    }
}