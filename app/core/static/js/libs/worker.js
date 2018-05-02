const CACHE = 'manti-by';
const FILES = [
    '/',
    '/api/posts',
    '/static/svg/instagram.svg',
    '/static/svg/twitter.svg',
    '/static/svg/coub.svg',
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