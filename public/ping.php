<?php
header('Content-Type: text/plain; charset=utf-8');

echo "PING OK\n";
echo "__FILE__: " . __FILE__ . "\n";
echo "SCRIPT_NAME: " . ($_SERVER['SCRIPT_NAME'] ?? '') . "\n";
echo "REQUEST_URI: " . ($_SERVER['REQUEST_URI'] ?? '') . "\n";
exit;