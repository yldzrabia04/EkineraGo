<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ProducerMiddleware::handle();

$producerId = (int) currentUserId();

$status = trim((string) ($_GET['status'] ?? ''));
$allowedStatuses = ['', 'pending', 'answered', 'hidden'];

if (!in_array($status, $allowedStatuses, true)) {
    $status = '';
}

$focusQuestionId = (int) ($_GET['question_id'] ?? 0);

$questionService = new ProductQuestionService();
$questions = $questionService->getProducerQuestions($producerId, $status);
$pendingCount = $questionService->countPendingByProducerId($producerId);

$pageTitle = 'Ürün Soruları';
$bodyClass = 'page-producer-questions';

require APP_PATH . '/Views/layouts/header.php';

if (!function_exists('producer_question_status_label')) {
    function producer_question_status_label(string $status): string
    {
        return match ($status) {
            'pending' => 'Cevap Bekliyor',
            'answered' => 'Cevaplandı',
            'hidden' => 'Gizlendi',
            'deleted' => 'Silindi',
            default => 'Bilinmiyor',
        };
    }
}

if (!function_exists('producer_question_status_badge')) {
    function producer_question_status_badge(string $status): string
    {
        return match ($status) {
            'pending' => 'badge-warning',
            'answered' => 'badge-success',
            'hidden' => 'badge-muted',
            'deleted' => 'badge-danger',
            default => 'badge-muted',
        };
    }
}

if (!function_exists('producer_question_unit_label')) {
    function producer_question_unit_label(string $unit): string
    {
        return match ($unit) {
            'kg' => 'kg',
            'piece' => 'adet',
            'bunch' => 'demet',
            'box' => 'kasa',
            default => $unit,
        };
    }
}
?>

<main class="container">
    <section class="card page-heading">
        <div>
            <h1>Ürün Soruları</h1>

            <p>
                Tüketicilerin ürünlerin hakkında sorduğu soruları buradan cevaplayabilirsin.
                Cevap verdiğinde tüketiciye otomatik bildirim gider.
            </p>
        </div>

        <div class="heading-stat">
            <strong><?= e((string) $pendingCount) ?></strong>
            <span>Cevap bekleyen soru</span>
        </div>
    </section>

    <section class="card filter-card">
        <a class="filter-link <?= $status === '' ? 'active' : '' ?>" href="<?= e(url('producer/questions.php')) ?>">
            Tümü
        </a>

        <a class="filter-link <?= $status === 'pending' ? 'active' : '' ?>" href="<?= e(url('producer/questions.php?status=pending')) ?>">
            Cevap Bekleyenler
        </a>

        <a class="filter-link <?= $status === 'answered' ? 'active' : '' ?>" href="<?= e(url('producer/questions.php?status=answered')) ?>">
            Cevaplananlar
        </a>

        <a class="filter-link <?= $status === 'hidden' ? 'active' : '' ?>" href="<?= e(url('producer/questions.php?status=hidden')) ?>">
            Gizlenenler
        </a>
    </section>

    <?php if (empty($questions)): ?>
        <section class="card empty-state">
            <h2>Henüz soru yok</h2>

            <p>
                Ürün detay sayfalarından tüketiciler soru sorduğunda burada listelenecek.
            </p>

            <a class="btn" href="<?= e(url('producer/products.php')) ?>">
                Ürünlerime Git
            </a>
        </section>
    <?php else: ?>
        <section class="question-list">
            <?php foreach ($questions as $question): ?>
                <?php
                    $questionId = (int) ($question['id'] ?? 0);
                    $productId = (int) ($question['product_id'] ?? 0);
                    $questionStatus = (string) ($question['status'] ?? 'pending');
                    $unit = producer_question_unit_label((string) ($question['product_unit_type'] ?? 'kg'));
                    $isFocused = $focusQuestionId > 0 && $focusQuestionId === $questionId;
                    $answer = trim((string) ($question['answer'] ?? ''));
                ?>

                <article
                    class="card question-card <?= $isFocused ? 'focused' : '' ?>"
                    id="question-<?= e((string) $questionId) ?>"
                    data-question-id="<?= e((string) $questionId) ?>"
                >
                    <div class="question-header">
                        <div>
                            <h2><?= e($question['product_title'] ?? 'Ürün') ?></h2>

                            <p>
                                Soran:
                                <strong><?= e($question['consumer_name'] ?? 'Tüketici') ?></strong>
                                ·
                                <?= !empty($question['created_at'])
                                    ? e(date('d.m.Y H:i', strtotime($question['created_at'])))
                                    : '-'
                                ?>
                            </p>

                            <p>
                                Ürün fiyatı:
                                <strong>
                                    <?= e(formatMoney($question['product_price'] ?? 0)) ?>
                                    /
                                    <?= e($unit) ?>
                                </strong>
                            </p>
                        </div>

                        <div class="question-header-actions">
                            <span class="badge <?= e(producer_question_status_badge($questionStatus)) ?>">
                                <?= e(producer_question_status_label($questionStatus)) ?>
                            </span>

                            <?php if ($productId > 0): ?>
                                <a
                                    class="small-link"
                                    href="<?= e(url('product-detail.php?id=' . $productId . '#questions')) ?>"
                                    target="_blank"
                                >
                                    Üründe Gör
                                </a>
                            <?php endif; ?>
                        </div>
                    </div>

                    <div class="question-body">
                        <strong>Tüketici sorusu:</strong>

                        <p><?= nl2br(e($question['question'] ?? '')) ?></p>
                    </div>

                    <div class="answer-area" data-answer-area="<?= e((string) $questionId) ?>">
                        <?php if ($answer !== ''): ?>
                            <div class="answer-box">
                                <strong>Senin cevabın:</strong>

                                <p><?= nl2br(e($answer)) ?></p>

                                <span>
                                    <?= !empty($question['answered_at'])
                                        ? e(date('d.m.Y H:i', strtotime($question['answered_at'])))
                                        : ''
                                    ?>
                                </span>
                            </div>
                        <?php endif; ?>
                    </div>

                    <?php if ($questionStatus !== 'hidden' && $questionStatus !== 'deleted'): ?>
                        <div
                            class="ajax-message"
                            data-message-for="<?= e((string) $questionId) ?>"
                            hidden
                        ></div>

                        <form
                            method="POST"
                            action="<?= e(url('api/product-question-answer.php')) ?>"
                            class="answer-form"
                            data-answer-form
                        >
                            <?= csrf_field() ?>

                            <input type="hidden" name="question_id" value="<?= e((string) $questionId) ?>">

                            <div class="form-group">
                                <label for="answer-<?= e((string) $questionId) ?>">
                                    <?= $answer !== '' ? 'Cevabı Güncelle' : 'Cevap Yaz' ?>
                                </label>

                                <textarea
                                    id="answer-<?= e((string) $questionId) ?>"
                                    name="answer"
                                    rows="4"
                                    maxlength="1000"
                                    placeholder="Tüketicinin sorusuna açık ve net cevap ver..."
                                    required
                                ><?= e($answer) ?></textarea>
                            </div>

                            <button class="btn" type="submit">
                                <?= $answer !== '' ? 'Cevabı Güncelle' : 'Cevabı Gönder' ?>
                            </button>
                        </form>
                    <?php else: ?>
                        <div class="inline-info-box">
                            Bu soru gizlendiği veya silindiği için cevaplanamaz.
                        </div>
                    <?php endif; ?>
                </article>
            <?php endforeach; ?>
        </section>
    <?php endif; ?>
