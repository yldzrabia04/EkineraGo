<?php

class ProductController
{
    private ProductService $productService;

    public function __construct()
    {
        $this->productService = new ProductService();
    }

    public function publicIndexData(array $filters = []): array
    {
        return [
            'products' => $this->productService->searchProducts($filters),
            'categories' => $this->productService->getCategories(),
            'filters' => $filters,
        ];
    }

    public function publicDetailData(int $productId): array
    {
        $product = $this->productService->getProductDetail($productId);

        return [
            'product' => $product,
            'product_id' => $productId,
        ];
    }

    public function producerIndexData(int $producerId): array
    {
        ProducerMiddleware::handle();

        return [
            'products' => $this->productService->getProducerProducts($producerId),
            'categories' => $this->productService->getCategories(),
        ];
    }

    public function createData(): array
    {
        ProducerMiddleware::handle();

        return [
            'categories' => $this->productService->getCategories(),
        ];
    }

    public function editData(int $productId, int $producerId): array
    {
        ProducerMiddleware::handle();

        $product = Product::findById($productId);

        if (!$product || (int) $product['producer_id'] !== $producerId) {
            flash_error('Bu ürünü düzenleme yetkiniz yok.');
            redirect('producer/products.php');
        }

        return [
            'product' => $product,
            'images' => ProductImage::getByProductId($productId),
            'categories' => $this->productService->getCategories(),
        ];
    }

    public function store(): void
    {
        ProducerMiddleware::handle();

        if (!is_post()) {
            redirect('producer/product-create.php');
        }

        require_csrf();

        $producerId = currentUserId();

        if (!$producerId) {
            flash_error('Ürün eklemek için giriş yapmalısınız.');
            redirect('login.php');
        }

        $result = $this->productService->createProduct($producerId, $_POST, $_FILES);

        if (!$result['success']) {
            set_old($this->safeOldInput($_POST));
            set_errors($result['errors'] ?? []);

            flash_error('Ürün oluşturulamadı.');
            redirect('producer/product-create.php');
        }

        flash_success($result['message'] ?? 'Ürün başarıyla oluşturuldu.');
        redirect('producer/products.php');
    }

    public function update(): void
    {
        ProducerMiddleware::handle();

        if (!is_post()) {
            redirect('producer/products.php');
        }

        require_csrf();

        $producerId = currentUserId();
        $productId = (int) ($_POST['product_id'] ?? 0);

        if (!$producerId) {
            flash_error('Ürün düzenlemek için giriş yapmalısınız.');
            redirect('login.php');
        }

        if ($productId <= 0) {
            flash_error('Geçerli bir ürün bulunamadı.');
            redirect('producer/products.php');
        }

        $result = $this->productService->updateProduct($producerId, $productId, $_POST, $_FILES);

        if (!$result['success']) {
            set_old($this->safeOldInput($_POST));
            set_errors($result['errors'] ?? []);

            flash_error('Ürün güncellenemedi.');
            redirect('producer/product-edit.php?id=' . $productId);
        }

        flash_success($result['message'] ?? 'Ürün başarıyla güncellendi.');
        redirect('producer/products.php');
    }

    public function delete(): void
    {
        ProducerMiddleware::handle();

        if (!is_post()) {
            redirect('producer/products.php');
        }

        require_csrf();

        $producerId = currentUserId();
        $productId = (int) ($_POST['product_id'] ?? 0);

        if (!$producerId || $productId <= 0) {
            flash_error('Silinecek ürün bulunamadı.');
            redirect('producer/products.php');
        }

        $result = $this->productService->deleteProduct($producerId, $productId);

        if (!$result['success']) {
            flash_error($result['message'] ?? 'Ürün silinemedi.');
            redirect('producer/products.php');
        }

        flash_success($result['message'] ?? 'Ürün silindi.');
        redirect('producer/products.php');
    }

    public function changeStatus(): void
    {
        ProducerMiddleware::handle();

        if (!is_post()) {
            redirect('producer/products.php');
        }

        require_csrf();

        $producerId = currentUserId();
        $productId = (int) ($_POST['product_id'] ?? 0);
        $status = trim($_POST['status'] ?? '');

        if (!$producerId || $productId <= 0 || $status === '') {
            flash_error('Ürün durumu güncellenemedi.');
            redirect('producer/products.php');
        }

        $result = $this->productService->changeStatus($producerId, $productId, $status);

        if (!$result['success']) {
            flash_error($result['message'] ?? 'Ürün durumu güncellenemedi.');
            redirect('producer/products.php');
        }

        flash_success($result['message'] ?? 'Ürün durumu güncellendi.');
        redirect('producer/products.php');
    }

    private function safeOldInput(array $input): array
    {
        unset($input['_csrf_token']);

        return $input;
    }
}