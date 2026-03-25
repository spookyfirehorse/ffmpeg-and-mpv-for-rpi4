(function() {
    let lastPosition = null;
    let pendingRequests = [];

    // Empfange Daten vom Python-Proxy (via Content Script Brücke)
    window.addEventListener("GPSD_UPDATE_EVENT", (event) => {
        lastPosition = event.detail;
        console.log("Shim: Erste Echtzeit-Daten empfangen!");

        // Arbeite alle wartenden Anfragen ab, die "geparkt" wurden
        while (pendingRequests.length > 0) {
            const request = pendingRequests.shift();
            request.success(lastPosition);
        }
    });

    const geolocationShim = {
        getCurrentPosition: function(success, error, options) {
            if (lastPosition) {
                // Wenn wir schon Daten vom Proxy haben: sofort senden
                success(lastPosition);
            } else {
                // Wenn noch nichts da ist: Anfrage parken statt Error werfen
                console.log("Shim: Warte auf erste Daten vom Python-Proxy...");
                pendingRequests.push({ success, error });

                // Optional: Timeout nach 10 Sek, falls Python offline ist
                setTimeout(() => {
                    const idx = pendingRequests.findIndex(r => r.success === success);
                    if (idx !== -1) {
                        pendingRequests.splice(idx, 1);
                        error({ code: 3, message: "Python-Proxy antwortet nicht." });
                    }
                }, 10000);
            }
        },
        watchPosition: function(success, error, options) {
            const id = Math.floor(Math.random() * 10000);
            if (lastPosition) success(lastPosition);

            window.addEventListener("GPSD_UPDATE_EVENT", (e) => success(e.detail));
            return id;
        },
        clearWatch: function(id) {}
    };

    Object.defineProperty(navigator, 'geolocation', {
        value: geolocationShim,
        configurable: true
    });
})();
