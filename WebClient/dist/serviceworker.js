var CACHE_NAME = "WebPushClient";
var CACHED_URLS = [
  "index.html",
  "IconResHigh.png",
  "IconResLow.png",
  "IconResMid.png",
  "styles.css",
  "Unit1.html",
  "WebPushClient.js"
  ];

self.addEventListener('install', function(event) {
                event.waitUntil(
                                caches.open(CACHE_NAME).then(function(cache) {
                                return cache.addAll(CACHED_URLS);
                })
                                );
});


self.addEventListener('fetch',function(event) {
   event.respondWith(
     fetch(event.request).catch(function() {
                   return caches.match(event.request).then(function(response) {
       if (response) {
                                   return response;
       } else if (event.request.headers.get("accept").includes("text/html")) {
                                   return caches.match("index.html");
                   }
                   });
   })
                   );
});

// Register event listener for the 'push' event.
var BADGE_COUNT = 0;

const PUSH_MESSAGE_CACHE = {};

self.addEventListener('message', function handler(event) {
    if (event.data.type === 'push') {
        if (event.data.id && PUSH_MESSAGE_CACHE[event.data.id]) {
            event.source.postMessage(PUSH_MESSAGE_CACHE[event.data.id]);
            delete PUSH_MESSAGE_CACHE[event.data.id];
        }
    }
});

self.addEventListener('push', function(event) {
    const payload = event.data.json();
    BADGE_COUNT++;

    if (navigator.setAppBadge) {
        navigator.setAppBadge(BADGE_COUNT);
    }

    event.waitUntil(
        self.registration.showNotification(payload.title, {
	        body: payload.body,
	        icon: payload.icon,
            badge: payload.badge,
            dir: payload.dir,
            lang: payload.lang,
            requireInteraction: payload.requireInteractions,
            silent: payload.silent,
            action: payload.action, //experimental
            image: payload.image, //experimental
            renotify: payload.renotify, //experimental
            timestamp: payload.timestamp, //experimental
            vibrate: payload.vibrate, //experimental
            data: { url: payload.url, custom: payload.data }
        })
    );
});

self.addEventListener('notificationclick', function(event) {
    BADGE_COUNT = 0;
    event.notification.close();

    if (navigator.clearAppBadge) {
        navigator.clearAppBadge();
    }

    event.waitUntil(
        clients.matchAll({includeUncontrolled: true, type: "window" }).then((clientsArr) => {
            if (event.notification.data) {
                let localUrl = new URL('./', location);
                let url = event.notification.data.url;
                if (!url) {
                    url = localUrl.href;
                }

                let targetClient = clientsArr.find((client) => { return client.url === url });
                if (targetClient) {
                    return targetClient.focus().then((client) => {
                        let remoteUrl = new URL(client.url);
                        if ((localUrl.origin === remoteUrl.origin) && event.notification.data.custom) {
                            client.postMessage(event.notification.data.custom)
                        }
                    });
                } else {
                    let remoteUrl = new URL(url);
                    let uuid = "";
                    if ((remoteUrl.origin === localUrl.origin) && event.notification.data.custom) {
                        uuid = crypto.randomUUID();
                        PUSH_MESSAGE_CACHE[uuid] = event.notification.data.custom;
                        uuid = "#update=" + uuid;
                    }
                    return clients.openWindow(url + uuid);
                }
            }
        })
    );
}, false);

/*
self.addEventListener('pushsubscriptionchange', function(event) {
    let updateUrl = "$(WebPushUpdateURL)";
    if (updateUrl !== "") {
        event.waitUntil(
            fetch(updateUrl, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    oldSubscription: event.oldSubscription ? event.oldSubscription : null,
                    newSubscription: event.newSubscription ? event.newSubscription : null
                })
            })
        );
    }
});
*/
