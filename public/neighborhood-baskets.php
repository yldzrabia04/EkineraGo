<?php

require_once __DIR__ . '/../app/bootstrap.php';

$pageTitle = 'Mahalle Sepeti';
$bodyClass = 'page-neighborhood-baskets';

$user = currentUser();
$userRole = $user['role'] ?? null;
$isConsumer = $user && $userRole === ROLE_CONSUMER;
$isProducer = $user && $userRole === ROLE_PRODUCER;

$action = $_GET['action'] ?? 'index';

if (!function_exists('nb_flash')) {
    function nb_flash(string $type, string $message): void
    {
        $_SESSION['neighborhood_toast'] = [
            'type' => $type,
            'message' => $message,
        ];
    }
}

if (!function_exists('nb_consume_flash')) {
    function nb_consume_flash(): ?array
    {
        $toast = $_SESSION['neighborhood_toast'] ?? null;
        unset($_SESSION['neighborhood_toast']);

        return is_array($toast) ? $toast : null;
    }
}

if (!function_exists('nb_redirect')) {
    function nb_redirect(string $path): void
    {
        header('Location: ' . url($path));
        exit;
    }
}

if (!function_exists('nb_date_to_datetime_end')) {
    function nb_date_to_datetime_end(?string $value): ?string
    {
        $value = trim((string) $value);

        if ($value === '') {
            return null;
        }

        return $value . ' 23:59:59';
    }
}

if (!function_exists('nb_parse_emails')) {
    function nb_parse_emails(string $rawEmails): array
    {
        $rawEmails = trim($rawEmails);

        if ($rawEmails === '') {
            return [];
        }

        $parts = preg_split('/[\s,;]+/', $rawEmails);
        $emails = [];

        foreach ($parts as $part) {
            $email = strtolower(trim((string) $part));

            if ($email === '') {
                continue;
            }

            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                continue;
            }

            $emails[$email] = $email;
        }

        return array_values($emails);
    }
}

if (!function_exists('nb_notify_create')) {
    function nb_notify_create(array $data): bool
    {
        try {
            if (class_exists('Notification')) {
                Notification::create($data);

                return true;
            }

            $statement = db()->prepare("\
                INSERT INTO notifications (\
                    user_id,\
                    type,\
                    title,\
                    message,\
                    data_json,\
                    is_read,\
                    created_at\
                ) VALUES (\
                    :user_id,\
                    :type,\
                    :title,\
                    :message,\
                    :data_json,\
                    :is_read,\
                    NOW()\
                )\
            ");

            $payload = $data['data_json'] ?? $data['data'] ?? null;

            $statement->execute([
                'user_id' => (int) ($data['user_id'] ?? 0),
                'type' => (string) ($data['type'] ?? 'system'),
                'title' => (string) ($data['title'] ?? 'Bildirim'),
                'message' => (string) ($data['message'] ?? ''),
                'data_json' => $payload ? json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) : null,
                'is_read' => !empty($data['is_read']) ? 1 : 0,
            ]);

            return true;
        } catch (Throwable $e) {
            return false;
        }
    }
}

if (!function_exists('nb_notify_basket_invite')) {
    function nb_notify_basket_invite(
        int $userId,
        int $basketId,
        int $invitationId,
        string $token,
        string $basketTitle,
        string $inviterName
    ): bool {
        try {
            if (class_exists('Notification') && method_exists('Notification', 'createNeighborhoodBasketInvite')) {
                Notification::createNeighborhoodBasketInvite($userId, $basketId, $invitationId, $token, $basketTitle, $inviterName);

                return true;
            }

            return nb_notify_create([
                'user_id' => $userId,
                'type' => 'neighborhood_basket_invite',
                'title' => 'Mahalle Sepeti Daveti',
                'message' => $inviterName . ' seni "' . $basketTitle . '" Mahalle Sepetine davet etti.',
                'data_json' => [
                    'basket_id' => $basketId,
                    'invitation_id' => $invitationId,
                    'token' => $token,
                    'link' => 'neighborhood-baskets.php?action=accept-invite&token=' . $token,
                ],
            ]);
        } catch (Throwable $e) {
            return false;
        }
    }
}

if (!function_exists('nb_notify_basket_ready')) {
    function nb_notify_basket_ready(int $creatorUserId, int $basketId, string $basketTitle): bool
    {
        try {
            if (class_exists('Notification') && method_exists('Notification', 'createNeighborhoodBasketReady')) {
                Notification::createNeighborhoodBasketReady($creatorUserId, $basketId, $basketTitle);

                return true;
            }

            return nb_notify_create([
                'user_id' => $creatorUserId,
                'type' => 'neighborhood_basket_ready',
                'title' => 'Mahalle Sepeti hedefe ulaştı',
                'message' => '"' . $basketTitle . '" sepeti minimum miktara ulaştı. Toplu siparişi onaylayabilirsin.',
                'data_json' => [
                    'basket_id' => $basketId,
                    'link' => 'neighborhood-baskets.php?action=show&id=' . $basketId,
                ],
            ]);
        } catch (Throwable $e) {
            return false;
        }
    }
}

if (!function_exists('nb_notify_basket_joined')) {
    function nb_notify_basket_joined(
        int $creatorUserId,
        int $basketId,
        string $basketTitle,
        string $memberName,
        float $quantity,
        string $unitType
    ): bool {
        try {
            if (class_exists('Notification') && method_exists('Notification', 'createNeighborhoodBasketJoined')) {
                Notification::createNeighborhoodBasketJoined($creatorUserId, $basketId, $basketTitle, $memberName, $quantity, $unitType);

                return true;
            }

            return nb_notify_create([
                'user_id' => $creatorUserId,
                'type' => 'neighborhood_basket_joined',
                'title' => 'Mahalle Sepetine katılım oldu',
                'message' => $memberName . ' "' . $basketTitle . '" sepetine ' . number_format($quantity, 2, ',', '.') . ' ' . $unitType . ' ile katıldı.',
                'data_json' => [
                    'basket_id' => $basketId,
                    'quantity' => $quantity,
                    'unit_type' => $unitType,
                    'link' => 'neighborhood-baskets.php?action=show&id=' . $basketId,
                ],
            ]);
        } catch (Throwable $e) {
            return false;
        }
    }
}

if (!function_exists('nb_notify_basket_ordered')) {
    function nb_notify_basket_ordered(int $userId, int $basketId, int $orderId, string $basketTitle, float $amount): bool
    {
        try {
            if (class_exists('Notification') && method_exists('Notification', 'createNeighborhoodBasketOrdered')) {
                Notification::createNeighborhoodBasketOrdered($userId, $basketId, $orderId, $basketTitle, $amount);

                return true;
            }

            return nb_notify_create([
                'user_id' => $userId,
                'type' => 'neighborhood_basket_ordered',
                'title' => 'Mahalle Sepeti siparişe dönüştü',
                'message' => '"' . $basketTitle . '" Mahalle Sepeti için toplu sipariş oluşturuldu. Payına düşen tutar: ' . number_format($amount, 2, ',', '.') . ' TL.',
                'data_json' => [
                    'basket_id' => $basketId,
                    'order_id' => $orderId,
                    'amount' => $amount,
                    'link' => 'consumer/orders.php',
                ],
            ]);
        } catch (Throwable $e) {
            return false;
        }
    }
}

