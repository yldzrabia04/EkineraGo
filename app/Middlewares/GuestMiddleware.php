<?php



if (!class_exists('GuestMiddleware')) {
    final class GuestMiddleware
    {
        public static function handle(): void
        {
            requireGuest();
        }
    }
}

