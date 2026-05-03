<?php

require_once __DIR__ . '/../../app/bootstrap.php';

header('Content-Type: application/json; charset=utf-8');

function map_api_response(array $payload, int $statusCode = 200): void
{
    http_response_code($statusCode);
    echo json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function normalize_phone_for_whatsapp(?string $phone): ?string
{
    if (!$phone) {
        return null;
    }

    $digits = preg_replace('/\D+/', '', $phone);

    if (!$digits) {
        return null;
    }

    if (str_starts_with($digits, '00')) {
        $digits = substr($digits, 2);
    }

    if (str_starts_with($digits, '0')) {
        $digits = '90' . substr($digits, 1);
    }

    if (strlen($digits) === 10) {
        $digits = '90' . $digits;
    }

    return $digits;
}

try {
    $plateCode = isset($_GET['plate_code']) ? (int) $_GET['plate_code'] : 0;
    $provinceId = isset($_GET['province_id']) ? (int) $_GET['province_id'] : 0;

    if ($plateCode <= 0 && $provinceId <= 0) {
        map_api_response([
            'success' => false,
            'message' => 'province_id veya plate_code parametresi gerekli.'
        ], 422);
    }

    $pdo = db();

    if ($provinceId > 0) {
        $provinceStmt = $pdo->prepare(
            'SELECT id, plate_code, name
             FROM provinces
             WHERE id = :province_id
             LIMIT 1'
        );

        $provinceStmt->execute([
            ':province_id' => $provinceId
        ]);
    } else {
        $provinceStmt = $pdo->prepare(
            'SELECT id, plate_code, name
             FROM provinces
             WHERE plate_code = :plate_code
             LIMIT 1'
        );

        $provinceStmt->execute([
            ':plate_code' => $plateCode
        ]);
    }

    $province = $provinceStmt->fetch();

    if (!$province) {
        map_api_response([
            'success' => false,
            'message' => 'İl bulunamadı.',
            'producers' => []
        ], 404);
    }

    $producerStmt = $pdo->prepare(
        "SELECT
            u.id,
            u.full_name,
            u.email,
            u.phone AS user_phone,
            u.whatsapp_phone AS user_whatsapp,
            u.address_text,
            u.profile_photo,
            pp.store_name,
            pp.slug,
            pp.description,
            pp.logo_path,
            pp.contact_phone,
            pp.contact_whatsapp,
            pp.average_rating,
            pp.rating_count,
            COUNT(p.id) AS active_product_count
         FROM users u
         INNER JOIN producer_profiles pp ON pp.user_id = u.id
         LEFT JOIN products p
            ON p.producer_id = u.id
            AND p.status = 'active'
            AND p.deleted_at IS NULL
         WHERE u.role = 'producer'
            AND u.status = 'active'
            AND u.deleted_at IS NULL
            AND u.province_id = :province_id
         GROUP BY
            u.id,
            u.full_name,
            u.email,
            u.phone,
            u.whatsapp_phone,
            u.address_text,
            u.profile_photo,
            pp.store_name,
            pp.slug,
            pp.description,
            pp.logo_path,
            pp.contact_phone,
            pp.contact_whatsapp,
            pp.average_rating,
            pp.rating_count
         ORDER BY
            pp.average_rating DESC,
            active_product_count DESC,
            pp.store_name ASC"
    );

    $producerStmt->execute([
        ':province_id' => (int) $province['id']
    ]);

    $rows = $producerStmt->fetchAll();

    $producers = array_map(function (array $row): array {
        $phone = $row['contact_phone'] ?: $row['user_phone'];
        $whatsappPhone = $row['contact_whatsapp'] ?: $row['user_whatsapp'] ?: $phone;
        $whatsappDigits = normalize_phone_for_whatsapp($whatsappPhone);

        $logoUrl = null;

        if (!empty($row['logo_path']) && function_exists('upload_url')) {
            $logoUrl = upload_url($row['logo_path']);
        } elseif (!empty($row['profile_photo']) && function_exists('upload_url')) {
            $logoUrl = upload_url($row['profile_photo']);
        }

        return [
            'id' => (int) $row['id'],
            'store_name' => $row['store_name'] ?: $row['full_name'],
            'full_name' => $row['full_name'],
            'description' => $row['description'],
            'phone' => $phone,
            'whatsapp_phone' => $whatsappPhone,
            'whatsapp_url' => $whatsappDigits ? 'https://wa.me/' . $whatsappDigits : null,
            'address_text' => $row['address_text'],
            'logo_url' => $logoUrl,
            'average_rating' => number_format((float) $row['average_rating'], 2, '.', ''),
            'rating_count' => (int) $row['rating_count'],
            'active_product_count' => (int) $row['active_product_count'],
            'profile_url' => url('producer-detail.php?id=' . (int) $row['id']),
            'products_url' => url('products.php?producer_id=' . (int) $row['id'])
        ];
    }, $rows);

    map_api_response([
        'success' => true,
        'province' => [
            'id' => (int) $province['id'],
            'plate_code' => (int) $province['plate_code'],
            'name' => $province['name']
        ],
        'count' => count($producers),
        'producers' => $producers
    ]);
} catch (Throwable $e) {
    if (defined('APP_DEBUG') && APP_DEBUG) {
        map_api_response([
            'success' => false,
            'message' => $e->getMessage(),
            'producers' => []
        ], 500);
    }

    map_api_response([
        'success' => false,
        'message' => 'Üretici listesi alınırken bir hata oluştu.',
        'producers' => []
    ], 500);
}