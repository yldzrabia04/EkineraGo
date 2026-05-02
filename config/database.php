<?php

\System.Management.Automation.Internal.Host.InternalHost = 'localhost';
\ = 'ekinerago';
\ = 'root';
\ = '';

try {
    \ = new PDO(
        "mysql:host=\System.Management.Automation.Internal.Host.InternalHost;dbname=\;charset=utf8mb4",
        \,
        \,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
} catch (PDOException \) {
    die('VeritabanÄ± baÄŸlantÄ± hatasÄ±: ' . \->getMessage());
}
