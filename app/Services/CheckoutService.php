<?php

class CheckoutService
{
    private CartService $cartService;
    private WalletService $walletService;
    private ShippingService $shippingService;

    public function __construct()
    {
        $this->cartService = new CartService();
        $this->walletService = new WalletService();
        $this->shippingService = new ShippingService();
    }

    public function preview(int $userId): array
    {
        if ($userId <= 0) {
            return [
                'success' => false,
                'message' => 'Checkout için giriş yapmalısınız.',
                'data' => [
                    'cart' => [],
                    'producer_groups' => [],
                    'cart_total' => 0,
                    'wallet_balance' => 0,
                    'can_checkout' => false,
                ],
            ];
        }

        $cart = $this->cartService->getActiveCart($userId);
        $items = $cart['items'] ?? [];
        $groups = $cart['producer_groups'] ?? [];
        $total = (float) ($cart['total'] ?? 0);
        $balance = $this->walletService->getBalance($userId);

        $stockCheck = $this->validateStock($items);

        return [
            'success' => true,
            'data' => [
                'cart' => $cart,
                'items' => $items,
                'producer_groups' => $groups,
                'cart_total' => $total,
                'wallet_balance' => $balance,
                'can_checkout' => !empty($items) && $balance >= $total && $stockCheck['success'],
                'stock_check' => $stockCheck,
            ],
        ];
    }

    public function checkout(int $userId, array $payload = []): array
    {
        if ($userId <= 0) {
            return [
                'success' => false,
                'message' => 'Satın alma işlemi için giriş yapmalısınız.',
            ];
        }

        try {
            $result = db_transaction(function () use ($userId, $payload) {
                $cart = Cart::getOrCreateActiveByUserId($userId);
                $items = CartItem::getItemsByCartId((int) $cart['id']);

                if (empty($items)) {
                    throw new RuntimeException('Sepetiniz boş.');
                }

                $stockCheck = $this->validateStock($items);

                if (!$stockCheck['success']) {
                    throw new RuntimeException($stockCheck['message']);
                }

                $groups = $this->cartService->groupItemsByProducer($items);
                $cartTotal = $this->cartService->calculateTotal($items);

                $wallet = $this->getWalletForUpdate($userId);
                $currentBalance = (float) ($wallet['balance'] ?? 0);

                if ($currentBalance < $cartTotal) {
                    throw new RuntimeException('Sanal bakiyeniz yetersiz.');
                }

                $createdOrders = [];

                foreach ($groups as $group) {
                    $subtotal = (float) ($group['subtotal'] ?? 0);
                    $shippingFee = $this->shippingService->calculateShippingFee($group, $payload);
                    $discountTotal = 0.00;
                    $totalAmount = $subtotal + $shippingFee - $discountTotal;

                    $orderId = Order::create([
                        'consumer_id' => $userId,
                        'producer_id' => (int) ($group['producer_id'] ?? 0),
                        'address_id' => $payload['address_id'] ?? null,
                        'order_type' => 'normal',
                        'subtotal' => $subtotal,
                        'shipping_fee' => $shippingFee,
                        'discount_total' => $discountTotal,
                        'total_amount' => $totalAmount,
                        'payment_method' => PAYMENT_METHOD_VIRTUAL_BALANCE,
                        'payment_status' => PAYMENT_STATUS_PAID,
                        'order_status' => ORDER_STATUS_PENDING,
                        'customer_note' => trim($payload['customer_note'] ?? '') ?: null,
                        'tracking_no' => generateTrackingNo(),
                    ]);

                    foreach (($group['items'] ?? []) as $item) {
                        $orderItemId = OrderItem::createFromCartItem($orderId, $item);

                        Product::decreaseStock(
                            (int) ($item['product_id'] ?? 0),
                            (float) ($item['quantity'] ?? 0)
                        );

                        $this->recordInventoryMovement(
                            (int) ($item['product_id'] ?? 0),
                            'sale',
                            -abs((float) ($item['quantity'] ?? 0)),
                            $orderItemId,
                            'Sipariş ile stok düşümü'
                        );
                    }

                    Shipment::create([
                        'order_id' => $orderId,
                        'cargo_company' => 'Demo Kargo',
                        'tracking_no' => generateTrackingNo(),
                        'shipment_status' => 'not_shipped',
                    ]);

                    $order = Order::findById($orderId);

                    if ($order) {
                        $createdOrders[] = $order;

                        $this->createNotificationSafe(
                            (int) ($group['producer_id'] ?? 0),
                            'new_order',
                            'Yeni sipariş aldınız',
                            ($order['order_no'] ?? 'Yeni sipariş') . ' numaralı yeni siparişiniz var.',
                            [
                                'order_id' => $orderId,
                                'order_no' => $order['order_no'] ?? null,
                            ]
                        );
                    }
                }

                $newBalance = $currentBalance - $cartTotal;

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

                WalletTransaction::createPurchase(
                    $userId,
                    $cartTotal,
                    $newBalance,
                    $createdOrders[0]['id'] ?? null
                );

                Cart::markCheckedOut((int) $cart['id']);

                $this->createNotificationSafe(
                    $userId,
                    'order_created',
                    'Siparişiniz oluşturuldu',
                    'Siparişiniz başarıyla oluşturuldu. Siparişlerinizi panelden takip edebilirsiniz.',
                    [
                        'order_count' => count($createdOrders),
                        'paid_amount' => $cartTotal,
                    ]
                );

                return [
                    'orders' => $createdOrders,
                    'paid_amount' => $cartTotal,
                    'balance_before' => $currentBalance,
                    'balance_after' => $newBalance,
                ];
            });

            return [
                'success' => true,
                'message' => 'Sipariş başarıyla oluşturuldu.',
                'data' => $result,
            ];
        } catch (Throwable $e) {
            return [
                'success' => false,
                'message' => $e->getMessage() ?: 'Checkout sırasında bir hata oluştu.',
            ];
        }
    }

