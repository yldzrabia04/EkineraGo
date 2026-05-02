<?php

require_once __DIR__ . '/../config/database.php';

require_once APP_PATH . '/Helpers/response.php';
require_once APP_PATH . '/Helpers/flash.php';
require_once APP_PATH . '/Helpers/csrf.php';
require_once APP_PATH . '/Helpers/auth.php';
require_once APP_PATH . '/Helpers/slug.php';
require_once APP_PATH . '/Helpers/money.php';
require_once APP_PATH . '/Helpers/order_number.php';
require_once APP_PATH . '/Helpers/validation.php';
require_once APP_PATH . '/Helpers/upload.php';

require_once APP_PATH . '/Middlewares/AuthMiddleware.php';
require_once APP_PATH . '/Middlewares/GuestMiddleware.php';
require_once APP_PATH . '/Middlewares/ConsumerMiddleware.php';
require_once APP_PATH . '/Middlewares/ProducerMiddleware.php';
require_once APP_PATH . '/Middlewares/AdminMiddleware.php';

require_once APP_PATH . '/Models/User.php';
require_once APP_PATH . '/Models/ConsumerProfile.php';
require_once APP_PATH . '/Models/ProducerProfile.php';
require_once APP_PATH . '/Models/Wallet.php';

require_once APP_PATH . '/Services/AuthService.php';

require_once APP_PATH . '/Controllers/AuthController.php';