USE ekinerago;

CREATE TABLE IF NOT EXISTS provinces (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    plate_code INT UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS districts (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    province_id INT UNSIGNED NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT fk_districts_province
        FOREIGN KEY (province_id) REFERENCES provinces(id)
        ON DELETE CASCADE,
    UNIQUE KEY uq_district_province_name (province_id, name)
);

CREATE TABLE IF NOT EXISTS neighborhoods (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    district_id INT UNSIGNED NOT NULL,
    name VARCHAR(120) NOT NULL,
    CONSTRAINT fk_neighborhoods_district
        FOREIGN KEY (district_id) REFERENCES districts(id)
        ON DELETE CASCADE,
    UNIQUE KEY uq_neighborhood_district_name (district_id, name)
);
