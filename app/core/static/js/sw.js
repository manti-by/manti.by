const STATIC_CACHE = 'static-cache';
const DYNAMIC_CACHE = 'dynamic-cache';
const BASE_DOMAIN = 'https://manti.by';

let FILE_LIST = [
    '/static/svg/loader.svg',
    '/static/svg/instagram.svg',
    '/static/svg/twitter.svg',
    '/static/svg/coub.svg',
    '/static/img/black-bg-50.webp',
    '/static/img/black-bg-50.png',
    '/static/img/cut.webp',
    '/static/img/cut.jpg',
    '/static/img/cut-mobile.webp',
    '/static/img/cut-mobile.jpg',
    '/static/img/featured.webp',
    '/static/img/featured.jpg',
    '/static/img/no-image.webp',
    '/static/img/no-image.png',
    '/static/img/shape-player.png',
    '/static/img/share.webp',
    '/static/img/share.jpg',
    '/static/img/side.webp',
    '/static/img/side.jpg',
    '/static/img/side-mobile.webp',
    '/static/img/side-mobile.jpg',
    '/content/covers/february.webp',
    '/content/covers/february.jpg',
    '/content/covers/katana.webp',
    '/content/covers/katana.jpg',
    '/content/covers/litl.webp',
    '/content/covers/litl.jpg',
    '/content/covers/last-night.webp',
    '/content/covers/last-night.jpg',
    '/content/covers/phantom.webp',
    '/content/covers/phantom.jpg',
    '/content/covers/silence.webp',
    '/content/covers/silence.jpg',
    '/content/covers/shining.webp',
    '/content/covers/shining.jpg',
    '/content/covers/stockholm-syndrome.webp',
    '/content/covers/stockholm-syndrome.jpg',
];

for (let file of FILE_LIST) {
    file = BASE_DOMAIN + file;
}

self.addEventListener('install', (event) => {
    event.waitUntil(
        caches
            .open(STATIC_CACHE)
            .then((cache) => cache.addAll(FILE_LIST))
            .then(() => self.skipWaiting())
    );
});

self.addEventListener('activate', (event) => {
    let cacheWhitelist = [STATIC_CACHE];

    event.waitUntil(
        caches.keys().then(function (cacheNames) {
            return Promise.all(
                cacheNames.map(function (cacheName) {
                    if (cacheWhitelist.indexOf(cacheName) === -1) {
                        return caches.delete(cacheName);
                    }
                })
            );
        })
    );
});

self.addEventListener('fetch', function(event) {
    event.respondWith(
        caches.match(event.request)
            .then(function(response) {
                if (response) {
                    return response;
                }

                let fetchRequest = event.request.clone();
                return fetch(fetchRequest).then(
                    function(response) {
                        if (!response || response.status !== 200 || response.type !== 'basic') {
                            return response;
                        }

                        if (response.url.indexOf('dashboard') >= 0) {
                            return response;
                        }

                        let responseToCache = response.clone();
                        caches.open(DYNAMIC_CACHE)
                            .then(function(cache) {
                                cache.put(event.request, responseToCache);
                            });

                        return response;
                    }
                )
            }
        )
    );
});
