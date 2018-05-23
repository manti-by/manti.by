const CACHE_NAME = 'manti-by';
const BASE_DOMAIN = 'https://demo.manti.by';

let FILE_LIST = [
    '/static/svg/loader.svg',
    '/static/svg/instagram.svg',
    '/static/svg/twitter.svg',
    '/static/svg/coub.svg',
    '/static/img/black-bg-50.webp',
    '/static/img/cut.webp',
    '/static/img/cut-mobile.webp',
    '/static/img/featured.webp',
    '/static/img/no-image.webp',
    '/static/img/shape-player.webp',
    '/static/img/share.webp',
    '/static/img/side.webp',
    '/static/img/side-mobile.webp',
    '/static/img/logo/48.webp',
    '/static/img/logo/72.webp',
    '/static/img/logo/96.webp',
    '/static/img/logo/144.webp',
    '/static/img/logo/192.webp',
    '/static/img/logo/256.webp',
    '/static/img/logo/512.webp',
    '/content/covers/february.webp',
    '/content/covers/katana.webp',
    '/content/covers/litl.webp',
    '/content/covers/phantom.webp',
    '/content/covers/silence.webp',
    '/content/covers/shining.webp',
    '/content/covers/stockholm-syndrome.webp',
    '/content/preview/M43_Manti_Shining.mp3',
];

for (let file of FILE_LIST) {
    file = BASE_DOMAIN + file;
}

self.addEventListener('install', (event) => {
    event.waitUntil(
        caches
            .open(CACHE_NAME)
            .then((cache) => cache.addAll(FILE_LIST))
            .then(() => self.skipWaiting())
    );
});

self.addEventListener('activate', (event) => {
    let cacheWhitelist = [CACHE_NAME];

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

                        let responseToCache = response.clone();
                        caches.open(CACHE_NAME)
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