    private function validateStock(array $items): array
    {
        if (empty($items)) {
            return [
                'success' => false,
                'message' => 'Sepetiniz boş.',
            ];
        }

        foreach ($items as $item) {
            $title = $item['title'] ?? 'Ürün';
            $quantity = (float) ($item['quantity'] ?? 0);
            $stock = (float) ($item['stock_quantity'] ?? 0);
            $status = $item['product_status'] ?? $item['status'] ?? '';

            if ($quantity <= 0) {
                return [
                    'success' => false,
                    'message' => $title . ' için miktar geçersiz.',
                ];
            }

            if ($status !== PRODUCT_STATUS_ACTIVE) {
                return [
                    'success' => false,
                    'message' => $title . ' şu anda aktif değil.',
                ];
            }

            if ($stock < $quantity) {
                return [
                    'success' => false,
                    'message' => $title . ' için yeterli stok yok.',
                ];
            }
        }

        return [
            'success' => true,
            'message' => 'Stok uygun.',
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

    private function recordInventoryMovement(
        int $productId,
        string $movementType,
        float $quantity,
        ?int $orderItemId = null,
        ?string $note = null
    ): void {
        try {
            $stmt = db()->prepare("
                INSERT INTO product_inventory_movements (
                    product_id,
                    movement_type,
                    quantity,
                    order_item_id,
                    note
                ) VALUES (
                    :product_id,
                    :movement_type,
                    :quantity,
                    :order_item_id,
                    :note
                )
            ");

            $stmt->execute([
                'product_id' => $productId,
                'movement_type' => $movementType,
                'quantity' => $quantity,
                'order_item_id' => $orderItemId,
                'note' => $note,
            ]);
        } catch (Throwable $e) {
            // Stok hareket tablosu yoksa checkout akışı bozulmasın.
        }
    }

    private function createNotificationSafe(
        int $userId,
        string $type,
        string $title,
        string $message,
        array $data = []
    ): void {
        try {
            Notification::create([
                'user_id' => $userId,
                'type' => $type,
                'title' => $title,
                'message' => $message,
                'data_json' => $data,
            ]);
        } catch (Throwable $e) {
            // Bildirim hatası sipariş oluşturma akışını bozmasın.
        }
    }
}