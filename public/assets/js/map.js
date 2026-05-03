document.addEventListener('DOMContentLoaded', function () {
    'use strict';

    const mapElement = document.getElementById('turkeyMap');

    if (!mapElement || typeof L === 'undefined') {
        return;
    }

    const selectedTitle = document.querySelector('[data-selected-city-title]');
    const selectedDescription = document.querySelector('[data-selected-city-description]');
    const producerCount = document.querySelector('[data-producer-count]');
    const producerList = document.querySelector('[data-producer-list]');
    const cityList = document.querySelector('[data-city-list]');
    const citySearch = document.querySelector('[data-city-search]');
    const resetButton = document.querySelector('[data-map-reset]');

    const geoJsonUrls = [
        'assets/tr-cities-utf8.json',
        'https://cdn.jsdelivr.net/gh/cihadturhan/tr-geojson@master/geo/tr-cities-utf8.json',
        'https://raw.githubusercontent.com/cihadturhan/tr-geojson/master/geo/tr-cities-utf8.json'
    ];

    const plateByCityName = {
        adana: 1,
        adiyaman: 2,
        afyon: 3,
        afyonkarahisar: 3,
        agri: 4,
        amasya: 5,
        ankara: 6,
        antalya: 7,
        artvin: 8,
        aydin: 9,
        balikesir: 10,
        bilecik: 11,
        bingol: 12,
        bitlis: 13,
        bolu: 14,
        burdur: 15,
        bursa: 16,
        canakkale: 17,
        cankiri: 18,
        corum: 19,
        denizli: 20,
        diyarbakir: 21,
        edirne: 22,
        elazig: 23,
        erzincan: 24,
        erzurum: 25,
        eskisehir: 26,
        gaziantep: 27,
        giresun: 28,
        gumushane: 29,
        hakkari: 30,
        hatay: 31,
        isparta: 32,
        mersin: 33,
        icel: 33,
        istanbul: 34,
        izmir: 35,
        kars: 36,
        kastamonu: 37,
        kayseri: 38,
        kirklareli: 39,
        kirsehir: 40,
        kocaeli: 41,
        izmit: 41,
        konya: 42,
        kutahya: 43,
        malatya: 44,
        manisa: 45,
        kahramanmaras: 46,
        maras: 46,
        mardin: 47,
        mugla: 48,
        mus: 49,
        nevsehir: 50,
        nigde: 51,
        ordu: 52,
        rize: 53,
        sakarya: 54,
        adapazari: 54,
        samsun: 55,
        siirt: 56,
        sinop: 57,
        sivas: 58,
        tekirdag: 59,
        tokat: 60,
        trabzon: 61,
        tunceli: 62,
        sanliurfa: 63,
        urfa: 63,
        usak: 64,
        van: 65,
        yozgat: 66,
        zonguldak: 67,
        aksaray: 68,
        bayburt: 69,
        karaman: 70,
        kirikkale: 71,
        batman: 72,
        sirnak: 73,
        bartin: 74,
        ardahan: 75,
        igdir: 76,
        yalova: 77,
        karabuk: 78,
        kilis: 79,
        osmaniye: 80,
        duzce: 81
    };

    const defaultStyle = {
        color: '#243224',
        weight: 1.15,
        opacity: 0.95,
        fillColor: '#fbfdf9',
        fillOpacity: 1
    };

    const hoverStyle = {
        color: '#0f6b2f',
        weight: 2.9,
        opacity: 1,
        fillColor: '#7fce89',
        fillOpacity: 0.94
    };

    const selectedStyle = {
        color: '#0b4f22',
        weight: 3.2,
        opacity: 1,
        fillColor: '#2f7d3d',
        fillOpacity: 0.96
    };

    let selectedLayer = null;
    let selectedCityName = null;
    let cityLayer = null;
    let turkeyBounds = null;

    const layerByCityName = new Map();
    const cityButtons = new Map();

    const loadingEl = document.createElement('div');
    loadingEl.className = 'map-loading';
    loadingEl.textContent = 'Türkiye haritası yükleniyor...';
    mapElement.appendChild(loadingEl);

    const map = L.map('turkeyMap', {
        center: [39.0, 35.2],
        zoom: 6,
        minZoom: 5,
        maxZoom: 8,
        zoomSnap: 0.25,
        zoomDelta: 0.5,
        zoomControl: false,
        attributionControl: false,
        dragging: false,
        touchZoom: false,
        scrollWheelZoom: false,
        doubleClickZoom: false,
        boxZoom: false,
        keyboard: false,
        worldCopyJump: false,
        maxBoundsViscosity: 1.0
    });

    const hardTurkeyBounds = L.latLngBounds(
        L.latLng(34.2, 24.0),
        L.latLng(43.7, 46.5)
    );

    map.setMaxBounds(hardTurkeyBounds);

    function normalizeText(value) {
        return String(value || '')
            .trim()
            .toLocaleLowerCase('tr-TR')
            .replaceAll('ı', 'i')
            .replaceAll('ğ', 'g')
            .replaceAll('ü', 'u')
            .replaceAll('ş', 's')
            .replaceAll('ö', 'o')
            .replaceAll('ç', 'c')
            .replaceAll('â', 'a')
            .replaceAll('î', 'i')
            .replaceAll('û', 'u');
    }

    function getCityName(feature) {
        const p = feature.properties || {};

        return p.name
            || p.NAME_1
            || p.NAME
            || p.Name
            || p.city
            || p.City
            || p.il
            || p.IL
            || p.IL_ADI
            || p.province
            || p.Province
            || p.Subregion
            || 'İl adı bulunamadı';
    }

    function getPlate(cityName) {
        return plateByCityName[normalizeText(cityName)] || '';
    }

    function applyStyle(layer, style) {
        if (!layer || typeof layer.setStyle !== 'function') {
            return;
        }

        layer.setStyle(style);

        if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
            layer.bringToFront();
        }
    }

    function clearButtonStates() {
        cityButtons.forEach(function (button) {
            button.classList.remove('is-active');
        });
    }

    function updateSelectedPanel(cityName) {
        const plate = getPlate(cityName);

        if (selectedTitle) {
            selectedTitle.textContent = cityName;
        }

        if (selectedDescription) {
            selectedDescription.textContent = plate
                ? `${plate} plakalı il seçildi.`
                : `${cityName} seçildi.`;
        }

        if (producerCount) {
            producerCount.textContent = 'API bekliyor';
        }

        if (producerList) {
            producerList.innerHTML = `
                <div class="producer-empty-icon">🌱</div>
                <strong>${cityName} seçildi</strong>
                <p>
                    ${plate ? plate + ' plakalı' : 'Seçilen'} il için üretici listesi sonraki adımda veritabanından çekilecek.
                </p>
            `;
        }
    }

    function selectCity(layer, cityName) {
        if (!layer) {
            return;
        }

        if (selectedLayer && selectedLayer !== layer) {
            selectedLayer._isSelectedCity = false;
            applyStyle(selectedLayer, defaultStyle);
        }

        selectedLayer = layer;
        selectedLayer._isSelectedCity = true;
        selectedCityName = cityName;

        applyStyle(selectedLayer, selectedStyle);

        clearButtonStates();

        const selectedButton = cityButtons.get(normalizeText(cityName));

        if (selectedButton) {
            selectedButton.classList.add('is-active');
            selectedButton.scrollIntoView({
                block: 'nearest',
                behavior: 'smooth'
            });
        }

        updateSelectedPanel(cityName);
    }

    function resetMap() {
        if (selectedLayer) {
            selectedLayer._isSelectedCity = false;
            applyStyle(selectedLayer, defaultStyle);
        }

        selectedLayer = null;
        selectedCityName = null;

        clearButtonStates();

        if (selectedTitle) {
            selectedTitle.textContent = 'Henüz il seçilmedi';
        }

        if (selectedDescription) {
            selectedDescription.textContent = 'Haritadaki illerden birine tıkla veya aşağıdaki il listesinden seçim yap.';
        }

        if (producerCount) {
            producerCount.textContent = 'Hazır değil';
        }

        if (producerList) {
            producerList.innerHTML = `
                <div class="producer-empty-icon">🗺️</div>
                <strong>İl seçimi hazır</strong>
                <p>
                    Bir il seçildiğinde bu alan güncellenecek. Bir sonraki adımda buraya gerçek üretici kartlarını API ile bağlayacağız.
                </p>
            `;
        }

        if (citySearch) {
            citySearch.value = '';
        }

        renderCityButtons(getAllCityNames());
        fitTurkey();
    }

    function onEachCity(feature, layer) {
        const cityName = getCityName(feature);
        const normalizedName = normalizeText(cityName);
        const plate = getPlate(cityName);

        layer._cityName = cityName;
        layer._isSelectedCity = false;

        layerByCityName.set(normalizedName, layer);

        layer.bindTooltip(plate ? `${plate} - ${cityName}` : cityName, {
            sticky: true,
            direction: 'top',
            className: 'province-tooltip'
        });

        layer.on('mouseover', function (event) {
            const target = event.target;

            if (target._isSelectedCity) {
                applyStyle(target, selectedStyle);
            } else {
                applyStyle(target, hoverStyle);
            }
        });

        layer.on('mouseout', function (event) {
            const target = event.target;

            if (target._isSelectedCity) {
                applyStyle(target, selectedStyle);
            } else {
                applyStyle(target, defaultStyle);
            }
        });

        layer.on('click', function (event) {
            L.DomEvent.stopPropagation(event);
            selectCity(event.target, cityName);
        });
    }

    function getAllCityNames() {
        return Array.from(layerByCityName.keys())
            .map(function (normalizedName) {
                const layer = layerByCityName.get(normalizedName);

                return layer ? layer._cityName : normalizedName;
            })
            .sort(function (a, b) {
                const plateA = getPlate(a) || 999;
                const plateB = getPlate(b) || 999;

                if (plateA !== plateB) {
                    return plateA - plateB;
                }

                return a.localeCompare(b, 'tr');
            });
    }

    function renderCityButtons(cityNames) {
        if (!cityList) {
            return;
        }

        cityList.innerHTML = '';
        cityButtons.clear();

        cityNames.forEach(function (cityName) {
            const plate = getPlate(cityName);
            const normalizedName = normalizeText(cityName);

            const button = document.createElement('button');

            button.type = 'button';
            button.className = 'city-button';
            button.textContent = plate ? `${plate} - ${cityName}` : cityName;

            if (selectedCityName && normalizeText(selectedCityName) === normalizedName) {
                button.classList.add('is-active');
            }

            button.addEventListener('click', function () {
                const layer = layerByCityName.get(normalizedName);

                if (layer) {
                    selectCity(layer, cityName);
                }
            });

            cityButtons.set(normalizedName, button);
            cityList.appendChild(button);
        });
    }

    function filterCities() {
        const query = normalizeText(citySearch ? citySearch.value : '');

        const filteredCities = getAllCityNames().filter(function (cityName) {
            const plate = String(getPlate(cityName));

            return normalizeText(cityName).includes(query) || plate.includes(query);
        });

        renderCityButtons(filteredCities);
    }

    function fitTurkey() {
        if (!turkeyBounds) {
            return;
        }

        map.invalidateSize();

        map.fitBounds(turkeyBounds, {
            padding: [30, 30],
            animate: false
        });

        setTimeout(function () {
            map.invalidateSize();
        }, 80);
    }

    async function fetchGeoJson() {
        let lastError = null;

        for (const url of geoJsonUrls) {
            try {
                const response = await fetch(url, {
                    cache: 'no-cache'
                });

                if (!response.ok) {
                    throw new Error(url + ' HTTP ' + response.status);
                }

                const data = await response.json();

                if (!data || !data.features || !data.features.length) {
                    throw new Error(url + ' geçerli GeoJSON değil.');
                }

                return data;
            } catch (error) {
                lastError = error;
                console.warn('GeoJSON alınamadı:', error);
            }
        }

        throw lastError || new Error('GeoJSON dosyası alınamadı.');
    }

    fetchGeoJson()
        .then(function (geoJsonData) {
            cityLayer = L.geoJSON(geoJsonData, {
                style: defaultStyle,
                interactive: true,
                bubblingMouseEvents: false,
                onEachFeature: onEachCity
            }).addTo(map);

            turkeyBounds = cityLayer.getBounds();

            fitTurkey();
            renderCityButtons(getAllCityNames());

            setTimeout(function () {
                map.invalidateSize();

                if (turkeyBounds) {
                    map.setMaxBounds(turkeyBounds.pad(0.08));
                }
            }, 200);

            if (loadingEl && loadingEl.parentNode) {
                loadingEl.remove();
            }
        })
        .catch(function (error) {
            console.error(error);

            if (loadingEl) {
                loadingEl.innerHTML = `
                    <span class="map-error">
                        Harita yüklenemedi.<br>
                        tr-cities-utf8.json dosyasını public/assets içine koyabilir veya internet bağlantısını kontrol edebilirsin.<br>
                        Hata: ${error.message}
                    </span>
                `;
            }
        });

    map.on('zoomend moveend', function () {
        if (selectedLayer) {
            applyStyle(selectedLayer, selectedStyle);
        }
    });

    if (citySearch) {
        citySearch.addEventListener('input', filterCities);
    }

    if (resetButton) {
        resetButton.addEventListener('click', function (event) {
            event.preventDefault();
            resetMap();
        });
    }

    window.addEventListener('resize', function () {
        setTimeout(fitTurkey, 120);
    });
});