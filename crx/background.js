let socket = null;
let lastGpsData = null;

function connectGPS() {
    if (socket) {
        try { socket.close(); } catch(e) {}
    }

    socket = new WebSocket("ws://127.0.0.1:9999");

    socket.onopen = () => {
        updateIconStatus(true);
        console.log("WebSocket verbunden - GPS Daten aktiv");
    };

    socket.onmessage = async (event) => {
        try {
            const data = JSON.parse(event.data);

            if (data?.location?.lat && data?.location?.lng) {
                lastGpsData = data;

                const gpsMessage = {
                    type: "GPS_UPDATE",
                    data: {
                        coords: {
                            latitude: data.location.lat,
                            longitude: data.location.lng,
                            // Höhe
                            altitude: data.location.alt || data.altitude || null,
                            // Genauigkeit (deine 26.6m)
                            accuracy: data.accuracy || 26.6,
                            // Höhen-Genauigkeit (deine 1.5m)
                            altitudeAccuracy: data.altitudeAccuracy || ( (data.location.alt || data.altitude) ? 1.5 : null ),
                            // Richtung & Geschwindigkeit
                            heading: data.heading || data.location.heading || null,
                            speed: data.speed || data.location.speed || null
                        }
                    }
                };

                const tabs = await chrome.tabs.query({});
                tabs.forEach(tab => {
                    chrome.tabs.sendMessage(tab.id, gpsMessage).catch(() => {});
                });
            }
        } catch (e) {
            console.error("JSON Parse Error", e);
        }
    };

    socket.onclose = () => {
        updateIconStatus(false);
        setTimeout(connectGPS, 3000);
    };

    socket.onerror = () => {
        if (socket) socket.close();
    };
}

chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    if (message.type === "GET_LAST_GPS") {
        sendResponse(lastGpsData);
    }
    return true; // Wichtig für asynchrone Antwort an das Popup
});

function updateIconStatus(success) {
    chrome.action.setBadgeBackgroundColor({ color: success ? "#4CAF50" : "#F44336" });
    chrome.action.setBadgeText({ text: success ? "ON" : "ERR" });
}

connectGPS();
