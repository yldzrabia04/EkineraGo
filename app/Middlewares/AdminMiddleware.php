<?php



if (!class_exists('AdminMiddleware')) {
    final class AdminMiddleware
    {
        public static function handle(): void
        {
            requireAdmin();
        }
    }
}