'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "29fc7aa449fb7c66419531bbba6c2234",
"assets/AssetManifest.bin.json": "dfcc7cc149bb99aa780a55dfa9009fa3",
"assets/assets/audio/ay_ay_ay.mp3": "83bd8fc94f3c3cae38b0523b5d14c2ec",
"assets/assets/audio/bobby_sox.mp3": "3a5a0531636a0d54b95707202676e935",
"assets/assets/audio/cobarde.mp3": "611614622645297819eee99f1131a9ea",
"assets/assets/audio/freebola.mp3": "b5f6e0d4d2c48d9dc2a5a105d4e339d4",
"assets/assets/audio/helpless.mp3": "bf5b5cd8728bb5ae18333e97e1c27d86",
"assets/assets/audio/i_was_made_for_lovin_you.mp3": "898a036c2700174b72af05fe0d32248b",
"assets/assets/audio/lancer.mp3": "255b00e2b2bc43b6c145113aaa572c25",
"assets/assets/audio/lovesong.mp3": "464bc2e74bc798936111a69de231a90b",
"assets/assets/audio/robot_voices.mp3": "4eb09ee75e20fb3564cd7474b308899a",
"assets/assets/audio/sanctuary.mp3": "17fed1127cb89270bccbfa758d4e6aab",
"assets/assets/audio/tan_tuya.mp3": "d8e47131343b059e87eccd0d33d88b9d",
"assets/assets/audio/un_amor_violento.mp3": "bbbe14b5d00823be05bbc88844d83a10",
"assets/assets/audio/visita.mp3": "4ed0c8c6ae146e126d0ff1b7026361da",
"assets/assets/audio/voz_blip.wav": "23b2ea17f08b37a6a58ffad9448e499b",
"assets/assets/images/ay_ay_ay.png": "e10a8d75a51f751ae874bfb953c8e7bd",
"assets/assets/images/bobby_sox.jpg": "0289d5a8aca4fe03965248b3eaf1166e",
"assets/assets/images/daltonico.jpg": "fdb02d65c47aeeb6881cc915ca63eb6b",
"assets/assets/images/freebola.jpg": "792ce2330f74516e0900cadab232d564",
"assets/assets/images/hamilton.jpg": "7e9605401acc4c3519f773adc2209011",
"assets/assets/images/i_was_made.jpg": "08b110ed0b0515da2d2cde8040046534",
"assets/assets/images/los_tres.jpg": "aa2b1f967f06133623bb25c08b3af3e6",
"assets/assets/images/lovesong.jpg": "63ffafbeac23f0ce17934bed80fd5e09",
"assets/assets/images/robot_voices.png": "ee3ceb3e07e7984c57d86612c64f206c",
"assets/assets/images/sanctuary.jpg": "b4b3b0f2fe003b94438d2f62ba46ed61",
"assets/assets/images/sprite_cantando.jpeg": "b01a264aff928fa1f766dbec1584514c",
"assets/assets/images/sprite_enamorado.jpeg": "24c4b305e3d66dcede223406302d5d28",
"assets/assets/images/sprite_feliz.jpeg": "91f8a2ff7eec0bcd9259fb85fac11505",
"assets/assets/images/sprite_neutro.jpeg": "2bc7d3d7048770f6ab0bde8f9717d497",
"assets/assets/images/sprite_shy.jpeg": "e5e2be7691c583137140ed30a2c37d07",
"assets/assets/images/tan_tuya.jpg": "27b12140287b9720827e475b4c2f1259",
"assets/assets/images/tu_portada.jpg": "1fd9560502836edac84913fccf47eb1e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "6c2d24eddc91c209df41af30b09efdf9",
"assets/NOTICES": "d61886503683879591170bfdb2b7d147",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "67a34c6dd8fc70aee3693985abee3953",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "9cafc35869e2146ad892cd9d49cd0215",
"/": "9cafc35869e2146ad892cd9d49cd0215",
"main.dart.js": "e21492b881cc872edbe8e60b7fe7319b",
"manifest.json": "4c4e97a9e5561511fc478d2032c8f449",
"version.json": "23d80a0fa83f47bf66bb5e5de88aa95b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