</main>

<style>
    .page-heading {
        display: flex;
        justify-content: space-between;
        gap: 18px;
        align-items: center;
        margin-bottom: 18px;
    }

    .page-heading h1,
    .question-card h2,
    .empty-state h2 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p,
    .question-header p,
    .question-body p,
    .answer-box p,
    .empty-state p {
        color: #526052;
        line-height: 1.6;
    }

    .heading-stat {
        min-width: 180px;
        padding: 16px;
        border-radius: 14px;
        background: #f8fbf6;
        text-align: center;
    }

    .heading-stat strong {
        display: block;
        font-size: 32px;
        color: #245c2f;
    }

    .heading-stat span {
        color: #526052;
        font-size: 14px;
    }

    .filter-card {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
        margin-bottom: 18px;
    }

    .filter-link {
        display: inline-block;
        padding: 9px 13px;
        border-radius: 999px;
        background: #f8fbf6;
        color: #245c2f;
        text-decoration: none;
        font-weight: bold;
    }

    .filter-link.active,
    .filter-link:hover {
        background: #245c2f;
        color: #fff;
    }

    .question-list {
        display: grid;
        gap: 18px;
    }

    .question-card.focused {
        border: 2px solid #2f7d3d;
        box-shadow: 0 0 0 4px rgba(47, 125, 61, .12);
    }

    .question-header {
        display: flex;
        justify-content: space-between;
        gap: 18px;
        align-items: flex-start;
        border-bottom: 1px solid #edf1ea;
        padding-bottom: 14px;
        margin-bottom: 14px;
    }

    .question-header-actions {
        display: grid;
        gap: 9px;
        justify-items: end;
    }

    .badge {
        display: inline-block;
        padding: 6px 10px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: bold;
        white-space: nowrap;
    }

    .badge-success {
        background: #e7f7e8;
        color: #236b2c;
    }

    .badge-warning {
        background: #fff5d6;
        color: #8a6200;
    }

    .badge-danger {
        background: #ffe8e8;
        color: #9b111e;
    }

    .badge-muted {
        background: #edf1ea;
        color: #526052;
    }

    .small-link {
        color: #2f7d3d;
        font-weight: bold;
        text-decoration: none;
        white-space: nowrap;
    }

    .small-link:hover {
        text-decoration: underline;
    }

    .question-body {
        padding: 16px;
        border-radius: 14px;
        background: #f8fbf6;
        margin-bottom: 14px;
    }

    .question-body strong,
    .answer-box strong,
    .answer-form label {
        color: #245c2f;
    }

    .answer-box {
        padding: 16px;
        border-radius: 14px;
        background: #eef8ef;
        border-left: 4px solid #2f7d3d;
        margin-bottom: 14px;
    }

    .answer-box span {
        color: #718071;
        font-size: 14px;
    }

    .answer-form {
        display: grid;
        gap: 12px;
    }

    .form-group {
        display: grid;
        gap: 7px;
    }

    .answer-form textarea {
        width: 100%;
        padding: 11px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
        font-family: Arial, sans-serif;
    }

    .ajax-message {
        margin-bottom: 14px;
        padding: 12px 14px;
        border-radius: 10px;
        font-weight: 600;
    }

    .ajax-message.success {
        background: #e7f7e8;
        color: #236b2c;
    }

    .ajax-message.error {
        background: #fdeaea;
        color: #9b111e;
    }

    .inline-info-box {
        padding: 14px;
        border-radius: 12px;
        background: #f8fbf6;
        color: #526052;
        font-weight: bold;
    }

    .empty-state {
        text-align: center;
        padding: 34px;
    }

    @media (max-width: 800px) {
        .page-heading,
        .question-header {
            flex-direction: column;
        }

        .heading-stat {
            width: 100%;
        }

        .question-header-actions {
            justify-items: start;
        }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        function showMessage(element, type, message) {
            if (!element) {
                return;
            }

            element.hidden = false;
            element.className = 'ajax-message ' + type;
            element.textContent = message;
        }

        function clearMessage(element) {
            if (!element) {
                return;
            }

            element.hidden = true;
            element.className = 'ajax-message';
            element.textContent = '';
        }

        function escapeHtml(value) {
            return String(value || '')
                .replaceAll('&', '&amp;')
                .replaceAll('<', '&lt;')
                .replaceAll('>', '&gt;')
                .replaceAll('"', '&quot;')
                .replaceAll("'", '&#039;');
        }

        function nl2br(value) {
            return escapeHtml(value).replaceAll('\n', '<br>');
        }

        document.querySelectorAll('[data-answer-form]').forEach(function (form) {
            form.addEventListener('submit', async function (event) {
                event.preventDefault();

                const questionId = form.querySelector('input[name="question_id"]').value;
                const messageBox = document.querySelector('[data-message-for="' + questionId + '"]');
                const answerArea = document.querySelector('[data-answer-area="' + questionId + '"]');
                const submitButton = form.querySelector('button[type="submit"]');
                const answerTextarea = form.querySelector('textarea[name="answer"]');

                clearMessage(messageBox);

                if (submitButton) {
                    submitButton.disabled = true;
                    submitButton.textContent = 'Gönderiliyor...';
                }

                try {
                    const formData = new FormData(form);
                    const answer = formData.get('answer');

                    const response = await fetch(form.action, {
                        method: 'POST',
                        body: formData,
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'Accept': 'application/json'
                        }
                    });

                    const result = await response.json();

                    if (!result.success) {
                        throw new Error(result.message || 'Cevap gönderilemedi.');
                    }

                    showMessage(messageBox, 'success', result.message || 'Cevabınız gönderildi.');

                    if (answerArea) {
                        answerArea.innerHTML = `
                            <div class="answer-box">
                                <strong>Senin cevabın:</strong>
                                <p>${nl2br(answer)}</p>
                                <span>Az önce</span>
                            </div>
                        `;
                    }

                    const card = form.closest('.question-card');

                    if (card) {
                        const badge = card.querySelector('.badge');

                        if (badge) {
                            badge.className = 'badge badge-success';
                            badge.textContent = 'Cevaplandı';
                        }
                    }

                    if (answerTextarea) {
                        answerTextarea.value = answer;
                    }

                    if (submitButton) {
                        submitButton.textContent = 'Cevabı Güncelle';
                    }
                } catch (error) {
                    showMessage(messageBox, 'error', error.message || 'Cevap gönderilirken bir hata oluştu.');

                    if (submitButton) {
                        submitButton.textContent = 'Cevabı Gönder';
                    }
                } finally {
                    if (submitButton) {
                        submitButton.disabled = false;
                    }
                }
            });
        });

        const focusedQuestion = document.querySelector('.question-card.focused');

        if (focusedQuestion) {
            focusedQuestion.scrollIntoView({
                behavior: 'smooth',
                block: 'center'
            });
        }
    });
</script>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>