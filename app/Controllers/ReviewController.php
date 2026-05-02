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

        $orderItemId = (int) ($_GET['order_item_id'] ?? $_GET['review_order_item_id'] ?? 0);

        require APP_PATH . '/Views/reviews/create.php';
    }

    public function store(): void
    {
        ConsumerMiddleware::handle();

        if (!is_post()) {
            redirect('consumer/orders.php');
        }

        require_csrf();

        $consumerId = (int) currentUserId();

        $result = $this->reviewService->createReview($consumerId, $_POST);

        if (!$result['success']) {
            set_old($this->safeOldInput($_POST));
            set_errors($result['errors'] ?? []);

            flash_error($result['message'] ?? 'Yorum oluşturulamadı.');

            $orderItemId = (int) ($_POST['order_item_id'] ?? 0);
            redirect('consumer/orders.php?review_order_item_id=' . $orderItemId);
        }

        flash_success($result['message'] ?? 'Yorum başarıyla oluşturuldu.');
        redirect('consumer/orders.php');
    }

    private function safeOldInput(array $input): array
    {
        unset($input['_csrf_token']);

        return $input;
    }
}