if (!function_exists('nb_notify_basket_producer_order')) {
    function nb_notify_basket_producer_order(int $producerId, int $basketId, int $orderId, string $basketTitle, float $totalAmount): bool
    {
        try {
            if (class_exists('Notification') && method_exists('Notification', 'createNeighborhoodBasketProducerOrder')) {
                Notification::createNeighborhoodBasketProducerOrder($producerId, $basketId, $orderId, $basketTitle, $totalAmount);

                return true;
            }

            return nb_notify_create([
                'user_id' => $producerId,
                'type' => 'new_order',
                'title' => 'Yeni Mahalle Sepeti siparişi',
                'message' => '"' . $basketTitle . '" Mahalle Sepeti toplu siparişe dönüştü. Toplam tutar: ' . number_format($totalAmount, 2, ',', '.') . ' TL.',
                'data_json' => [
                    'basket_id' => $basketId,
                    'order_id' => $orderId,
                    'order_type' => 'neighborhood_basket',
                    'total_amount' => $totalAmount,
                    'link' => 'producer/orders.php',
                ],
            ]);
        } catch (Throwable $e) {
            return false;
        }
    }
}

if (!function_exists('nb_render_toast')) {
    function nb_render_toast(?array $toast): void
    {
        if (!$toast) {
            return;
        }

        $type = $toast['type'] ?? 'success';
        $message = $toast['message'] ?? '';

        ?>
        <div class="nb-toast nb-toast-<?= e($type) ?>" data-nb-toast>
            <span class="nb-toast-icon">
                <?= $type === 'error' ? '⚠️' : '✅' ?>
            </span>

            <span class="nb-toast-message">
                <?= e($message) ?>
            </span>

            <button class="nb-toast-close" type="button" data-nb-toast-close>
                ×
            </button>
        </div>

        <style>
            .nb-toast {
                position: fixed;
                right: 22px;
                bottom: 22px;
                z-index: 12000;
                max-width: min(420px, calc(100vw - 32px));
                display: flex;
                align-items: flex-start;
                gap: 12px;
                padding: 15px 16px;
                border-radius: 20px;
                background: #ffffff;
                border: 1px solid #d9ead3;
                box-shadow: 0 18px 45px rgba(36, 92, 47, 0.22);
                color: #245c2f;
                font-weight: 850;
                line-height: 1.45;
                animation: nbToastIn 0.25s ease both;
            }

            .nb-toast-error {
                color: #9b3434;
                background: #fff7f7;
                border-color: #ffdada;
                box-shadow: 0 18px 45px rgba(155, 52, 52, 0.18);
            }

            .nb-toast-icon {
                flex: 0 0 auto;
                font-size: 20px;
            }

            .nb-toast-message {
                flex: 1 1 auto;
            }

            .nb-toast-close {
                flex: 0 0 auto;
                width: 26px;
                height: 26px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                border: none;
                border-radius: 999px;
                background: rgba(36, 92, 47, 0.08);
                color: inherit;
                font-size: 20px;
                line-height: 1;
                cursor: pointer;
            }

            .nb-toast.is-hiding {
                animation: nbToastOut 0.2s ease both;
            }

            @keyframes nbToastIn {
                from {
                    opacity: 0;
                    transform: translateY(12px) scale(0.98);
                }

                to {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
            }

            @keyframes nbToastOut {
                from {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }

                to {
                    opacity: 0;
                    transform: translateY(12px) scale(0.98);
                }
            }

            @media (max-width: 560px) {
                .nb-toast {
                    left: 16px;
                    right: 16px;
                    bottom: 16px;
                    max-width: none;
                }
            }
        </style>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const toast = document.querySelector('[data-nb-toast]');
                const closeButton = document.querySelector('[data-nb-toast-close]');

                if (!toast) {
                    return;
                }

                function closeToast() {
                    toast.classList.add('is-hiding');

                    window.setTimeout(function () {
                        toast.remove();
                    }, 220);
                }

                if (closeButton) {
                    closeButton.addEventListener('click', closeToast);
                }

                window.setTimeout(closeToast, 5000);
            });
        </script>
        <?php
    }
}

if (!function_exists('nb_generate_order_no')) {
    function nb_generate_order_no(): string
    {
        return 'NB-' . date('YmdHis') . '-' . strtoupper(bin2hex(random_bytes(3)));
    }
}

if (!function_exists('nb_generate_tracking_no')) {
    function nb_generate_tracking_no(): string
    {
        return 'TRK-NB-' . date('YmdHis') . '-' . strtoupper(bin2hex(random_bytes(3)));
    }
}

