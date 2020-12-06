const CACHE = 'cache'

self.addEventListener('activate', (event) => {
  const cacheWhitelist = [CACHE]

  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            return caches.delete(cacheName)
          }
        })
      )
    })
  )
})

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches
      .open(CACHE)
      .then((cache) => cache.addAll(['/static']))
  )
})

self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      if (response) {
        return response
      }

      const fetchRequest = event.request.clone()
      const requestUrl = new URL(event.request.url)
      let isSuccess, isExternal, isDashboard

      return fetch(fetchRequest).then((response) => {
        isSuccess = !response || response.status !== 200 || response.type !== 'basic'
        isExternal = requestUrl.host.indexOf('manti.by') < 0
        isDashboard = response.url.indexOf('dashboard') >= 0

        if (isSuccess || isExternal || isDashboard) {
          return response
        }

        const responseToCache = response.clone()
        caches.open(CACHE)
          .then((cache) => {
            cache.put(event.request, responseToCache)
          })

        return response
      })
    })
  )
})
