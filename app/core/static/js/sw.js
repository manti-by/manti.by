const CACHE = 'cache';

self.addEventListener('activate', (event) => {
    let cacheWhitelist = [CACHE];

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

                let fetchRequest = event.request.clone(),
                    request_url = new URL(event.request.url),
                    is_success, is_internal, is_dashboard;

                return fetch(fetchRequest).then(
                    function(response) {
                        is_success = !response || response.status !== 200 || response.type !== 'basic';
                        is_internal = request_url.host.indexOf('manti.by') < 0;
                        is_dashboard = response.url.indexOf('dashboard') >= 0;

                        if (is_success || is_internal || is_dashboard) {
                            return response;
                        }

                        let responseToCache = response.clone();
                        caches.open(CACHE)
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
