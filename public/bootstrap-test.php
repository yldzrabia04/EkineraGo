<?php
header('Content-Type: text/plain; charset=utf-8');

echo "BEFORE BOOTSTRAP\n";

require_once __DIR__ . '/../app/bootstrap.php';

echo "AFTER BOOTSTRAP\n";
echo "SESSION:\n";
print_r($_SESSION);

echo "\nCURRENT USER:\n";
var_dump(function_exists('currentUser') ? currentUser() : 'currentUser yok');

exit;