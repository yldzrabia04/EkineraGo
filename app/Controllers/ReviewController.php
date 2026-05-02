<?php

class ReviewController
{
    private ReviewService $reviewService;

    public function __construct()
    {
        $this->reviewService = new ReviewService();
    }

    public function create(): void
    {
        ConsumerMiddleware::handle();

        $consumerId = (int) currentUserId();
        $orderItemId = (int) ($_GET['order_item_id'] ?? $_GET['review_order_item_id'] ?? 0);

        $reviewCheck = [
            'success' => false,
            'message' => 'Geçerli bir sipariş ürünü seçilmedi.',
            'data' => null,
        ];

        if ($orderItemId > 0) {
            $reviewCheck = $this->reviewService->canReview($consumerId, $orderItemId);
        }

        require APP_PATH . '/Views/reviews/create.php';
    }

    public function store(): void
    {
        ConsumerMiddleware::handle();

        $isAjax = $this->isAjaxRequest();

        if (!is_post()) {
            if ($isAjax) {
                $this->json([
                    'success' => false,
                    'message' => 'Bu işlem sadece POST isteği ile yapılabilir.',
                ], 405);
            }

            redirect('consumer/orders.php');
        }

        if (!$this->csrfIsValid()) {
            if ($isAjax) {
                $this->json([
                    'success' => false,
                    'message' => 'CSRF doğrulaması başarısız. Sayfayı yenileyip tekrar deneyin.',
                ], 419);
            }

            flash_error('CSRF doğrulaması başarısız. Lütfen tekrar deneyin.');
            redirect('consumer/orders.php');
        }

        $consumerId = (int) currentUserId();

        $result = $this->reviewService->createReview($consumerId, $_POST);

        if ($isAjax) {
            $this->json($result, $result['success'] ? 200 : 422);
        }

        if (!$result['success']) {
            if (function_exists('set_old')) {
                set_old($this->safeOldInput($_POST));
            }

            if (function_exists('set_errors')) {
                set_errors($result['errors'] ?? []);
            }

            flash_error($result['message'] ?? 'Yorum oluşturulamadı.');

            $orderItemId = (int) (
                $_POST['order_item_id']
                ?? $_POST['review_order_item_id']
                ?? 0
            );

            redirect('consumer/orders.php?review_order_item_id=' . $orderItemId);
        }

        flash_success($result['message'] ?? 'Yorum başarıyla oluşturuldu.');

        $redirectUrl = $result['data']['redirect_url'] ?? 'consumer/orders.php';
        redirect($redirectUrl);
    }

    private function csrfIsValid(): bool
    {
        if (function_exists('verify_csrf')) {
            return verify_csrf();
        }

        if (function_exists('csrf_verify')) {
            return csrf_verify();
        }

        if (function_exists('require_csrf')) {
            try {
                require_csrf();
                return true;
            } catch (Throwable $e) {
                return false;
            }
        }

        return true;
    }

    private function isAjaxRequest(): bool
    {
        $requestedWith = strtolower($_SERVER['HTTP_X_REQUESTED_WITH'] ?? '');
        $accept = strtolower($_SERVER['HTTP_ACCEPT'] ?? '');
        $contentType = strtolower($_SERVER['CONTENT_TYPE'] ?? '');

        return $requestedWith === 'xmlhttprequest'
            || str_contains($accept, 'application/json')
            || str_contains($contentType, 'application/json');
    }

    private function json(array $payload, int $statusCode = 200): void
    {
        if (function_exists('json_response')) {
            json_response($payload, $statusCode);
        }

        http_response_code($statusCode);
        header('Content-Type: application/json; charset=utf-8');

        echo json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        exit;
    }

    private function safeOldInput(array $input): array
    {
        unset($input['_csrf_token'], $input['csrf_token'], $input['_token']);

        return $input;
    }
}