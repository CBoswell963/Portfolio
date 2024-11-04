const CACHE_NAME = 'pokemon-encounter-cache-v1';
const DATA_CACHE_NAME = 'pokemon-data-cache-v1';
const FILES_TO_CACHE = [
    '/',
    '/index.html',
    '/encounter.html',
    '/encounterResult.html',
    '/caught.html',
    '/pokemonDetail.html',
    '/style.css',
    '/script.js',
    '/images/icons/PokemonEncounter192.png',
    '/images/icons/PokemonEncounter512.png',
    '/manifest.json'
];

self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME).then((cache) => {
            console.log('Files cached successfully');
            return cache.addAll(FILES_TO_CACHE);
        })
    );
    self.skipWaiting();
});

self.addEventListener('activate', (event) => {
    event.waitUntil(
        caches.keys().then((cacheNames) => {
            return Promise.all(
                cacheNames.map((cache) => {
                    if (cache !== CACHE_NAME && cache !== DATA_CACHE_NAME) {
                        console.log('Removing old cache', cache);
                        return caches.delete(cache);
                    }
                })
            );
        })
    );
    self.clients.claim();
});

self.addEventListener('fetch', (event) => {
    const { url } = event.request;

    if (url.includes('pokeapi.co')) {
        event.respondWith(
            caches.open(DATA_CACHE_NAME).then((cache) => {
                return fetch(event.request)
                    .then((response) => {
                        cache.put(event.request, response.clone());
                        return response;
                    })
                    .catch(() => {
                        return cache.match(event.request);
                    });
            })
        );
    } else {
        event.respondWith(
            caches.match(event.request).then((response) => {
                return response || fetch(event.request);
            })
        );
    }
});
