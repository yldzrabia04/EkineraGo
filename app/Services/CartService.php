<?php

class CartService
{
    public function getActiveCart(int $userId): array
    {
        if ($userId <= 0) {
            return [
                'id' => null,
                'user_id' => null,
                'status' => 'active',
                'items' => [],
                'total' => 0.0,
                'producer_groups' => [],
            ];
        }

        $cart = Cart::getOrCreateActiveByUserId($userId);
        $items = CartItem::getItemsByCartId((int) $cart['id']);

        $cart['items'] = $items;
        $cart['total'] = $this->calculateTotal($items);
        $cart['producer_groups'] = $this->groupItemsByProducer($items);

        return $cart;
    }

    public function addItem(int $userId, int $productId, float $quantity): array
    {
        if ($userId <= 0) {
            return [
                'success' => false,
                'message' => 'Sepet işlemi için giriş yapmalısınız.',
            ];
        }

        if ($productId <= 0) {
            return [
                'success' => false,
                'message' => 'Geçerli bir ürün ID değeri gönderilmelidir.',
            ];
        }

        if ($quantity <= 0) {
            return [
                'success' => false,
                'message' => 'Miktar 0’dan büyük olmalıdır.',
            ];
        }

        $product = Product::findById($productId);

        if (!$product) {
            return [
                'success' => false,
                'message' => 'Ürün bulunamadı.',
            ];
        }

        if (($product['status'] ?? '') !== PRODUCT_STATUS_ACTIVE) {
            return [
                'success' => false,
                'message' => 'Bu ürün şu anda sepete eklenemez.',
            ];
        }

        if ((int) ($product['producer_id'] ?? 0) === $userId) {
            return [
                'success' => false,
                'message' => 'Kendi ürününüzü sepete ekleyemezsiniz.',
            ];
        }

        try {
            db_transaction(function () use ($userId, $productId, $quantity, $product) {
                $cart = Cart::getOrCreateActiveByUserId($userId);
                $existingItem = CartItem::findByCartAndProduct((int) $cart['id'], $productId);

                $existingQuantity = $existingItem ? (float) $existingItem['quantity'] : 0.0;
                $newQuantity = $existingQuantity + $quantity;

                $this->ensureStockAvailable($product, $newQuantity);

                if ($existingItem) {
                    CartItem::increaseQuantity((int) $existingItem['id'], $quantity);
                } else {
                    CartItem::create((int) $cart['id'], $productId, $quantity);
                }
            });

            $cart = $this->getActiveCart($userId);

            return [
                'success' => true,
                'message' => 'Ürün sepete eklendi.',
                'data' => [
                    'product_id' => $productId,
                    'quantity' => $quantity,
                    'cart' => $cart,
                    'cart_total' => $cart['total'],
                ],
            ];
        } catch (Throwable $e) {
            return [
                'success' => false,
                'message' => $e->getMessage() ?: 'Ürün sepete eklenemedi.',
            ];
        }
    }

    public function updateItem(int $userId, int $cartItemId, float $quantity): array
    {
        if ($userId <= 0) {
            return [
                'success' => false,
                'message' => 'Sepet işlemi için giriş yapmalısınız.',
            ];
        }

        if ($cartItemId <= 0) {
            return [
                'success' => false,
                'message' => 'Geçerli bir sepet ürünü ID değeri gönderilmelidir.',
            ];
        }

        if ($quantity <= 0) {
            return [
                'success' => false,
                'message' => 'Miktar 0’dan büyük olmalıdır.',
            ];
        }

        try {
            db_transaction(function () use ($userId, $cartItemId, $quantity) {
                $cart = Cart::getOrCreateActiveByUserId($userId);
                $cartItem = CartItem::findById($cartItemId);

                if (!$cartItem || (int) $cartItem['cart_id'] !== (int) $cart['id']) {
                    throw new RuntimeException('Sepet ürünü bulunamadı.');
                }

                $product = Product::findById((int) $cartItem['product_id']);

                if (!$product) {
                    throw new RuntimeException('Ürün bulunamadı.');
                }

                if (($product['status'] ?? '') !== PRODUCT_STATUS_ACTIVE) {
                    throw new RuntimeException('Bu ürün şu anda güncellenemez.');
                }

                $this->ensureStockAvailable($product, $quantity);

                CartItem::updateQuantity($cartItemId, $quantity);
            });

            $cart = $this->getActiveCart($userId);

            return [
                'success' => true,
                'message' => 'Sepet ürünü güncellendi.',
                'data' => [
                    'cart_item_id' => $cartItemId,
                    'quantity' => $quantity,
                    'cart' => $cart,
                    'cart_total' => $cart['total'],
                ],
            ];
        } catch (Throwable $e) {
            return [
                'success' => false,
                'message' => $e->getMessage() ?: 'Sepet ürünü güncellenemedi.',
            ];
        }
    }

