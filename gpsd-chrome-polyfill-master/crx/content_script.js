// Empfängt GPS-Daten vom Service Worker (background.js)
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    if (message && message.type === "GPS_UPDATE" && message.data) {
        // Erstellt das CustomEvent für die MAIN-World (shim.js)
        const event = new CustomEvent("GPSD_UPDATE_EVENT", {
            detail: {
                coords: {
                    latitude: message.data.coords.latitude,
                    longitude: message.data.coords.longitude,
                    altitude: message.data.coords.altitude || null,
                    accuracy: message.data.coords.accuracy || 1,
                    altitudeAccuracy: message.data.coords.altitudeAccuracy || null,
                    heading: message.data.coords.heading || null,
                    speed: message.data.coords.speed || null
                },
                timestamp: message.data.timestamp || Date.now()
            }
        });

        // Feuert das Event in das Fenster-Objekt
        window.dispatchEvent(event);
    }
});
