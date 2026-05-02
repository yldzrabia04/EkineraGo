<?php

require_once __DIR__ . '/../../app/bootstrap.php';

if (!function_exists('api_json_response')) {
    function api_json_response(array $payload, int $statusCode = 200): void
    {
        if (function_exists('json_response')) {
            json_response($payload, $statusCode);
        }

        http_response_code($statusCode);
        header('Content-Type: application/json; charset=utf-8');

        echo json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        exit;
    }
}

if (!isLoggedIn()) {
    api_json_response([
        'success' => false,
        'message' => 'Satıcıya soru sormak için giriş yapmalısınız.',
    ], 401);
}

if (!isConsumer()) {
    api_json_response([
        'success' => false,
        'message' => 'Satıcıya sadece tüketici hesapları soru sorabilir.',
    ], 403);
}

if (!is_post()) {
    api_json_response([
        'success' => false,
        'message' => 'Bu endpoint sadece POST isteği kabul eder.',
    ], 405);
}

if (function_exists('verify_csrf') && !verify_csrf()) {
    api_json_response([
        'success' => false,
        'message' => 'CSRF doğrulaması başarısız. Sayfayı yenileyip tekrar deneyin.',
    ], 419);
}

try {
    $consumerId = (int) currentUserId();

    $service = new ProductQuestionService();
    $result = $service->askQuestion($consumerId, $_POST);

    api_json_response($result, $result['success'] ? 200 : 422);
} catch (Throwable $e) {
    api_json_response([
        'success' => false,
        'message' => 'Soru gönderilirken beklenmeyen bir hata oluştu: ' . $e->getMessage(),
    ], 500);
}