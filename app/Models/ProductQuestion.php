<?php

class ProductQuestion
{
    private PDO $pdo;

    public function __construct(?PDO $pdo = null)
    {
        if ($pdo instanceof PDO) {
            $this->pdo = $pdo;
            return;
        }

        if (function_exists('db')) {
            $this->pdo = db();
            return;
        }

        if (isset($GLOBALS['pdo']) && $GLOBALS['pdo'] instanceof PDO) {
            $this->pdo = $GLOBALS['pdo'];
            return;
        }

        throw new RuntimeException('PDO bağlantısı bulunamadı.');
    }

    public function create(array $data): int
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO product_questions (
                product_id,
                consumer_id,
                producer_id,
                question,
                status
            ) VALUES (
                :product_id,
                :consumer_id,
                :producer_id,
                :question,
                'pending'
            )
        ");

        $stmt->execute([
            'product_id' => (int) $data['product_id'],
            'consumer_id' => (int) $data['consumer_id'],
            'producer_id' => (int) $data['producer_id'],
            'question' => trim((string) $data['question']),
        ]);

        return (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?array
    {
        if ($id <= 0) {
            return null;
        }

        $stmt = $this->pdo->prepare("
            SELECT
                pq.*,
                p.title AS product_title,
                p.slug AS product_slug,
                cu.full_name AS consumer_name,
                pu.full_name AS producer_name,
                pp.store_name AS producer_store_name
            FROM product_questions pq
            INNER JOIN products p ON p.id = pq.product_id
            INNER JOIN users cu ON cu.id = pq.consumer_id
            INNER JOIN users pu ON pu.id = pq.producer_id
            LEFT JOIN producer_profiles pp ON pp.user_id = pq.producer_id
            WHERE pq.id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $id,
        ]);

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ?: null;
    }

    public function getPublicByProductId(int $productId, int $limit = 30): array
    {
        if ($productId <= 0) {
            return [];
        }

        $limit = max(1, min($limit, 100));

        $stmt = $this->pdo->prepare("
            SELECT
                pq.*,
                cu.full_name AS consumer_name,
                pp.store_name AS producer_store_name
            FROM product_questions pq
            INNER JOIN users cu ON cu.id = pq.consumer_id
            LEFT JOIN producer_profiles pp ON pp.user_id = pq.producer_id
            WHERE pq.product_id = :product_id
              AND pq.status IN ('pending', 'answered')
            ORDER BY pq.created_at DESC
            LIMIT {$limit}
        ");

        $stmt->execute([
            'product_id' => $productId,
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function getByProducerId(int $producerId, string $status = '', int $limit = 100): array
    {
        if ($producerId <= 0) {
            return [];
        }

        $limit = max(1, min($limit, 200));

        $sql = "
            SELECT
                pq.*,
                p.title AS product_title,
                p.price AS product_price,
                p.unit_type AS product_unit_type,
                cu.full_name AS consumer_name
            FROM product_questions pq
            INNER JOIN products p ON p.id = pq.product_id
            INNER JOIN users cu ON cu.id = pq.consumer_id
            WHERE pq.producer_id = :producer_id
              AND pq.status != 'deleted'
        ";

        $params = [
            'producer_id' => $producerId,
        ];

        if ($status !== '') {
            $sql .= " AND pq.status = :status ";
            $params['status'] = $status;
        } else {
            $sql .= " AND pq.status IN ('pending', 'answered', 'hidden') ";
        }

        $sql .= "
            ORDER BY
                CASE pq.status
                    WHEN 'pending' THEN 1
                    WHEN 'answered' THEN 2
                    WHEN 'hidden' THEN 3
                    ELSE 4
                END,
                pq.created_at DESC
            LIMIT {$limit}
        ";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function getByConsumerId(int $consumerId, int $limit = 100): array
    {
        if ($consumerId <= 0) {
            return [];
        }

        $limit = max(1, min($limit, 200));

        $stmt = $this->pdo->prepare("
            SELECT
                pq.*,
                p.title AS product_title,
                p.price AS product_price,
                p.unit_type AS product_unit_type,
                pp.store_name AS producer_store_name
            FROM product_questions pq
            INNER JOIN products p ON p.id = pq.product_id
            LEFT JOIN producer_profiles pp ON pp.user_id = pq.producer_id
            WHERE pq.consumer_id = :consumer_id
              AND pq.status != 'deleted'
            ORDER BY pq.created_at DESC
            LIMIT {$limit}
        ");

        $stmt->execute([
            'consumer_id' => $consumerId,
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function answer(int $questionId, int $producerId, string $answer): bool
    {
        if ($questionId <= 0 || $producerId <= 0) {
            return false;
        }

        $stmt = $this->pdo->prepare("
            UPDATE product_questions
            SET answer = :answer,
                status = 'answered',
                answered_at = NOW(),
                updated_at = NOW()
            WHERE id = :id
              AND producer_id = :producer_id
              AND status IN ('pending', 'answered')
            LIMIT 1
        ");

        $stmt->execute([
            'answer' => trim($answer),
            'id' => $questionId,
            'producer_id' => $producerId,
        ]);

        return $stmt->rowCount() > 0;
    }

    public function hide(int $questionId, int $producerId): bool
    {
        if ($questionId <= 0 || $producerId <= 0) {
            return false;
        }

        $stmt = $this->pdo->prepare("
            UPDATE product_questions
            SET status = 'hidden',
                updated_at = NOW()
            WHERE id = :id
              AND producer_id = :producer_id
              AND status != 'deleted'
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $questionId,
            'producer_id' => $producerId,
        ]);

        return $stmt->rowCount() > 0;
    }

    public function deleteForConsumer(int $questionId, int $consumerId): bool
    {
        if ($questionId <= 0 || $consumerId <= 0) {
            return false;
        }

        $stmt = $this->pdo->prepare("
            UPDATE product_questions
            SET status = 'deleted',
                updated_at = NOW()
            WHERE id = :id
              AND consumer_id = :consumer_id
              AND status = 'pending'
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $questionId,
            'consumer_id' => $consumerId,
        ]);

        return $stmt->rowCount() > 0;
    }

    public function countPendingByProducerId(int $producerId): int
    {
        if ($producerId <= 0) {
            return 0;
        }

        $stmt = $this->pdo->prepare("
            SELECT COUNT(*)
            FROM product_questions
            WHERE producer_id = :producer_id
              AND status = 'pending'
        ");

        $stmt->execute([
            'producer_id' => $producerId,
        ]);

        return (int) $stmt->fetchColumn();
    }

    public function productBelongsToProducer(int $productId, int $producerId): bool
    {
        if ($productId <= 0 || $producerId <= 0) {
            return false;
        }

        $stmt = $this->pdo->prepare("
            SELECT COUNT(*)
            FROM products
            WHERE id = :product_id
              AND producer_id = :producer_id
            LIMIT 1
        ");

        $stmt->execute([
            'product_id' => $productId,
            'producer_id' => $producerId,
        ]);

        return (int) $stmt->fetchColumn() > 0;
    }
}