self.addEventListener("install", event => {
  event.waitUntil(
    caches.open("finance-cache").then(cache =>
      cache.addAll([
        "/",
        "/expenses",
        "/investments",
        "/payments",
        "/reports"
      ])
    )
  );
});

self.addEventListener("fetch", event => {
  event.respondWith(
    caches.match(event.request).then(response =>
      response || fetch(event.request)
    )
  );
});
