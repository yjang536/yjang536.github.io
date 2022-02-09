'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "06c4b1155a0335935369c3ad47313d70",
"index.html": "caebcae78cfef8796a1cf11665ba26c3",
"/": "caebcae78cfef8796a1cf11665ba26c3",
"firebase-messaging-sw.js": "d41d8cd98f00b204e9800998ecf8427e",
"main.dart.js": "207364979d6c3d4f0ca0b6fc05e5f50f",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "61cc2bc28813d78c411588d0db9ff009",
".git/ORIG_HEAD": "e537624b808be239ff02143b60d94c9d",
".git/config": "dcc79b8ca2a705e0439bfc85d9cb3247",
".git/objects/59/ea4ef8099e023d9b44770beedce14201c2946f": "b0828823e3a3091c66c6a7a22f350db3",
".git/objects/3e/432a152179956cfe12e2950b8ff174b71cc83e": "826b5cc9c80202498cefa215496978b0",
".git/objects/50/08ddfcf53c02e82d7eee2e57c38e5672ef89f6": "d18c553584a7393b594e374cfe29b727",
".git/objects/50/6359c2c963c1b83246ad005cdd1287f4168506": "ecaf5c63572ecd6616e76f98dd7003f3",
".git/objects/03/d8e2d2899cd34b90cfcfb0ade7e1787b717e27": "39db522befa763557ae5e28dd2a45250",
".git/objects/32/46ad559eeae0370195978eaed83f1053ee13fd": "a043dbc0a0bda96ce2127799ccc27506",
".git/objects/60/84d9e1d7bff95e52fe9a8e6251011d3a1d7483": "c7df4923c9b646ceb7ae32c1190501f4",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/bc/2dc10e1db21f6b33ef000c0a9b0b982b3faadd": "c30a887a81cdf485f61c664fcdadfe24",
".git/objects/ae/1cccc7ca6ebf26b1e4104baba791f1ee278785": "d6c9a4268f64077e9f6637d2afce5d73",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/e2/16e0982de2da1b1865a0143d588fee0e601927": "e136add9f64bcaa5b8f5543c489f6acb",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/e4/ae3a714c299f5a870c907680352282ca4a4d63": "1b1b1d830e443fa71266ffda381465c1",
".git/objects/fe/821519cde86b305ebb84502ae6003e07522613": "9f88dcb679d52d97aed003b2a475a56f",
".git/objects/ec/071dddaf652598ec00fa33f1fa09f478382327": "7d096c400125fc0efebc6f279e37e829",
".git/objects/4b/80db8927206a01ac0167c1670d6dc38fd86d20": "998e9fe55897fa76f7b31ed80185e7c4",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/73/aaaa2f7b07b462f3d66ff496d96346da8fe505": "0a5bcab75823ee75001f4e6280b61d4b",
".git/objects/87/f054e04ed114946a8053f1e1af75ae02515ad8": "5564957db507df4c078a0fee4df56451",
".git/objects/87/748811d9bdbffffa46bb959351dcefc851eef9": "f6ae000509c1c6189205c1dffee84fb3",
".git/objects/1a/cfa64189f06be435280dbcbf5e3a6b67b95d24": "84c5b4fe92b2d0d2f2b6ebef8996984e",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/7e/5c447ad74e4ff314a9c40ba97c48f264628c84": "5d799189e3059c41fb870df94cfdf1b6",
".git/objects/10/59a6d7e6b7d3a1e637e8687a5ddf95dc236d0f": "e8437d1bd07555de626f98cc22f295a4",
".git/objects/4d/d119932d3ba03fa4dc823d0b76a03b027f9080": "93c8feed8f51380bc338f2c4f3cd3a88",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6b/e32efe3e4dc9a709b06df38b7e6814ea8aff83": "683d2dd587a4e07002854a71b7ce46cb",
".git/objects/00/5ae8a029012eac12a17ec8aa91eb920ec1d8a2": "f0df17d22ca1d61550e63c7da5096480",
".git/objects/91/8b2e24e1e55d9cb9778842f5d5042d7276ac60": "2688acfc8c09d214f29323cdc0f33054",
".git/objects/65/647fb5bcca55e208cb176be85c26cdd9315dc2": "1d19117857b7683440941fd0eeede76f",
".git/objects/6d/9ee87b88b2a020b4ee6f24bd55d78dd7f9c470": "48f7250d432aa9226fd500d4b94cab8b",
".git/objects/6c/779e6e228629e66ba89c1c8c866ed4621d037f": "a3b8a69a39378840c06600bb88e8f0ad",
".git/objects/99/4761922386f6aa255e2001de5c6ec259f988be": "d3038ff6a7f94b9956aae256f2d25388",
".git/objects/0a/0e7403cbbd770f1d183a35a8f6cbd940d503d1": "a663a3c54ceb914c50e09f283a144a55",
".git/objects/90/8e2a7954857695b8b9d33659926ce8ce19ee0b": "b38d25ba8359fc6665e92acd8c5b8533",
".git/objects/bf/9152384cf4ef72a5ee86d436ae0dd5b1002657": "9c9044cdbc15d7bd71d6fa75e32b30b9",
".git/objects/b8/1680dd3c3b24c1128fff01cdc7ceb0b93034a3": "2635a1101cb06a57a5f47801962d3de6",
".git/objects/d5/c1aaa297fdff0f604d68d000adc3ca698563db": "ef55213b57037ee4996a98f2cb28b771",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/beffd3ad4fe54d6cabccf83a05477d6a986cd0": "6677888e4a051c7838b5b240c09f0981",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/e6/b24cdee2d6dcbf5c6268024002d7dacd0c9b94": "c26cfa7c9689f2ceafeffec4894ad76f",
".git/objects/e6/9fa178853ec8b2d607f8fa9d2398a61fee4e81": "f24fbe335fb037492c65833479a8a568",
".git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391": "c70c34cbeefd40e7c0149b7a0c2c64c2",
".git/objects/f7/56a0c835e02557adea4de819e2b977f2e87ce7": "d16a1ef3c7dbb0fe4706bd4fae3303f2",
".git/objects/c5/df36d545d1548f286ba76cdb38b69662a23069": "b36d01e2e398bff23bcaa3367e779c38",
".git/objects/e7/f269acd78ef4999412c499496d60d0512678b3": "b407cbd2bc183f078b6808bf0e053b2e",
".git/objects/46/d57416efb30b9a5b6e37dbd5d202ec0b98eb4a": "03fb7f460926de92f13cabed7f856fc3",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/85/0119e6b6a683d35535feecdc0dbae7614c35ea": "70d4ed8096ad92a277706cc741f483dc",
".git/objects/71/b030ee24b5550df0bd9afb60172621b0881ba8": "3ccbefd31df787e64dc7e7972e459c57",
".git/objects/2e/5b9f163d6755786e219b435077d72633c19c18": "3590b084174d12f139d31e94eb0e375a",
".git/objects/2b/14e77180ac381f96d7f915a355f93238ecd380": "e67de27922b01edb0ec0425ef28edc7b",
".git/objects/7a/9dfa044d022f5ca8cf9191e37fef926dd67f77": "7727ae4eaab69538f1d040373bf4867d",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "ae9115ecb2b6e6a3f0521b848c9bc19b",
".git/logs/refs/heads/main": "572d6a9f298558e13b1a76164fc95add",
".git/logs/refs/remotes/origin/main": "d005df00a0b906779e3022dfb15ef734",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "e537624b808be239ff02143b60d94c9d",
".git/refs/remotes/origin/main": "e537624b808be239ff02143b60d94c9d",
".git/index": "0cdf61daeb7c3686f02bc083324d0c94",
".git/packed-refs": "a891e6bb26eb0d480aef486a7e8ea166",
".git/COMMIT_EDITMSG": "5c9597f3c8245907ea71a89d9d39d08e",
".git/FETCH_HEAD": "9c005e0187b809ffadb38bd704c9f43f",
".vscode/launch.json": "50488dfe50fbe21a4c67519a56ba5549",
"assets/AssetManifest.json": "d8c9677e7340188ff2a19cd050389f4c",
"assets/NOTICES": "a4210b37f8f0e4543e4303cbb73234eb",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "aa1ec80f1b30a51d64c72f669c1326a7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5178af1d278432bec8fc830d50996d6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b37ae0f14cbc958316fac4635383b6e8",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/icons/cart.png": "9d2d193b94ae18b761d347fbd8d31ae7",
"assets/assets/icons/account.png": "fc8c59eeb1025730916835c592004945",
"assets/assets/icons/google.png": "9bf4f75e9ba30f91940c5887eba472b6",
"assets/assets/icons/facebook.png": "6fdfe2ee960b7e6db8dc483ce5efa10b",
"assets/assets/icons/explore.png": "bff5d82f6b710dd9276b3f940db5136a"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
