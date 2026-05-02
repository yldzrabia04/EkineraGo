<?php

class ProductQuestionService
{
    private PDO $pdo;
    private ProductQuestion $questionModel;

    public function __construct(?PDO $pdo = null)
    {
        if ($pdo instanceof PDO) {
            $this->pdo = $pdo;
        } elseif (function_exists('db')) {
            $this->pdo = db();
        } elseif (isset($GLOBALS['pdo']) && $GLOBALS['pdo'] instanceof PDO) {
            $this->pdo = $GLOBALS['pdo'];
        } else {
            throw new RuntimeException('PDO bağlantısı bulunamadı.');
        }

        if (!class_exists('ProductQuestion') && defined('APP_PATH')) {
            require_once APP_PATH . '/Models/ProductQuestion.php';
        }

        $this->questionModel = new ProductQuestion($this->pdo);
    }

    public function getPublicQuestionsByProductId(int $productId, int $limit = 30): array
    {
        return $this->questionModel->getPublicByProductId($productId, $limit);
    }

    public function getProducerQuestions(int $producerId, string $status = ''): array
    {
        return $this->questionModel->getByProducerId($producerId, $status);
    }

    public function askQuestion(int $consumerId, array $input): array
    {
        $productId = (int) ($input['product_id'] ?? 0);
        $question = trim((string) ($input['question'] ?? ''));

        $errors = [];

        if ($consumerId <= 0) {
            return [
                'success' => false,
                'message' => 'Soru sormak için giriş yapmalısınız.',
                'errors' => [],
            ];
        }

        if ($productId <= 0) {
            $errors['product_id'][] = 'Geçerli bir ürün seçilmedi.';
        }

        if ($question === '') {
            $errors['question'][] = 'Soru alanı boş bırakılamaz.';
        }

        if ($this->textLength($question) < 3) {
            $errors['question'][] = 'Soru en az 3 karakter olmalıdır.';
        }

        if ($this->textLength($question) > 1000) {
            $errors['question'][] = 'Soru en fazla 1000 karakter olabilir.';
        }

        if (!empty($errors)) {
            return [
                'success' => false,
                'message' => 'Lütfen formdaki hataları düzeltin.',
                'errors' => $errors,
            ];
        }

        $product = $this->findProductForQuestion($productId);

        if (!$product) {
            return [
                'success' => false,
                'message' => 'Ürün bulunamadı.',
                'errors' => [],
            ];
        }

        $producerId = (int) ($product['producer_id'] ?? 0);

        if ($producerId <= 0) {
            return [
                'success' => false,
                'message' => 'Bu ürün için üretici bilgisi bulunamadı.',
                'errors' => [],
            ];
        }

        if ($producerId === $consumerId) {
            return [
                'success' => false,
                'message' => 'Kendi ürününüze soru soramazsınız.',
                'errors' => [],
            ];
        }

        try {
            $this->pdo->beginTransaction();

            $questionId = $this->questionModel->create([
                'product_id' => $productId,
                'consumer_id' => $consumerId,
                'producer_id' => $producerId,
                'question' => $question,
            ]);

            $this->createNewQuestionNotification($questionId, $product, $consumerId, $question);

            $this->pdo->commit();

            $questionRow = $this->questionModel->findById($questionId);

            return [
                'success' => true,
                'message' => 'Sorun üreticiye gönderildi.',
                'data' => [
                    'question_id' => $questionId,
                    'product_id' => $productId,
                    'producer_id' => $producerId,
                    'question' => $question,
                    'status' => 'pending',
                    'url' => 'product-detail.php?id=' . $productId . '#questions',
                    'question_row' => $questionRow,
                ],
            ];
        } catch (Throwable $e) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }

