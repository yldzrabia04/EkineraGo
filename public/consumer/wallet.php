<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ConsumerMiddleware::handle();

$walletService = new WalletService();
$userId = (int) currentUserId();

if (is_post()) {
    require_csrf();

    $amount = (float) ($_POST['amount'] ?? 0);
    $result = $walletService->deposit($userId, $amount);

    if ($result['success']) {
        flash_success($result['message']);
    } else {
        flash_error($result['message']);
    }

    redirect('consumer/wallet.php');
}

$wallet = $walletService->getWallet($userId);
$balance = (float) ($wallet['balance'] ?? 0);
$transactions = $walletService->getTransactions($userId);

$pageTitle = 'Sanal Bakiye';
$bodyClass = 'page-consumer-wallet';

require APP_PATH . '/Views/layouts/header.php';

if (!function_exists('wallet_transaction_label')) {
    function wallet_transaction_label(string $type): string
    {
        return match ($type) {
            'deposit' => 'Yükleme',
            'purchase' => 'Satın Alma',
            'refund' => 'İade',
            'producer_income' => 'Üretici Geliri',
            'basket_payment' => 'Mahalle Sepeti',
            default => 'İşlem',
        };
    }
}

if (!function_exists('wallet_transaction_badge')) {
    function wallet_transaction_badge(string $type): string
    {
        return match ($type) {
            'deposit', 'refund', 'producer_income' => 'badge-success',
            'purchase', 'basket_payment' => 'badge-warning',
            default => 'badge-muted',
        };
    }
}
?>

<main class="container">
    <section class="card page-heading">
        <h1>Sanal Bakiye</h1>

        <p>
            Sanal bakiyeni buradan görüntüleyebilir, demo bakiye yükleyebilir ve işlem geçmişini takip edebilirsin.
        </p>
    </section>

    <section class="wallet-layout">
        <div class="card balance-card">
            <h2>Mevcut Bakiye</h2>

            <div class="balance-amount">
                <?= e(formatMoney($balance)) ?>
            </div>

            <p>
                Sipariş oluştururken ödeme bu bakiyeden düşülür.
            </p>
        </div>

        <div class="card deposit-card">
            <h2>Bakiye Yükle</h2>

            <form method="POST" action="<?= e(url('consumer/wallet.php')) ?>" class="wallet-form">
                <?= csrf_field() ?>

                <label for="amount">Yüklenecek Tutar</label>

                <input
                    type="number"
                    id="amount"
                    name="amount"
                    step="0.01"
                    min="1"
                    placeholder="Örn: 500"
                    required
                >

                <button class="btn" type="submit">
                    Bakiye Yükle
                </button>
            </form>
        </div>
    </section>

    <section class="card table-card">
        <h2>Bakiye Hareketleri</h2>

        <?php if (empty($transactions)): ?>
            <div class="empty-state">
                <h3>Henüz bakiye hareketi yok</h3>

                <p>
                    İlk bakiye yükleme veya satın alma işleminden sonra hareketler burada görünecek.
                </p>
            </div>
        <?php else: ?>
            <table>
                <thead>
                    <tr>
                        <th>Tarih</th>
                        <th>İşlem</th>
                        <th>Açıklama</th>
                        <th>Tutar</th>
                        <th>İşlem Sonrası Bakiye</th>
                    </tr>
                </thead>

                <tbody>
                    <?php foreach ($transactions as $transaction): ?>
                        <?php
                            $type = $transaction['transaction_type'] ?? '';
                            $amount = (float) ($transaction['amount'] ?? 0);
                        ?>

                        <tr>
                            <td>
                                <?= !empty($transaction['created_at'])
                                    ? e(date('d.m.Y H:i', strtotime($transaction['created_at'])))
                                    : '-'
                                ?>
                            </td>

                            <td>
                                <span class="badge <?= e(wallet_transaction_badge($type)) ?>">
                                    <?= e(wallet_transaction_label($type)) ?>
                                </span>
                            </td>

                            <td>
                                <?= e($transaction['description'] ?? '-') ?>
                            </td>

                            <td class="<?= $amount < 0 ? 'amount-negative' : 'amount-positive' ?>">
                                <?= e(($amount >= 0 ? '+' : '') . formatMoney($amount)) ?>
                            </td>

                            <td>
                                <?= e(formatMoney($transaction['balance_after'] ?? 0)) ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    </section>
</main>

<style>
    .page-heading {
        margin-bottom: 22px;
    }

    .page-heading h1,
    .wallet-layout h2,
    .table-card h2,
    .empty-state h3 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p,
    .balance-card p,
    .empty-state p {
        color: #526052;
        line-height: 1.5;
    }

    .wallet-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 22px;
        margin-bottom: 22px;
    }

    .balance-amount {
        font-size: 42px;
        font-weight: bold;
        color: #245c2f;
        margin: 18px 0;
    }

    .wallet-form label {
        display: block;
        margin-bottom: 7px;
        font-weight: bold;
        color: #245c2f;
    }

    .wallet-form input {
        width: 100%;
        padding: 11px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
        margin-bottom: 16px;
    }

    .table-card {
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th,
    td {
        text-align: left;
        padding: 14px;
        border-bottom: 1px solid #edf1ea;
    }

    th {
        color: #245c2f;
        background: #f8fbf6;
    }

    .badge {
        display: inline-block;
        padding: 5px 9px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: bold;
    }

    .badge-success {
        background: #e7f7e8;
        color: #236b2c;
    }

    .badge-warning {
        background: #fff5d6;
        color: #8a6200;
    }

    .badge-muted {
        background: #edf1ea;
        color: #526052;
    }

    .amount-positive {
        color: #236b2c;
        font-weight: bold;
    }

    .amount-negative {
        color: #9b111e;
        font-weight: bold;
    }

    .empty-state {
        text-align: center;
        padding: 28px;
        border-radius: 14px;
        background: #f8fbf6;
    }

    @media (max-width: 900px) {
        .wallet-layout {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>