if ($action === 'store') {
    if (!$user) {
        nb_flash('error', 'Mahalle Sepeti oluşturmak için giriş yapmalısın.');
        nb_redirect('login.php');
    }

    if (!$isConsumer) {
        nb_flash('error', 'Mahalle Sepeti sadece tüketici hesabıyla oluşturulabilir.');
        nb_redirect('neighborhood-baskets.php');
    }

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        nb_redirect('neighborhood-baskets.php?action=create');
    }

    if (function_exists('verify_csrf') && !verify_csrf()) {
        nb_flash('error', 'Güvenlik doğrulaması başarısız oldu. Sayfayı yenileyip tekrar deneyin.');
        nb_redirect('neighborhood-baskets.php?action=create');
    }

    $offerId = (int) ($_POST['offer_id'] ?? 0);
    $basketType = $_POST['basket_type'] ?? 'group';
    $visibility = $_POST['visibility'] ?? 'private';
    $title = trim((string) ($_POST['title'] ?? ''));
    $myQuantity = (float) ($_POST['my_quantity'] ?? 0);
    $provinceId = (int) ($_POST['province_id'] ?? 0);
    $creatorNote = trim((string) ($_POST['creator_note'] ?? ''));
    $expiresAt = nb_date_to_datetime_end($_POST['expires_at'] ?? null);
    $inviteEmailsRaw = (string) ($_POST['invite_emails'] ?? '');

    if (!in_array($basketType, ['group', 'individual'], true)) {
        $basketType = 'group';
    }

    if (!in_array($visibility, ['private', 'public'], true)) {
        $visibility = 'private';
    }

    if ($offerId <= 0) {
        nb_flash('error', 'Lütfen bir toplu alım ilanı seçin.');
        nb_redirect('neighborhood-baskets.php?action=create');
    }

    if ($title === '') {
        nb_flash('error', 'Sepet başlığı boş bırakılamaz.');
        nb_redirect('neighborhood-baskets.php?action=create&offer_id=' . $offerId);
    }

    if ($myQuantity <= 0) {
        nb_flash('error', 'Almak istediğin miktar 0’dan büyük olmalıdır.');
        nb_redirect('neighborhood-baskets.php?action=create&offer_id=' . $offerId);
    }

    if ($provinceId <= 0) {
        nb_flash('error', 'Lütfen il seçin.');
        nb_redirect('neighborhood-baskets.php?action=create&offer_id=' . $offerId);
    }

    $pdo = db();

    try {
        $pdo->beginTransaction();

        $offerStatement = $pdo->prepare("
            SELECT
                nbo.id,
                nbo.producer_id,
                nbo.product_id,
                nbo.title,
                nbo.description,
                nbo.min_quantity,
                nbo.discount_percent,
                nbo.unit_type,
                p.title AS product_title,
                p.price AS product_price,
                p.stock_quantity,
                COALESCE(pp.store_name, u.full_name) AS producer_name
            FROM neighborhood_basket_offers nbo
            INNER JOIN products p ON p.id = nbo.product_id
            INNER JOIN users u ON u.id = nbo.producer_id
            LEFT JOIN producer_profiles pp ON pp.user_id = u.id
            WHERE nbo.id = :offer_id
              AND nbo.status = 'active'
              AND p.status = 'active'
              AND (nbo.starts_at IS NULL OR nbo.starts_at <= NOW())
              AND (nbo.ends_at IS NULL OR nbo.ends_at >= NOW())
            LIMIT 1
        ");

        $offerStatement->execute([
            'offer_id' => $offerId,
        ]);

        $offer = $offerStatement->fetch(PDO::FETCH_ASSOC);

        if (!$offer) {
            throw new RuntimeException('Seçilen toplu alım ilanı aktif değil veya bulunamadı.');
        }

        $targetQuantity = (float) $offer['min_quantity'];
        $discountPercent = (float) $offer['discount_percent'];
        $unitPrice = (float) $offer['product_price'];
        $discountedUnitPrice = $unitPrice - (($unitPrice * $discountPercent) / 100);
        $basketStatus = $myQuantity >= $targetQuantity ? 'ready_to_order' : 'open';

        $basketInsert = $pdo->prepare("
            INSERT INTO neighborhood_baskets (
                offer_id,
                basket_type,
                visibility,
                producer_id,
                product_id,
                creator_user_id,
                title,
                creator_note,
                province_id,
                target_quantity,
                current_quantity,
                unit_type,
                status,
                producer_status,
                discount_percent_snapshot,
                unit_price_snapshot,
                discounted_unit_price_snapshot,
                expires_at
            ) VALUES (
                :offer_id,
                :basket_type,
                :visibility,
                :producer_id,
                :product_id,
                :creator_user_id,
                :title,
                :creator_note,
                :province_id,
                :target_quantity,
                :current_quantity,
                :unit_type,
                :status,
                'pending',
                :discount_percent_snapshot,
                :unit_price_snapshot,
                :discounted_unit_price_snapshot,
                :expires_at
            )
        ");

        $basketInsert->execute([
            'offer_id' => (int) $offer['id'],
            'basket_type' => $basketType,
            'visibility' => $visibility,
            'producer_id' => (int) $offer['producer_id'],
            'product_id' => (int) $offer['product_id'],
            'creator_user_id' => (int) currentUserId(),
            'title' => mb_substr($title, 0, 160, 'UTF-8'),
            'creator_note' => $creatorNote !== '' ? $creatorNote : null,
            'province_id' => $provinceId,
            'target_quantity' => $targetQuantity,
            'current_quantity' => $myQuantity,
            'unit_type' => $offer['unit_type'] ?? 'kg',
            'status' => $basketStatus,
            'discount_percent_snapshot' => $discountPercent,
            'unit_price_snapshot' => $unitPrice,
            'discounted_unit_price_snapshot' => $discountedUnitPrice,
            'expires_at' => $expiresAt,
        ]);

        $basketId = (int) $pdo->lastInsertId();

        $memberInsert = $pdo->prepare("
            INSERT INTO neighborhood_basket_members (
                basket_id,
                user_id,
                quantity,
                status
            ) VALUES (
                :basket_id,
                :user_id,
                :quantity,
                'active'
            )
        ");

        $memberInsert->execute([
            'basket_id' => $basketId,
            'user_id' => (int) currentUserId(),
            'quantity' => $myQuantity,
        ]);

        $inviteEmails = $basketType === 'group'
            ? nb_parse_emails($inviteEmailsRaw)
            : [];

        $createdInviteCount = 0;
        $registeredInviteCount = 0;
        $notificationSentCount = 0;

        if ($inviteEmails) {
            $userLookup = $pdo->prepare("
                SELECT id, full_name, email
                FROM users
                WHERE LOWER(email) = :email
                  AND role = 'consumer'
                  AND status = 'active'
                LIMIT 1
            ");

            $invitationInsert = $pdo->prepare("
                INSERT INTO neighborhood_basket_invitations (
                    basket_id,
                    invited_email,
                    invited_user_id,
                    invited_by_user_id,
                    token,
                    status,
                    expires_at
                ) VALUES (
                    :basket_id,
                    :invited_email,
                    :invited_user_id,
                    :invited_by_user_id,
                    :token,
                    'pending',
                    :expires_at
                )
            ");

            foreach ($inviteEmails as $email) {
                if (isset($user['email']) && strtolower((string) $user['email']) === $email) {
                    continue;
                }

                $userLookup->execute([
                    'email' => $email,
                ]);

                $invitedUser = $userLookup->fetch(PDO::FETCH_ASSOC) ?: null;
                $invitedUserId = $invitedUser ? (int) $invitedUser['id'] : null;
                $token = bin2hex(random_bytes(32));
                $invitationExpiresAt = $expiresAt ?: date('Y-m-d H:i:s', strtotime('+7 days'));

                $invitationInsert->execute([
                    'basket_id' => $basketId,
                    'invited_email' => $email,
                    'invited_user_id' => $invitedUserId,
                    'invited_by_user_id' => (int) currentUserId(),
                    'token' => $token,
                    'expires_at' => $invitationExpiresAt,
                ]);

                $invitationId = (int) $pdo->lastInsertId();
                $createdInviteCount++;

                if ($invitedUserId) {
                    $registeredInviteCount++;

                    $notificationCreated = nb_notify_basket_invite(
                        $invitedUserId,
                        $basketId,
                        $invitationId,
                        $token,
                        $title,
                        $user['full_name'] ?? 'Bir kullanıcı'
                    );

                    if ($notificationCreated) {
                        $notificationSentCount++;
                    }
                }
            }
        }

        if ($basketStatus === 'ready_to_order') {
            nb_notify_basket_ready(
                (int) currentUserId(),
                $basketId,
                $title
            );
        }

        $pdo->commit();

        if ($basketType === 'group') {
            if ($createdInviteCount > 0) {
                nb_flash(
                    'success',
                    'Mahalle Sepeti oluşturuldu. ' .
                    $createdInviteCount . ' davet kaydedildi, ' .
                    $notificationSentCount . ' kayıtlı kullanıcıya bildirim gönderildi.'
                );
            } else {
                nb_flash('success', 'Mahalle Sepeti oluşturuldu. Davet e-postası girilmediği için sadece sen katılımcı olarak eklendin.');
            }
        } else {
            nb_flash('success', 'Bireysel toplu alım sepetin başarıyla oluşturuldu.');
        }

        nb_redirect('neighborhood-baskets.php?action=show&id=' . $basketId);
    } catch (Throwable $e) {
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }

        nb_flash('error', 'Mahalle Sepeti oluşturulurken hata oluştu: ' . $e->getMessage());
        nb_redirect('neighborhood-baskets.php?action=create&offer_id=' . $offerId);
    }
}

if ($action === 'join') {
    if (!$user) {
        nb_flash('error', 'Daveti kabul etmek için giriş yapmalısın.');
        nb_redirect('login.php');
    }

    if (!$isConsumer) {
        nb_flash('error', 'Mahalle Sepeti davetini sadece tüketici hesapları kabul edebilir.');
        nb_redirect('neighborhood-baskets.php');
    }

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        nb_redirect('neighborhood-baskets.php');
    }

    if (function_exists('verify_csrf') && !verify_csrf()) {
        nb_flash('error', 'Güvenlik doğrulaması başarısız oldu. Sayfayı yenileyip tekrar deneyin.');
        nb_redirect('neighborhood-baskets.php');
    }

    $token = trim((string) ($_POST['token'] ?? ''));
    $quantity = (float) ($_POST['quantity'] ?? 0);

    if ($token === '') {
        nb_flash('error', 'Davet bağlantısı geçersiz.');
        nb_redirect('neighborhood-baskets.php');
    }

    if ($quantity <= 0) {
        nb_flash('error', 'Katılım miktarı 0’dan büyük olmalıdır.');
        nb_redirect('neighborhood-baskets.php?action=accept-invite&token=' . urlencode($token));
    }

    $pdo = db();

    try {
        $pdo->beginTransaction();

        $invitationStatement = $pdo->prepare("
            SELECT
                nbi.*,
                nb.id AS basket_id,
                nb.title AS basket_title,
                nb.creator_user_id,
                nb.target_quantity,
                nb.current_quantity,
                nb.unit_type,
                nb.status AS basket_status,
                nb.discounted_unit_price_snapshot,
                p.title AS product_title
            FROM neighborhood_basket_invitations nbi
            INNER JOIN neighborhood_baskets nb ON nb.id = nbi.basket_id
            INNER JOIN products p ON p.id = nb.product_id
            WHERE nbi.token = :token
            LIMIT 1
        ");

        $invitationStatement->execute([
            'token' => $token,
        ]);

        $invitation = $invitationStatement->fetch(PDO::FETCH_ASSOC);

        if (!$invitation) {
            throw new RuntimeException('Davet bulunamadı.');
        }

        if ($invitation['status'] !== 'pending') {
            throw new RuntimeException('Bu davet daha önce işlem görmüş.');
        }

        if (!empty($invitation['expires_at']) && strtotime($invitation['expires_at']) < time()) {
            throw new RuntimeException('Bu davetin süresi dolmuş.');
        }

        $currentUserEmail = strtolower((string) ($user['email'] ?? ''));
        $invitedEmail = strtolower((string) $invitation['invited_email']);
        $invitedUserId = (int) ($invitation['invited_user_id'] ?? 0);

        if ($invitedUserId > 0 && $invitedUserId !== (int) currentUserId()) {
            throw new RuntimeException('Bu davet başka bir kullanıcıya ait.');
        }

        if ($invitedUserId <= 0 && $currentUserEmail !== $invitedEmail) {
            throw new RuntimeException('Bu davet senin e-posta adresine ait değil.');
        }

        $memberUpsert = $pdo->prepare("
            INSERT INTO neighborhood_basket_members (
                basket_id,
                user_id,
                quantity,
                status
            ) VALUES (
                :basket_id,
                :user_id,
                :quantity,
                'active'
            )
            ON DUPLICATE KEY UPDATE
                quantity = VALUES(quantity),
                status = 'active',
                updated_at = NOW()
        ");

        $memberUpsert->execute([
            'basket_id' => (int) $invitation['basket_id'],
            'user_id' => (int) currentUserId(),
            'quantity' => $quantity,
        ]);

        $invitationUpdate = $pdo->prepare("
            UPDATE neighborhood_basket_invitations
            SET
                invited_user_id = :invited_user_id,
                status = 'accepted',
                accepted_at = NOW()
            WHERE id = :id
        ");

        $invitationUpdate->execute([
            'invited_user_id' => (int) currentUserId(),
            'id' => (int) $invitation['id'],
        ]);

        $quantityStatement = $pdo->prepare("
            SELECT COALESCE(SUM(quantity), 0)
            FROM neighborhood_basket_members
            WHERE basket_id = :basket_id
              AND status = 'active'
        ");

        $quantityStatement->execute([
            'basket_id' => (int) $invitation['basket_id'],
        ]);

        $newCurrentQuantity = (float) $quantityStatement->fetchColumn();
        $newStatus = $newCurrentQuantity >= (float) $invitation['target_quantity']
            ? 'ready_to_order'
            : 'open';

        $basketUpdate = $pdo->prepare("
            UPDATE neighborhood_baskets
            SET
                current_quantity = :current_quantity,
                status = :status
            WHERE id = :id
        ");

        $basketUpdate->execute([
            'current_quantity' => $newCurrentQuantity,
            'status' => $newStatus,
            'id' => (int) $invitation['basket_id'],
        ]);

        nb_notify_basket_joined(
            (int) $invitation['creator_user_id'],
            (int) $invitation['basket_id'],
            (string) $invitation['basket_title'],
            $user['full_name'] ?? 'Bir kullanıcı',
            $quantity,
            (string) $invitation['unit_type']
        );

        if ($newStatus === 'ready_to_order') {
            nb_notify_basket_ready(
                (int) $invitation['creator_user_id'],
                (int) $invitation['basket_id'],
                (string) $invitation['basket_title']
            );
        }

        $pdo->commit();

        $estimatedTotal = $quantity * (float) $invitation['discounted_unit_price_snapshot'];

        nb_flash(
            'success',
            'Daveti kabul ettin. ' . $quantity . ' ' . $invitation['unit_type'] . ' talebin sepete eklendi. Tahmini ücretin: ' . number_format($estimatedTotal, 2, ',', '.') . ' TL.'
        );

        nb_redirect('neighborhood-baskets.php?action=accept-invite&token=' . urlencode($token));
    } catch (Throwable $e) {
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }

        nb_flash('error', 'Davete katılırken hata oluştu: ' . $e->getMessage());
        nb_redirect('neighborhood-baskets.php?action=accept-invite&token=' . urlencode($token));
    }
}

if ($action === 'approve-order') {
    if (!$user) {
        nb_flash('error', 'Toplu siparişi onaylamak için giriş yapmalısın.');
        nb_redirect('login.php');
    }

    if (!$isConsumer) {
        nb_flash('error', 'Toplu siparişi sadece sepeti oluşturan tüketici onaylayabilir.');
        nb_redirect('neighborhood-baskets.php');
    }

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        nb_redirect('neighborhood-baskets.php');
    }

    if (function_exists('verify_csrf') && !verify_csrf()) {
        nb_flash('error', 'Güvenlik doğrulaması başarısız oldu. Sayfayı yenileyip tekrar deneyin.');
        nb_redirect('neighborhood-baskets.php');
    }

    $basketId = (int) ($_POST['basket_id'] ?? 0);

    if ($basketId <= 0) {
        nb_flash('error', 'Geçerli bir Mahalle Sepeti bulunamadı.');
        nb_redirect('neighborhood-baskets.php');
    }

    $pdo = db();

    try {
        $pdo->beginTransaction();

        $basketStatement = $pdo->prepare("
            SELECT
                nb.*,
                p.title AS product_title,
                p.stock_quantity,
                p.status AS product_status,
                producer.full_name AS producer_name
            FROM neighborhood_baskets nb
            INNER JOIN products p ON p.id = nb.product_id
            INNER JOIN users producer ON producer.id = nb.producer_id
            WHERE nb.id = :id
            LIMIT 1
            FOR UPDATE
        ");

        $basketStatement->execute([
            'id' => $basketId,
        ]);

        $basket = $basketStatement->fetch(PDO::FETCH_ASSOC);

        if (!$basket) {
            throw new RuntimeException('Mahalle Sepeti bulunamadı.');
        }

        if ((int) $basket['creator_user_id'] !== (int) currentUserId()) {
            throw new RuntimeException('Bu sepeti sadece sepeti oluşturan kişi onaylayabilir.');
        }

        if (($basket['status'] ?? '') !== 'ready_to_order') {
            throw new RuntimeException('Bu sepet henüz toplu siparişe hazır değil.');
        }

        if (!empty($basket['order_id'])) {
            throw new RuntimeException('Bu Mahalle Sepeti daha önce siparişe dönüştürülmüş.');
        }

        if (($basket['product_status'] ?? '') !== 'active') {
            throw new RuntimeException('Bu sepete bağlı ürün artık aktif değil.');
        }

        $targetQuantity = (float) ($basket['target_quantity'] ?? 0);
        $currentQuantity = (float) ($basket['current_quantity'] ?? 0);
        $stockQuantity = (float) ($basket['stock_quantity'] ?? 0);

        if ($currentQuantity < $targetQuantity) {
            throw new RuntimeException('Toplanan miktar minimum hedef miktara ulaşmadı.');
        }

        if ($stockQuantity < $currentQuantity) {
            throw new RuntimeException('Üreticinin ürün stoğu bu toplu sipariş için yeterli değil.');
        }

        $memberStatement = $pdo->prepare("
            SELECT
                nbm.id AS member_id,
                nbm.user_id,
                nbm.quantity,
                nbm.status,
                u.full_name,
                u.email,
                w.balance
            FROM neighborhood_basket_members nbm
            INNER JOIN users u ON u.id = nbm.user_id
            LEFT JOIN wallets w ON w.user_id = nbm.user_id
            WHERE nbm.basket_id = :basket_id
              AND nbm.status = 'active'
            ORDER BY nbm.created_at ASC
            FOR UPDATE
        ");

        $memberStatement->execute([
            'basket_id' => $basketId,
        ]);

        $members = $memberStatement->fetchAll(PDO::FETCH_ASSOC);

        if (!$members) {
            throw new RuntimeException('Bu sepette aktif katılımcı bulunmuyor.');
        }

        $unitPrice = (float) ($basket['unit_price_snapshot'] ?? 0);
        $discountedUnitPrice = (float) ($basket['discounted_unit_price_snapshot'] ?? 0);

        if ($discountedUnitPrice <= 0) {
            throw new RuntimeException('İndirimli birim fiyat geçersiz.');
        }

        $subtotal = 0.00;
        $discountTotal = 0.00;
        $totalAmount = 0.00;

        foreach ($members as $member) {
            $quantity = (float) ($member['quantity'] ?? 0);
            $memberNormalTotal = $quantity * $unitPrice;
            $memberDiscountedTotal = $quantity * $discountedUnitPrice;

            if ($quantity <= 0) {
                throw new RuntimeException(($member['full_name'] ?? 'Bir katılımcı') . ' için miktar geçersiz.');
            }

            if ($member['balance'] === null) {
                throw new RuntimeException(($member['full_name'] ?? 'Bir katılımcı') . ' için cüzdan bulunamadı.');
            }

            if ((float) $member['balance'] < $memberDiscountedTotal) {
                throw new RuntimeException(
                    ($member['full_name'] ?? 'Bir katılımcı') .
                    ' bakiyesi yetersiz. Gerekli tutar: ' .
                    number_format($memberDiscountedTotal, 2, ',', '.') .
                    ' TL.'
                );
            }

            $subtotal += $memberNormalTotal;
            $totalAmount += $memberDiscountedTotal;
            $discountTotal += max(0, $memberNormalTotal - $memberDiscountedTotal);
        }

        $orderNo = nb_generate_order_no();
        $trackingNo = nb_generate_tracking_no();

        $orderInsert = $pdo->prepare("
            INSERT INTO orders (
                order_no,
                consumer_id,
                producer_id,
                address_id,
                order_type,
                subtotal,
                shipping_fee,
                discount_total,
                total_amount,
                payment_method,
                payment_status,
                order_status,
                customer_note,
                producer_note,
                tracking_no
            ) VALUES (
                :order_no,
                :consumer_id,
                :producer_id,
                NULL,
                'neighborhood_basket',
                :subtotal,
                0.00,
                :discount_total,
                :total_amount,
                'virtual_balance',
                'paid',
                'pending',
                :customer_note,
                :producer_note,
                :tracking_no
            )
        ");

        $orderInsert->execute([
            'order_no' => $orderNo,
            'consumer_id' => (int) $basket['creator_user_id'],
            'producer_id' => (int) $basket['producer_id'],
            'subtotal' => $subtotal,
            'discount_total' => $discountTotal,
            'total_amount' => $totalAmount,
            'customer_note' => 'Mahalle Sepeti toplu siparişi. Sepet ID: ' . $basketId,
            'producer_note' => 'Bu sipariş Mahalle Sepeti üzerinden toplu alım olarak oluşturuldu.',
            'tracking_no' => $trackingNo,
        ]);

        $orderId = (int) $pdo->lastInsertId();

        $orderItemInsert = $pdo->prepare("
            INSERT INTO order_items (
                order_id,
                product_id,
                product_title_snapshot,
                unit_type_snapshot,
                quantity,
                unit_price,
                total_price,
                harvest_date_snapshot
            ) VALUES (
                :order_id,
                :product_id,
                :product_title_snapshot,
                :unit_type_snapshot,
                :quantity,
                :unit_price,
                :total_price,
                NULL
            )
        ");

        $orderItemInsert->execute([
            'order_id' => $orderId,
            'product_id' => (int) $basket['product_id'],
            'product_title_snapshot' => $basket['product_title'],
            'unit_type_snapshot' => $basket['unit_type'],
            'quantity' => $currentQuantity,
            'unit_price' => $discountedUnitPrice,
            'total_price' => $totalAmount,
        ]);

        $walletUpdate = $pdo->prepare("
            UPDATE wallets
            SET balance = balance - :amount
            WHERE user_id = :user_id
        ");

        $walletTransactionInsert = $pdo->prepare("
            INSERT INTO wallet_transactions (
                user_id,
                transaction_type,
                amount,
                balance_after,
                order_id,
                description
            ) VALUES (
                :user_id,
                'basket_payment',
                :amount,
                :balance_after,
                :order_id,
                :description
            )
        ");

        $paymentInsert = $pdo->prepare("
            INSERT INTO neighborhood_basket_payments (
                basket_member_id,
                wallet_transaction_id,
                amount,
                status
            ) VALUES (
                :basket_member_id,
                :wallet_transaction_id,
                :amount,
                'paid'
            )
        ");

        foreach ($members as $member) {
            $quantity = (float) $member['quantity'];
            $memberAmount = $quantity * $discountedUnitPrice;
            $balanceBefore = (float) $member['balance'];
            $balanceAfter = $balanceBefore - $memberAmount;

            $walletUpdate->execute([
                'amount' => $memberAmount,
                'user_id' => (int) $member['user_id'],
            ]);

            $walletTransactionInsert->execute([
                'user_id' => (int) $member['user_id'],
                'amount' => -1 * $memberAmount,
                'balance_after' => $balanceAfter,
                'order_id' => $orderId,
                'description' => 'Mahalle Sepeti toplu alım ödemesi. Sepet ID: ' . $basketId,
            ]);

            $walletTransactionId = (int) $pdo->lastInsertId();

            $paymentInsert->execute([
                'basket_member_id' => (int) $member['member_id'],
                'wallet_transaction_id' => $walletTransactionId,
                'amount' => $memberAmount,
            ]);

            nb_notify_basket_ordered(
                (int) $member['user_id'],
                $basketId,
                $orderId,
                (string) $basket['title'],
                $memberAmount
            );
        }

        $productUpdate = $pdo->prepare("
            UPDATE products
            SET stock_quantity = stock_quantity - :quantity
            WHERE id = :product_id
        ");

        $productUpdate->execute([
            'quantity' => $currentQuantity,
            'product_id' => (int) $basket['product_id'],
        ]);

        $membersUpdate = $pdo->prepare("
            UPDATE neighborhood_basket_members
            SET status = 'paid'
            WHERE basket_id = :basket_id
              AND status = 'active'
        ");

        $membersUpdate->execute([
            'basket_id' => $basketId,
        ]);

        $basketUpdate = $pdo->prepare("
            UPDATE neighborhood_baskets
            SET
                status = 'ordered',
                order_id = :order_id
            WHERE id = :basket_id
        ");

        $basketUpdate->execute([
            'order_id' => $orderId,
            'basket_id' => $basketId,
        ]);

        nb_notify_basket_producer_order(
            (int) $basket['producer_id'],
            $basketId,
            $orderId,
            (string) $basket['title'],
            $totalAmount
        );

        $pdo->commit();

        nb_flash(
            'success',
            'Toplu sipariş başarıyla oluşturuldu. Katılımcıların bakiyeleri düşüldü ve sipariş üreticiye gönderildi.'
        );

        nb_redirect('neighborhood-baskets.php?action=show&id=' . $basketId);
    } catch (Throwable $e) {
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }

        nb_flash('error', 'Toplu sipariş oluşturulurken hata oluştu: ' . $e->getMessage());
        nb_redirect('neighborhood-baskets.php?action=show&id=' . $basketId);
    }
}

require APP_PATH . '/Views/layouts/header.php';

$toast = nb_consume_flash();

if ($action === 'create') {
    nb_render_toast($toast);
    require APP_PATH . '/Views/neighborhood-baskets/create.php';
    require APP_PATH . '/Views/layouts/footer.php';
    exit;
}

if ($action === 'accept-invite') {
    nb_render_toast($toast);

    $acceptInviteView = APP_PATH . '/Views/neighborhood-baskets/accept-invite.php';

    if (file_exists($acceptInviteView)) {
        require $acceptInviteView;
    } else {
        ?>
        <main class="neighborhood-page">
            <section class="neighborhood-hero-section">
                <div class="container neighborhood-hero-container">
                    <div class="neighborhood-empty-offers">
                        <span>🧺</span>
                        <h3>Davet kabul sayfası henüz eklenmedi</h3>
                        <p>
                            Bu dosyayı bir sonraki adımda oluşturacağız:
                            <strong>app/Views/neighborhood-baskets/accept-invite.php</strong>
                        </p>
                    </div>
                </div>
            </section>
        </main>
        <?php
    }

    require APP_PATH . '/Views/layouts/footer.php';
    exit;
}

if ($action === 'show') {
    nb_render_toast($toast);

    $showView = APP_PATH . '/Views/neighborhood-baskets/show.php';

    if (file_exists($showView)) {
        require $showView;
    } else {
        ?>
        <main class="neighborhood-page">
            <section class="neighborhood-hero-section">
                <div class="container neighborhood-hero-container">
                    <div class="neighborhood-empty-offers">
                        <span>📦</span>
                        <h3>Sepet detay sayfası henüz eklenmedi</h3>
                        <p>
                            Bu dosyayı daha sonraki adımda oluşturacağız:
                            <strong>app/Views/neighborhood-baskets/show.php</strong>
                        </p>
                    </div>
                </div>
            </section>
        </main>
        <?php
    }

    require APP_PATH . '/Views/layouts/footer.php';
    exit;
}

$activeOffers = [];

try {
    $offerStatement = db()->query("
        SELECT
            nbo.id,
            nbo.producer_id,
            nbo.product_id,
            nbo.title,
            nbo.description,
            nbo.min_quantity,
            nbo.discount_percent,
            nbo.unit_type,
            nbo.starts_at,
            nbo.ends_at,
            p.title AS product_title,
            p.price AS product_price,
            p.stock_quantity,
            COALESCE(pp.store_name, u.full_name) AS producer_name,
            pr.name AS province_name,
            d.name AS district_name
        FROM neighborhood_basket_offers nbo
        INNER JOIN products p ON p.id = nbo.product_id
        INNER JOIN users u ON u.id = nbo.producer_id
        LEFT JOIN producer_profiles pp ON pp.user_id = u.id
        LEFT JOIN provinces pr ON pr.id = u.province_id
        LEFT JOIN districts d ON d.id = u.district_id
        WHERE nbo.status = 'active'
          AND p.status = 'active'
          AND (nbo.starts_at IS NULL OR nbo.starts_at <= NOW())
          AND (nbo.ends_at IS NULL OR nbo.ends_at >= NOW())
        ORDER BY nbo.created_at DESC
    ");

    $activeOffers = $offerStatement->fetchAll(PDO::FETCH_ASSOC);
} catch (Throwable $e) {
    $activeOffers = [];
}

nb_render_toast($toast);

?>

<main class="neighborhood-page">

    <section class="neighborhood-hero-section">
        <div class="container neighborhood-hero-container">

            <div class="neighborhood-hero-content">
                <span class="neighborhood-mini-title">EkineraGo Mahalle Sepeti</span>

                <h1>Komşularınla birleş, üreticiden toplu ve uygun al.</h1>

                <p>
                    Mahalle Sepeti; aynı mahalledeki kullanıcıların veya tek başına yüklü miktarda
                    ürün almak isteyen kişilerin üreticiden daha uygun fiyatla toplu alım yapmasını sağlar.
                    Üretici indirim ilanı oluşturur, tüketici bu ilana bağlı mahalle sepeti başlatır.
                </p>

                <div class="neighborhood-actions">
                    <?php if ($isConsumer): ?>
                        <a class="neighborhood-primary-btn" href="<?= e(url('neighborhood-baskets.php?action=create')) ?>">
                            Mahalle Sepeti Oluştur
                        </a>

                        <a class="neighborhood-secondary-btn" href="#active-offers">
                            Aktif İlanları Gör
                        </a>
                    <?php elseif ($isProducer): ?>
                        <a class="neighborhood-primary-btn" href="<?= e(url('producer/neighborhood-offers.php')) ?>">
                            Toplu Alım İlanı Oluştur
                        </a>

                        <a class="neighborhood-secondary-btn" href="#active-offers">
                            Aktif İlanları Gör
                        </a>
                    <?php elseif (!$user): ?>
                        <a class="neighborhood-primary-btn" href="<?= e(url('login.php')) ?>">
                            Giriş Yap ve Başlat
                        </a>

                        <a class="neighborhood-secondary-btn" href="<?= e(url('products.php')) ?>">
                            Ürünleri İncele
                        </a>
                    <?php else: ?>
                        <a class="neighborhood-primary-btn" href="<?= e(url('products.php')) ?>">
                            Ürünleri Keşfet
                        </a>
                    <?php endif; ?>
                </div>
            </div>

        </div>
    </section>

    <section class="neighborhood-offers-section" id="active-offers">
        <div class="container">

            <div class="section-heading section-heading-compact">
                <span>Aktif toplu alım ilanları</span>
                <h2>Üreticilerin Mahalle Sepeti indirimleri</h2>
                <p>
                    Üreticilerin belirlediği minimum miktar ve indirim oranlarına göre
                    mahalle sepeti başlatabilirsin.
                </p>
            </div>

            <?php if (!$activeOffers): ?>
                <div class="neighborhood-empty-offers">
                    <span>🏷️</span>
                    <h3>Henüz aktif toplu alım ilanı yok</h3>
                    <p>
                        Üreticiler toplu alım indirimi oluşturduğunda bu alanda görünecek.
                        Örneğin 100 kg üzeri domateste %10 indirim gibi ilanlar burada listelenecek.
                    </p>
                </div>
            <?php else: ?>
                <div class="neighborhood-offer-grid">
                    <?php foreach ($activeOffers as $offer): ?>
                        <?php
                            $productPrice = (float) ($offer['product_price'] ?? 0);
                            $discountPercent = (float) ($offer['discount_percent'] ?? 0);
                            $discountedPrice = $productPrice - (($productPrice * $discountPercent) / 100);

                            $locationParts = array_filter([
                                $offer['province_name'] ?? null,
                                $offer['district_name'] ?? null,
                            ]);

                            $locationText = $locationParts
                                ? implode(' / ', $locationParts)
                                : 'Konum belirtilmemiş';
                        ?>

                        <article class="neighborhood-offer-card">
                            <div class="offer-card-top">
                                <span class="offer-card-icon">🏷️</span>

                                <div>
                                    <h3><?= e($offer['title']) ?></h3>
                                    <p>
                                        <?= e($offer['producer_name'] ?? 'Üretici') ?>
                                        ·
                                        <?= e($locationText) ?>
                                    </p>
                                </div>
                            </div>

                            <?php if (!empty($offer['description'])): ?>
                                <p class="offer-card-description">
                                    <?= e($offer['description']) ?>
                                </p>
                            <?php endif; ?>

                            <div class="offer-card-product">
                                <span>Ürün</span>
                                <strong><?= e($offer['product_title']) ?></strong>
                            </div>

                            <div class="offer-card-meta">
                                <div>
                                    <span>Minimum</span>
                                    <strong>
                                        <?= e((string) $offer['min_quantity']) ?>
                                        <?= e($offer['unit_type']) ?>
                                    </strong>
                                </div>

                                <div>
                                    <span>İndirim</span>
                                    <strong>%<?= e((string) $offer['discount_percent']) ?></strong>
                                </div>

                                <div>
                                    <span>Normal fiyat</span>
                                    <strong><?= e(number_format($productPrice, 2, ',', '.')) ?> TL</strong>
                                </div>

                                <div>
                                    <span>İndirimli fiyat</span>
                                    <strong><?= e(number_format($discountedPrice, 2, ',', '.')) ?> TL</strong>
                                </div>
                            </div>

                            <div class="offer-card-actions">
                                <?php if ($isConsumer): ?>
                                    <a
                                        class="offer-start-btn"
                                        href="<?= e(url('neighborhood-baskets.php?action=create&offer_id=' . $offer['id'])) ?>"
                                    >
                                        Mahalle Sepeti Başlat
                                    </a>
                                <?php elseif (!$user): ?>
                                    <a class="offer-start-btn" href="<?= e(url('login.php')) ?>">
                                        Giriş Yap ve Başlat
                                    </a>
                                <?php elseif ($isProducer): ?>
                                    <a class="offer-start-btn offer-start-btn-secondary" href="<?= e(url('producer/neighborhood-offers.php')) ?>">
                                        İlanlarını Yönet
                                    </a>
                                <?php else: ?>
                                    <a class="offer-start-btn" href="<?= e(url('products.php')) ?>">
                                        Ürünleri İncele
                                    </a>
                                <?php endif; ?>
                            </div>
                        </article>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

        </div>
    </section>

    <section class="neighborhood-info-section">
        <div class="container">

            <div class="section-heading">
                <span>Nasıl çalışır?</span>
                <h2>Mahalle Sepeti ile toplu alım süreci</h2>
            </div>

            <div class="neighborhood-step-grid">
                <article class="neighborhood-step-card">
                    <div class="step-number">1</div>
                    <h3>Üretici indirim ilanı açar</h3>
                    <p>
                        Üretici ürün için minimum miktar ve indirim oranı belirler.
                        Örneğin 100 kg üzeri domateste %10 indirim.
                    </p>
                </article>

                <article class="neighborhood-step-card">
                    <div class="step-number">2</div>
                    <h3>Tüketici sepet başlatır</h3>
                    <p>
                        Tüketici aktif toplu alım ilanlarından birini seçerek grup veya bireysel
                        mahalle sepeti oluşturur.
                    </p>
                </article>

                <article class="neighborhood-step-card">
                    <div class="step-number">3</div>
                    <h3>Davetler gönderilir</h3>
                    <p>
                        Grup sepetinde katılacak kişilerin e-posta adresleri girilir.
                        Kayıtlı kullanıcılara bildirim düşer, daveti kabul edenler kendi miktarını girer.
                    </p>
                </article>

                <article class="neighborhood-step-card">
                    <div class="step-number">4</div>
                    <h3>Toplu siparişe dönüşür</h3>
                    <p>
                        Hedef miktara ulaşıldığında sepet toplu siparişe hazır hale gelir.
                        Sepeti oluşturan kişi son onayı verir.
                    </p>
                </article>
            </div>

        </div>
    </section>

    <section class="neighborhood-type-section">
        <div class="container neighborhood-type-grid">

            <article class="neighborhood-type-card">
                <div class="type-icon">👥</div>
                <h2>Grup Mahalle Sepeti</h2>
                <p>
                    Salça, turşu, kışlık hazırlık veya toplu aile alışverişi için birkaç kişi birleşir.
                    Sepeti oluşturan kişi davetlilerin e-posta adreslerini girer ve kabul edenler aynı
                    sepeti takip eder.
                </p>
            </article>

            <article class="neighborhood-type-card">
                <div class="type-icon">📦</div>
                <h2>Bireysel Toplu Alım</h2>
                <p>
                    Tek başına yüksek miktarda ürün almak isteyen kullanıcı da Mahalle Sepeti oluşturabilir.
                    Böylece toplu alım indiriminden bireysel olarak yararlanabilir.
                </p>
            </article>

            <article class="neighborhood-type-card">
                <div class="type-icon">🏷️</div>
                <h2>Üretici İndirimi</h2>
                <p>
                    İndirim oranını tüketici değil, üretici belirler. Tüketici üreticinin açtığı
                    aktif toplu alım ilanlarından birini seçerek sepet başlatır.
                </p>
            </article>

        </div>
    </section>

</main>

<style>
    .neighborhood-page {
        min-height: calc(100vh - 90px);
        background:
            radial-gradient(circle at top left, rgba(150, 210, 153, 0.28), transparent 32%),
            linear-gradient(135deg, #f8fcf5 0%, #eef8ec 100%);
        color: #263326;
    }

    .neighborhood-hero-section {
        padding: 34px 0 30px;
    }

    .neighborhood-hero-container {
        max-width: 980px;
        margin: 0 auto;
        text-align: center;
    }

    .neighborhood-mini-title {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 8px 16px;
        margin-bottom: 14px;
        border-radius: 999px;
        background: rgba(255, 255, 255, 0.82);
        border: 1px solid rgba(195, 225, 188, 0.95);
        color: #3f8f46;
        font-size: 13px;
        font-weight: 950;
        letter-spacing: 0.06em;
        text-transform: uppercase;
    }

    .neighborhood-hero-content h1 {
        max-width: 880px;
        margin: 0 auto;
        color: #245c2f;
        font-size: clamp(34px, 5vw, 52px);
        line-height: 1.07;
        letter-spacing: -0.055em;
        font-weight: 950;
    }

    .neighborhood-hero-content p {
        max-width: 850px;
        margin: 18px auto 0;
        color: #647064;
        font-size: 18px;
        line-height: 1.7;
    }

    .neighborhood-actions {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 14px;
        flex-wrap: wrap;
        margin-top: 24px;
    }

    .neighborhood-primary-btn,
    .neighborhood-secondary-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 48px;
        padding: 0 24px;
        border-radius: 999px;
        text-decoration: none;
        font-weight: 950;
        transition: 0.22s ease;
    }

    .neighborhood-primary-btn {
        background: #245c2f;
        color: #ffffff;
        box-shadow: 0 14px 28px rgba(36, 92, 47, 0.22);
    }

    .neighborhood-primary-btn:hover {
        background: #1d4b27;
        transform: translateY(-2px);
    }

    .neighborhood-secondary-btn {
        background: #ffffff;
        color: #245c2f;
        border: 1px solid #d9ead3;
    }

    .neighborhood-secondary-btn:hover {
        background: #eef8ec;
        transform: translateY(-2px);
    }

    .neighborhood-offers-section {
        padding: 24px 0 34px;
    }

    .neighborhood-info-section,
    .neighborhood-type-section {
        padding: 28px 0;
    }

    .section-heading {
        text-align: center;
        max-width: 760px;
        margin: 0 auto 22px;
    }

    .section-heading-compact {
        margin-bottom: 24px;
    }

    .section-heading span {
        display: inline-block;
        color: #3f8f46;
        font-size: 14px;
        font-weight: 950;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        margin-bottom: 8px;
    }

    .section-heading h2 {
        margin: 0;
        color: #245c2f;
        font-size: clamp(27px, 4vw, 38px);
        line-height: 1.15;
        letter-spacing: -0.04em;
    }

    .section-heading p {
        max-width: 680px;
        margin: 10px auto 0;
        color: #647064;
        line-height: 1.65;
    }

    .neighborhood-empty-offers {
        max-width: 680px;
        margin: 0 auto;
        padding: 34px 24px;
        border-radius: 28px;
        text-align: center;
        background: rgba(255, 255, 255, 0.9);
        border: 1px dashed #cfe6c9;
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.08);
    }

    .neighborhood-empty-offers > span {
        display: inline-flex;
        font-size: 42px;
        margin-bottom: 10px;
    }

    .neighborhood-empty-offers h3 {
        margin: 0 0 8px;
        color: #245c2f;
        font-size: 24px;
    }

    .neighborhood-empty-offers p {
        margin: 0;
        color: #647064;
        line-height: 1.65;
    }

    .neighborhood-offer-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(290px, 1fr));
        gap: 18px;
        align-items: stretch;
    }

    .neighborhood-offer-card {
        display: flex;
        flex-direction: column;
        gap: 16px;
        min-height: 100%;
        padding: 24px;
        border-radius: 28px;
        background: rgba(255, 255, 255, 0.94);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.10);
    }

    .offer-card-top {
        display: flex;
        align-items: flex-start;
        gap: 14px;
    }

    .offer-card-icon {
        width: 48px;
        height: 48px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 18px;
        background: #eef8ec;
        font-size: 24px;
        flex: 0 0 auto;
    }

    .offer-card-top h3 {
        margin: 0 0 6px;
        color: #245c2f;
        font-size: 22px;
        line-height: 1.2;
        text-transform: capitalize;
    }

    .offer-card-top p,
    .offer-card-description {
        margin: 0;
        color: #647064;
        line-height: 1.55;
    }

    .offer-card-description {
        min-height: 48px;
    }

    .offer-card-product {
        padding: 14px;
        border-radius: 18px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
    }

    .offer-card-product span {
        display: block;
        color: #7b887b;
        font-size: 12px;
        font-weight: 900;
        margin-bottom: 4px;
    }

    .offer-card-product strong {
        color: #245c2f;
        font-size: 17px;
    }

    .offer-card-meta {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 10px;
    }

    .offer-card-meta div {
        padding: 12px;
        border-radius: 16px;
        background: #ffffff;
        border: 1px solid #edf5e9;
    }

    .offer-card-meta span {
        display: block;
        color: #7b887b;
        font-size: 12px;
        font-weight: 900;
        margin-bottom: 5px;
    }

    .offer-card-meta strong {
        display: block;
        color: #245c2f;
        font-size: 14px;
    }

    .offer-card-actions {
        margin-top: auto;
    }

    .offer-start-btn {
        display: inline-flex;
        width: 100%;
        min-height: 46px;
        align-items: center;
        justify-content: center;
        padding: 0 18px;
        border-radius: 999px;
        background: #245c2f;
        color: #ffffff;
        text-decoration: none;
        font-weight: 950;
        box-shadow: 0 14px 28px rgba(36, 92, 47, 0.18);
        transition: 0.22s ease;
    }

    .offer-start-btn:hover {
        background: #1d4b27;
        transform: translateY(-2px);
    }

    .offer-start-btn-secondary {
        background: #3f8f46;
    }

    .neighborhood-step-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 16px;
    }

    .neighborhood-step-card,
    .neighborhood-type-card {
        padding: 24px;
        border-radius: 26px;
        background: rgba(255, 255, 255, 0.9);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.10);
    }

    .step-number,
    .type-icon {
        width: 46px;
        height: 46px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 17px;
        background: #eef8ec;
        color: #245c2f;
        font-size: 20px;
        font-weight: 950;
        margin-bottom: 15px;
    }

    .type-icon {
        font-size: 24px;
    }

    .neighborhood-step-card h3,
    .neighborhood-type-card h2 {
        margin: 0 0 10px;
        color: #245c2f;
        font-size: 21px;
    }

    .neighborhood-step-card p,
    .neighborhood-type-card p {
        margin: 0;
        color: #647064;
        line-height: 1.65;
    }

    .neighborhood-type-grid {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 18px;
        padding-bottom: 58px;
    }

    @media (max-width: 980px) {
        .neighborhood-step-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 760px) {
        .neighborhood-type-grid,
        .neighborhood-offer-grid {
            grid-template-columns: 1fr;
        }

        .neighborhood-hero-section {
            padding-top: 28px;
        }

        .neighborhood-hero-content h1 {
            font-size: clamp(31px, 9vw, 42px);
        }
    }

    @media (max-width: 560px) {
        .neighborhood-step-grid {
            grid-template-columns: 1fr;
        }

        .neighborhood-actions {
            align-items: stretch;
            flex-direction: column;
        }

        .neighborhood-primary-btn,
        .neighborhood-secondary-btn {
            width: 100%;
        }

        .neighborhood-step-card,
        .neighborhood-type-card,
        .neighborhood-offer-card {
            padding: 20px;
            border-radius: 22px;
        }

        .neighborhood-hero-content p {
            font-size: 16px;
        }

        .offer-card-meta {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>