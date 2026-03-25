// Funktion zum Abfragen der aktuellen Daten
async function updatePopup() {
    try {
        const response = await fetch("http://127.0.0.1:8888", { method: "POST" });
        if (response.ok) {
            const data = await response.json();
            if (data.location) {
                document.getElementById('lat').textContent = data.location.lat.toFixed(5);
                document.getElementById('lng').textContent = data.location.lng.toFixed(5);
            }
        }
    } catch (e) {
        console.error("Popup-Fetch Fehler", e);
    }
}

// Initial laden
updatePopup();

// Button-Event setzen
document.getElementById('refresh').addEventListener('click', () => {
    chrome.runtime.sendMessage({type: "RESTART_SYNC"});
    window.close();
});
