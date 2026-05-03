<?php

require_once __DIR__ . '/../app/bootstrap.php';

$pageTitle = 'Üretici Haritası';
$bodyClass = 'page-map';

require APP_PATH . '/Views/layouts/header.php';

?>

<link
    rel="stylesheet"
    href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
    crossorigin=""
>

<link rel="stylesheet" href="<?= e(asset('css/map.css')) ?>?v=5">

<main class="map-page">
    <section class="map-hero">
        <div class="map-hero-content">
            <span class="map-eyebrow">Yerel üretici keşfi</span>

            <h1>Türkiye haritasından üretici bul</h1>

            <p>
                Türkiye haritası üzerindeki illerden birini seçerek o bölgedeki üreticileri görüntüleyebilirsin.
                Bu ilk sürümde il seçimi hazırlanıyor; sonraki adımda seçilen ile göre üretici listesi veritabanından çekilecek.
            </p>
        </div>

        <div class="map-hero-stats">
            <div>
                <strong>81</strong>
                <span>İl</span>
            </div>

            <div>
                <strong>Harita</strong>
                <span>İl bazlı keşif</span>
            </div>
        </div>
    </section>

    <section class="map-layout">
        <div class="map-card">
            <div class="map-toolbar">
                <div>
                    <h2>Üretici Haritası</h2>
                    <p>Haritadaki illerden birine tıkla, seçilen il sağ panelde görüntülensin.</p>
                </div>

                <button class="map-reset-button" type="button" data-map-reset>
                    Türkiye görünümü
                </button>
            </div>

            <div
                id="turkeyMap"
                class="turkey-map"
                data-producer-api="<?= e(url('api/producers-by-province.php')) ?>"
                aria-label="Türkiye üretici haritası"
            ></div>
        </div>

        <aside class="map-side-panel">
            <div class="map-panel-block selected-city-block">
                <span class="panel-label">Seçilen il</span>

                <h2 data-selected-city-title>Henüz il seçilmedi</h2>

                <p data-selected-city-description>
                    Haritadaki illerden birine tıkla veya aşağıdaki il listesinden seçim yap.
                </p>
            </div>

            <div class="map-panel-block producer-preview-block">
                <div class="producer-preview-header">
                    <span class="panel-label">Üretici paneli</span>
                    <span class="producer-count-badge" data-producer-count>Hazır değil</span>
                </div>

                <div class="producer-empty-state" data-producer-list>
                    <div class="producer-empty-icon">🗺️</div>

                    <strong>İl seçimi hazır</strong>

                    <p>
                        Bir il seçildiğinde bu alan güncellenecek. Bir sonraki adımda buraya gerçek üretici kartlarını API ile bağlayacağız.
                    </p>
                </div>
            </div>

            <div class="map-panel-block city-list-block">
                <label for="citySearch">İl ara</label>

                <input
                    id="citySearch"
                    class="city-search-input"
                    type="search"
                    placeholder="Örn. Hatay, İzmir, Ankara"
                    autocomplete="off"
                    data-city-search
                >

                <div class="city-list" data-city-list></div>
            </div>
        </aside>
    </section>
</main>

<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" crossorigin=""></script>
<script src="<?= e(asset('js/map.js')) ?>?v=5"></script>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>