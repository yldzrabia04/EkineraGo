<?php

require_once __DIR__ . '/../config/database.php';

function require_app_file(string $path): void
{
    $fullPath = APP_PATH . '/' . ltrim($path, '/');

    if (file_exists($fullPath)) {
        require_once $fullPath;
    }
}

/*
|--------------------------------------------------------------------------
| Helpers
|--------------------------------------------------------------------------
*/

require_app_file('Helpers/response.php');
require_app_file('Helpers/flash.php');
require_app_file('Helpers/csrf.php');
require_app_file('Helpers/auth.php');
require_app_file('Helpers/slug.php');
require_app_file('Helpers/money.php');
require_app_file('Helpers/order_number.php');
require_app_file('Helpers/validation.php');
require_app_file('Helpers/upload.php');

/*
|--------------------------------------------------------------------------
| Middlewares
|--------------------------------------------------------------------------
*/

require_app_file('Middlewares/AuthMiddleware.php');
require_app_file('Middlewares/GuestMiddleware.php');
require_app_file('Middlewares/ConsumerMiddleware.php');
require_app_file('Middlewares/ProducerMiddleware.php');
require_app_file('Middlewares/AdminMiddleware.php');

/*
|--------------------------------------------------------------------------
| Models
|--------------------------------------------------------------------------
*/

require_app_file('Models/User.php');
require_app_file('Models/ConsumerProfile.php');
require_app_file('Models/ProducerProfile.php');
require_app_file('Models/Wallet.php');

require_app_file('Models/Category.php');
require_app_file('Models/Product.php');
require_app_file('Models/ProductImage.php');

require_app_file('Models/Cart.php');
require_app_file('Models/CartItem.php');
require_app_file('Models/WalletTransaction.php');

require_app_file('Models/Order.php');
require_app_file('Models/OrderItem.php');
require_app_file('Models/Shipment.php');

require_app_file('Models/Review.php');
require_app_file('Models/Favorite.php');
require_app_file('Models/Notification.php');

/*
|--------------------------------------------------------------------------
| Yeni Soru-Cevap Modeli
|--------------------------------------------------------------------------
*/

require_app_file('Models/ProductQuestion.php');

/*
|--------------------------------------------------------------------------
| Services
|--------------------------------------------------------------------------
*/

require_app_file('Services/AuthService.php');
require_app_file('Services/ProductService.php');
require_app_file('Services/CartService.php');
require_app_file('Services/WalletService.php');
require_app_file('Services/CheckoutService.php');
require_app_file('Services/OrderService.php');
require_app_file('Services/ShippingService.php');

require_app_file('Services/ReviewService.php');
require_app_file('Services/NotificationService.php');

/*
|--------------------------------------------------------------------------
| Yeni Soru-Cevap Service
|--------------------------------------------------------------------------
*/

require_app_file('Services/ProductQuestionService.php');

/*
|--------------------------------------------------------------------------
| Controllers
|--------------------------------------------------------------------------
*/

require_app_file('Controllers/AuthController.php');
require_app_file('Controllers/ProductController.php');
require_app_file('Controllers/ProducerController.php');
require_app_file('Controllers/CartController.php');
require_app_file('Controllers/WalletController.php');
require_app_file('Controllers/CheckoutController.php');
require_app_file('Controllers/OrderController.php');

require_app_file('Controllers/ReviewController.php');
require_app_file('Controllers/FavoriteController.php');
require_app_file('Controllers/NotificationController.php');

/*
|--------------------------------------------------------------------------
| Yeni Soru-Cevap Controller
|--------------------------------------------------------------------------
| Şu an API dosyaları direkt ProductQuestionService kullanıyor.
| İleride ProductQuestionController.php oluşturursak otomatik yüklensin diye bıraktık.
|--------------------------------------------------------------------------
*/

require_app_file('Controllers/ProductQuestionController.php');