    public function removeItem(int $userId, int $cartItemId): array
    {
        if ($userId <= 0) {
            return [
                'success' => false,
                'message' => 'Sepet işlemi için giriş yapmalısınız.',
            ];
        }

        if ($cartItemId <= 0) {
            return [
                'success' => false,
                'message' => 'Geçerli bir sepet ürünü ID değeri gönderilmelidir.',
            ];
        }

        try {
            db_transaction(function () use ($userId, $cartItemId) {
                $cart = Cart::getOrCreateActiveByUserId($userId);
                $cartItem = CartItem::findById($cartItemId);

                if (!$cartItem || (int) $cartItem['cart_id'] !== (int) $cart['id']) {
                    throw new RuntimeException('Sepet ürünü bulunamadı.');
                }

                CartItem::delete($cartItemId);
            });

            $cart = $this->getActiveCart($userId);

            return [
                'success' => true,
                'message' => 'Ürün sepetten silindi.',
                'data' => [
                    'cart_item_id' => $cartItemId,
                    'removed' => true,
                    'cart' => $cart,
                    'cart_total' => $cart['total'],
                ],
            ];
        } catch (Throwable $e) {
            return [
                'success' => false,
                'message' => $e->getMessage() ?: 'Ürün sepetten silinemedi.',
            ];
        }
    }

    public function clearCart(int $userId): array
    {
        if ($userId <= 0) {
            return [
                'success' => false,
                'message' => 'Sepet işlemi için giriş yapmalısınız.',
            ];
        }

        try {
            $cart = Cart::getOrCreateActiveByUserId($userId);
            CartItem::clearByCartId((int) $cart['id']);

            return [
                'success' => true,
                'message' => 'Sepet temizlendi.',
                'data' => [
                    'cart_id' => (int) $cart['id'],
                ],
            ];
        } catch (Throwable $e) {
            return [
                'success' => false,
                'message' => 'Sepet temizlenemedi.',
            ];
        }
    }

    public function calculateTotal(array $items): float
    {
        $total = 0.0;

        foreach ($items as $item) {
            $price = (float) ($item['price'] ?? 0);
            $quantity = (float) ($item['quantity'] ?? 0);

            $total += $price * $quantity;
        }

        return round($total, 2);
    }

    public function groupItemsByProducer(array $items): array
    {
        $groups = [];

        foreach ($items as $item) {
            $producerId = (int) ($item['producer_id'] ?? 0);

            if (!isset($groups[$producerId])) {
                $producerName = $item['store_name']
                    ?: ($item['producer_name'] ?? 'Üretici');

                $groups[$producerId] = [
                    'producer_id' => $producerId,
                    'producer_name' => $producerName,
                    'items' => [],
                    'subtotal' => 0.0,
                ];
            }

            $itemTotal = (float) ($item['price'] ?? 0) * (float) ($item['quantity'] ?? 0);

            $item['item_total'] = round($itemTotal, 2);

            $groups[$producerId]['items'][] = $item;
            $groups[$producerId]['subtotal'] += $itemTotal;
            $groups[$producerId]['subtotal'] = round($groups[$producerId]['subtotal'], 2);
        }

        return array_values($groups);
    }

    private function ensureStockAvailable(array $product, float $requestedQuantity): void
    {
        $stockQuantity = (float) ($product['stock_quantity'] ?? 0);
        $title = $product['title'] ?? 'Ürün';

        if ($requestedQuantity <= 0) {
            throw new RuntimeException('Miktar 0’dan büyük olmalıdır.');
        }

        if ($stockQuantity < $requestedQuantity) {
            throw new RuntimeException(
                $title . ' için yeterli stok yok. Mevcut stok: ' . $stockQuantity
            );
        }
    }
}