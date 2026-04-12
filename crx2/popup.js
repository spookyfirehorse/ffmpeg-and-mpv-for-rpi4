async function updatePopup() {
    try {
        // Frage aktiv den letzten Stand ab
        chrome.runtime.sendMessage({type: "GET_LAST_GPS"}, (res) => {
            if (chrome.runtime.lastError || !res) return;

            document.getElementById('no-data').style.display = 'none';
            document.getElementById('gps-grid').style.display = 'grid';

            // FIX: GPSD nutzt 'lon', wir schreiben es in das 'lng' Feld
            const lat = res.lat || 0;
            const lon = res.lon || 0;
            const alt = res.alt || 0;
            const head = res.track || 0;
            const speed = res.speed || 0;

            document.getElementById('lat').innerText = lat.toFixed(5);
            document.getElementById('lng').innerText = lon.toFixed(5); // Hier war der Fehler
            document.getElementById('alt').innerText = alt !== 0 ? alt.toFixed(1) + " m" : "-- m";
            document.getElementById('head').innerText = head !== 0 ? head.toFixed(1) + "°" : "--°";

            // Speed Umrechnung m/s -> km/h
            const speedKmh = (speed * 3.6).toFixed(1);
            document.getElementById('speed').innerText = speedKmh + " km/h";
        });
    } catch(e) {}
}

// Alle 500ms aktualisieren für flüssige Anzeige
setInterval(updatePopup, 500);
updatePopup();
