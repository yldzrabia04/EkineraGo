CREATE DATABASE IF NOT EXISTS ekinerago
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE ekinerago;

CREATE TABLE IF NOT EXISTS product_questions (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    product_id BIGINT UNSIGNED NOT NULL,
    consumer_id BIGINT UNSIGNED NOT NULL,
    producer_id BIGINT UNSIGNED NOT NULL,

    question TEXT NOT NULL,
    answer TEXT NULL,

    status ENUM('pending', 'answered', 'hidden', 'deleted') NOT NULL DEFAULT 'pending',

    answered_at DATETIME NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_product_questions_product
        FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_product_questions_consumer
        FOREIGN KEY (consumer_id) REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_product_questions_producer
        FOREIGN KEY (producer_id) REFERENCES users(id)
        ON DELETE CASCADE,

    INDEX idx_product_questions_product_status (product_id, status),
    INDEX idx_product_questions_consumer (consumer_id),
    INDEX idx_product_questions_producer_status (producer_id, status),
    INDEX idx_product_questions_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