            return [
                'success' => false,
                'message' => 'Soru gönderilirken bir hata oluştu: ' . $e->getMessage(),
                'errors' => [],
            ];
        }
    }

    public function answerQuestion(int $producerId, array $input): array
    {
        $questionId = (int) ($input['question_id'] ?? $input['id'] ?? 0);
        $answer = trim((string) ($input['answer'] ?? ''));

        $errors = [];

        if ($producerId <= 0) {
            return [
                'success' => false,
                'message' => 'Cevap vermek için üretici hesabıyla giriş yapmalısınız.',
                'errors' => [],
            ];
        }

        if ($questionId <= 0) {
            $errors['question_id'][] = 'Geçerli bir soru seçilmedi.';
        }

        if ($answer === '') {
            $errors['answer'][] = 'Cevap alanı boş bırakılamaz.';
        }

        if ($this->textLength($answer) < 2) {
            $errors['answer'][] = 'Cevap en az 2 karakter olmalıdır.';
        }

        if ($this->textLength($answer) > 1000) {
            $errors['answer'][] = 'Cevap en fazla 1000 karakter olabilir.';
        }

        if (!empty($errors)) {
            return [
                'success' => false,
                'message' => 'Lütfen formdaki hataları düzeltin.',
                'errors' => $errors,
            ];
        }

        $question = $this->questionModel->findById($questionId);

        if (!$question) {
            return [
                'success' => false,
                'message' => 'Soru bulunamadı.',
                'errors' => [],
            ];
        }

        if ((int) $question['producer_id'] !== $producerId) {
            return [
                'success' => false,
                'message' => 'Bu soruya cevap verme yetkiniz yok.',
                'errors' => [],
            ];
        }

        if (($question['status'] ?? '') === 'deleted') {
            return [
                'success' => false,
                'message' => 'Silinmiş bir soru cevaplanamaz.',
                'errors' => [],
            ];
        }

        try {
            $this->pdo->beginTransaction();

            $updated = $this->questionModel->answer($questionId, $producerId, $answer);

            if (!$updated) {
                throw new RuntimeException('Soru güncellenemedi.');
            }

            $updatedQuestion = $this->questionModel->findById($questionId);

            $this->createQuestionAnsweredNotification($updatedQuestion ?: $question, $answer);

            $this->pdo->commit();

            return [
                'success' => true,
                'message' => 'Cevabınız tüketiciye gönderildi.',
                'data' => [
                    'question_id' => $questionId,
                    'product_id' => (int) ($question['product_id'] ?? 0),
                    'consumer_id' => (int) ($question['consumer_id'] ?? 0),
                    'producer_id' => $producerId,
                    'answer' => $answer,
                    'status' => 'answered',
                    'url' => 'product-detail.php?id=' . (int) ($question['product_id'] ?? 0) . '#questions',
                    'question_row' => $updatedQuestion,
                ],
            ];
        } catch (Throwable $e) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }

            return [
                'success' => false,
                'message' => 'Cevap gönderilirken bir hata oluştu: ' . $e->getMessage(),
                'errors' => [],
            ];
        }
    }

    public function hideQuestion(int $producerId, int $questionId): array
    {
        if ($producerId <= 0 || $questionId <= 0) {
            return [
                'success' => false,
                'message' => 'Geçersiz işlem.',
            ];
        }

        $question = $this->questionModel->findById($questionId);

        if (!$question || (int) $question['producer_id'] !== $producerId) {
            return [
                'success' => false,
                'message' => 'Bu soruyu gizleme yetkiniz yok.',
            ];
        }

        $hidden = $this->questionModel->hide($questionId, $producerId);

        return [
            'success' => $hidden,
            'message' => $hidden ? 'Soru gizlendi.' : 'Soru gizlenemedi.',
        ];
    }

    public function countPendingByProducerId(int $producerId): int
    {
        return $this->questionModel->countPendingByProducerId($producerId);
    }

    private function findProductForQuestion(int $productId): ?array
    {
        $stmt = $this->pdo->prepare("
            SELECT
                p.id,
                p.producer_id,
                p.title,
                p.status,
                p.slug,
                pp.store_name,
                u.full_name AS producer_name
            FROM products p
            INNER JOIN users u ON u.id = p.producer_id
            LEFT JOIN producer_profiles pp ON pp.user_id = p.producer_id
            WHERE p.id = :product_id
              AND p.status != 'deleted'
            LIMIT 1
        ");

        $stmt->execute([
            'product_id' => $productId,
        ]);

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ?: null;
    }

    private function createNewQuestionNotification(
        int $questionId,
        array $product,
        int $consumerId,
        string $question
    ): void {
        $producerId = (int) ($product['producer_id'] ?? 0);

        if ($producerId <= 0) {
            return;
        }

        $consumerName = $this->findUserName($consumerId) ?: 'Bir tüketici';
        $productTitle = $product['title'] ?? 'ürününüz';

        $this->createNotification(
            $producerId,
            'new_product_question',
            'Ürününüz için yeni soru geldi',
            $consumerName . ', ' . $productTitle . ' ürünü hakkında soru sordu.',
            [
                'question_id' => $questionId,
                'product_id' => (int) ($product['id'] ?? 0),
                'producer_id' => $producerId,
                'consumer_id' => $consumerId,
                'question' => $question,
                'url' => 'producer/questions.php?question_id=' . $questionId,
                'product_url' => 'product-detail.php?id=' . (int) ($product['id'] ?? 0) . '#questions',
            ]
        );
    }

    private function createQuestionAnsweredNotification(array $question, string $answer): void
    {
        $consumerId = (int) ($question['consumer_id'] ?? 0);
        $productId = (int) ($question['product_id'] ?? 0);

        if ($consumerId <= 0 || $productId <= 0) {
            return;
        }

        $producerName = trim((string) ($question['producer_store_name'] ?? $question['producer_name'] ?? 'Üretici'));
        $productTitle = trim((string) ($question['product_title'] ?? 'ürün'));

        $this->createNotification(
            $consumerId,
            'product_question_answered',
            'Sorunuz cevaplandı',
            $producerName . ', ' . $productTitle . ' ürünü hakkındaki sorunuzu cevapladı.',
            [
                'question_id' => (int) ($question['id'] ?? 0),
                'product_id' => $productId,
                'producer_id' => (int) ($question['producer_id'] ?? 0),
                'consumer_id' => $consumerId,
                'answer' => $answer,
                'url' => 'product-detail.php?id=' . $productId . '#questions',
            ]
        );
    }

    private function createNotification(
        int $userId,
        string $type,
        string $title,
        string $message,
        array $data = []
    ): void {
        if ($userId <= 0) {
            return;
        }

        $stmt = $this->pdo->prepare("
            INSERT INTO notifications (
                user_id,
                type,
                title,
                message,
                data_json,
                is_read
            ) VALUES (
                :user_id,
                :type,
                :title,
                :message,
                :data_json,
                0
            )
        ");

        $stmt->execute([
            'user_id' => $userId,
            'type' => $type,
            'title' => $title,
            'message' => $message,
            'data_json' => !empty($data)
                ? json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES)
                : null,
        ]);
    }

    private function findUserName(int $userId): ?string
    {
        if ($userId <= 0) {
            return null;
        }

        $stmt = $this->pdo->prepare("
            SELECT full_name
            FROM users
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $userId,
        ]);

        $name = $stmt->fetchColumn();

        return $name ? (string) $name : null;
    }

    private function textLength(string $text): int
    {
        if (function_exists('mb_strlen')) {
            return mb_strlen($text, 'UTF-8');
        }

        return strlen($text);
    }
}