const CACHE = 'manti-by';
const FILES = [
    '/',
    '/api/posts',
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

self.addEventListener('install', (event) => {
    event.waitUntil(
        caches
            .open(CACHE)
            .then((cache) => cache.addAll(FILES))
            .then(() => self.skipWaiting())
    );
});

self.addEventListener('activate', (event) => {
    event.waitUntil(self.clients.claim());
});

self.addEventListener('fetch', function(event) {
    event.respondWith(networkOrCache(event.request)
        .catch(() => useFallback()));
});

function networkOrCache(request) {
    return fetch(request)
        .then((response) => response.ok ? response : fromCache(request))
        .catch(() => fromCache(request));
}

const FALLBACK =
    '<div>\n' +
    '    <div>Official blog of Alex Manti</div>\n' +
    '    <div>You are offline</div>\n' +
    '    <img src="/static/img/favicon/favicon-192.png" alt="Logo" />\n' +
    '</div>';

function useFallback() {
    return Promise.resolve(new Response(FALLBACK, { headers: {
        'Content-Type': 'text/html; charset=utf-8'
    }}));
}

function fromCache(request) {
    return caches.open(CACHE).then((cache) =>
        cache.match(request).then((matching) =>
            matching || Promise.reject('no-match')
        ));
}