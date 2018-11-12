const CACHE = 'cache';

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
