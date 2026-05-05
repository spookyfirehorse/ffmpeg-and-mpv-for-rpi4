async function updatePopup() {
    try {
        const res = await chrome.runtime.sendMessage({type: "GET_LAST_GPS"});

        if (res) {
            document.getElementById('no-data').style.display = 'none';
            document.getElementById('gps-grid').style.display = 'grid';

            // Flexibles Auslesen der Daten (sucht in location UND im Hauptobjekt)
            const lat = res.location?.lat || res.lat || 0;
            const lng = res.location?.lng || res.lng || 0;

            // HIER: Mehrfache Prüfung für die Höhe (alt, altitude, location.alt)
            const alt = res.location?.alt || res.altitude || res.alt || 0;

            const head = res.location?.heading || res.heading || 0;
            const speed = res.location?.speed || res.speed || 0;

            // HTML Felder füllen
            document.getElementById('lat').innerText = lat.toFixed(5);
            document.getElementById('lng').innerText = lng.toFixed(5);
            document.getElementById('alt').innerText = alt.toFixed(1) + " m";
            document.getElementById('head').innerText = head.toFixed(1) + "°";

            // Umrechnung m/s in km/h
            const speedKmh = (speed * 3.6).toFixed(1);
            document.getElementById('speed').innerText = speedKmh + " km/h";
        }
    } catch(e) {
        console.error("Popup Error:", e);
    }
}

// Intervall für flüssige Anzeige
setInterval(updatePopup, 1000);
updatePopup();
