'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "4aa78f0c7b0a33a604db17d5f6893baa",
"index.html": "5bf73595b64cdfa4e03164a3522f4fbf",
"/": "5bf73595b64cdfa4e03164a3522f4fbf",
"main.dart.js": "d5eba92a002d3cc3965dc9075065735b",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "a62c3801257405ea384a3af5f2cbbdf6",
"icons/Icon-192.png": "a62c3801257405ea384a3af5f2cbbdf6",
"icons/Icon-512.png": "a62c3801257405ea384a3af5f2cbbdf6",
"manifest.json": "b8d1f180185c438d473dc57b6b861dc1",
"assets/images/pic114.png": "17beab7c354f1e71ff2801109b8f0edb",
"assets/images/pic101.png": "e2bed538041a197d6c44537b30d1a26d",
"assets/images/pic115.png": "550c98a93dd1c3125e4614ee3151e3ea",
"assets/images/pic103.png": "a0d5184f8ba106025f0e3a2a168db839",
"assets/images/pic117.png": "7e928df851c015cc5f450da2f48411ec",
"assets/images/pic506.png": "3c62dca1da5ea47cee95324888147879",
"assets/images/pic106.png": "c2b2c7bd15ba676b42b146cf0257a8e9",
"assets/images/photo1.jpeg": "00006d7e315258063e228f4b268909da",
"assets/images/pic105.png": "96385896ceff1f85b15ed6984a1be730",
"assets/images/pic501.png": "4b16cfe4e55171a08a01126ba4495ef2",
"assets/images/pic104.png": "fed0d69678a987180c5f88908bc0d978",
"assets/images/pic109.jfif": "0631080de0efd9d3fc49852662e783cc",
"assets/images/pic9.jpg": "3afc29061b7096887276615bde19a7b0",
"assets/images/pic9.png": "2316b97404b40b369744f424a13ab6e2",
"assets/images/pic8.png": "fd8877969949df68c5f10f5cb93c8b5f",
"assets/images/pic8.jpg": "29041bd87a06ac88a870978d0ff531ae",
"assets/images/pic12.png": "095374f506d46e157e66e8fee43cc0b2",
"assets/images/pic10.png": "a5a410ac46e588d1c49d97e9243c339b",
"assets/images/systems_logo.png": "c26742a650cb6bafe0383dd2ddfcdcfb",
"assets/images/pic113.jfif": "2befdab3740fa4cbe2de3dc7a798a49f",
"assets/images/pic11.png": "75834f4c4771e6e5152e7263f2a541a6",
"assets/images/pic112.jfif": "fdf64ddd6b3459eca1afc9bc5902e270",
"assets/images/pic108.jfif": "ccd28b4c096d1977d027f14708e0e7a7",
"assets/images/horizam.png": "3ecde86526a354339f625d2ed937d35c",
"assets/images/favicon.png": "a62c3801257405ea384a3af5f2cbbdf6",
"assets/images/pic118.jpeg": "8d44ad2ab33d538cba0efac7852b5f6b",
"assets/images/pic3.png": "aa8ac1d8ebfada381f0778403b152402",
"assets/images/pic2.png": "ef5fd7ab50f3c9852871e152977ef3e6",
"assets/images/pic102.gif": "c0224f6324f10974e0482820b1fe8a9d",
"assets/images/pic107.jfif": "a20876a9adbf141c66610b7852422e8a",
"assets/images/pic6.jpg": "b4c58c2d54b612e2c83596b109a71793",
"assets/images/crewlogix_logo.png": "7ce71940512d279281b7a665c76792ac",
"assets/images/pic110.jfif": "886435a9874555d371649e0bddf26eff",
"assets/images/pic6.png": "4e9a1ae02b7714e7990e369adfa9e79f",
"assets/images/pic7.png": "58877ea1991626d6bc45a5542d714e77",
"assets/images/pic7.jpg": "67944bdffd3e281e1750a4b89f312fe1",
"assets/images/pic119.jpeg": "6d49ab73d023784d5036c78c45ab3967",
"assets/images/pic111.gif": "88612f94478814faac69b0c63a4780fb",
"assets/images/pic5.jpg": "ecddcb730edf455705e72a6b66130033",
"assets/images/pic5.png": "b7937fb7ed1bca864f16767053a05b53",
"assets/images/pic4.png": "0b8311dda9433359c57184830a66a13a",
"assets/images/pic121.png": "1f3bbe6d1220201e931afd6b91970a8f",
"assets/images/BIODATA.pdf": "0098a2c4f561807c9f0064ccb22dd185",
"assets/images/pic120.png": "ea39b948bcc12495cc2825782b9e645f",
"assets/images/deedy_resume.pdf": "7abb4d1961631143d23600178b3cb8f5",
"assets/images/logo.svg": "02a76f8b870450812adb326cb54eaf25",
"assets/images/pic116.jfif": "fef16bfc930bbb9e3eb2553ed1da8b6c",
"assets/AssetManifest.json": "b8c9c9066a27f89732966fe4fd52a2d1",
"assets/NOTICES": "0a99211817bb5f6c7a45a9aec1aa931f",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "28948efca146ae95befe1a313f95e290",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "df059b9bb3db4cb0137aa5d6378fee14",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "53b1f767805c26748a6611ab7e6e7811",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "0fc4a47049b5f5e413d1124d6edfec74",
"assets/fonts/MaterialIcons-Regular.otf": "1bf9655686a33ac437eb141175efc2ca",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
