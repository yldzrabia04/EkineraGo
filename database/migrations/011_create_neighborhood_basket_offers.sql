USE ekinerago;

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS neighborhood_basket_offers (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    producer_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,

    title VARCHAR(180) NOT NULL,
    description TEXT NULL,

    min_quantity DECIMAL(10,2) NOT NULL DEFAULT 1.00,
    discount_percent DECIMAL(5,2) NOT NULL DEFAULT 0.00,

    unit_type ENUM('kg', 'piece', 'bunch', 'box') NOT NULL DEFAULT 'kg',

    starts_at DATETIME NULL,
    ends_at DATETIME NULL,

    status ENUM('active', 'passive', 'expired', 'deleted') NOT NULL DEFAULT 'active',

    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_nbo_producer
        FOREIGN KEY (producer_id) REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_nbo_product
        FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE CASCADE,

    INDEX idx_nbo_producer (producer_id),
    INDEX idx_nbo_product (product_id),
    INDEX idx_nbo_status (status),
    INDEX idx_nbo_dates (starts_at, ends_at)
);

CREATE TABLE IF NOT EXISTS neighborhood_basket_invitations (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    basket_id BIGINT UNSIGNED NOT NULL,
    invited_email VARCHAR(180) NOT NULL,
    invited_user_id BIGINT UNSIGNED NULL,
    invited_by_user_id BIGINT UNSIGNED NOT NULL,

    token VARCHAR(120) NOT NULL UNIQUE,

    status ENUM('pending', 'accepted', 'declined', 'expired') NOT NULL DEFAULT 'pending',

    accepted_at DATETIME NULL,
    expires_at DATETIME NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_nbi_basket
        FOREIGN KEY (basket_id) REFERENCES neighborhood_baskets(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_nbi_invited_user
        FOREIGN KEY (invited_user_id) REFERENCES users(id)
        ON DELETE SET NULL,

    CONSTRAINT fk_nbi_invited_by
        FOREIGN KEY (invited_by_user_id) REFERENCES users(id)
        ON DELETE CASCADE,

    INDEX idx_nbi_basket (basket_id),
    INDEX idx_nbi_email (invited_email),
    INDEX idx_nbi_status (status)
);

ALTER TABLE neighborhood_baskets
    ADD COLUMN offer_id BIGINT UNSIGNED NULL AFTER id,
    ADD COLUMN basket_type ENUM('group', 'individual') NOT NULL DEFAULT 'group' AFTER offer_id,
    ADD COLUMN visibility ENUM('private', 'public') NOT NULL DEFAULT 'private' AFTER basket_type,
    ADD COLUMN creator_note TEXT NULL AFTER title,
    ADD COLUMN producer_status ENUM('pending', 'approved', 'rejected') NOT NULL DEFAULT 'pending' AFTER status,
    ADD COLUMN discount_percent_snapshot DECIMAL(5,2) NOT NULL DEFAULT 0.00 AFTER producer_status,
    ADD COLUMN unit_price_snapshot DECIMAL(12,2) NOT NULL DEFAULT 0.00 AFTER discount_percent_snapshot,
    ADD COLUMN discounted_unit_price_snapshot DECIMAL(12,2) NOT NULL DEFAULT 0.00 AFTER unit_price_snapshot;

ALTER TABLE neighborhood_baskets
    ADD CONSTRAINT fk_nb_offer
        FOREIGN KEY (offer_id) REFERENCES neighborhood_basket_offers(id)
        ON DELETE SET NULL;