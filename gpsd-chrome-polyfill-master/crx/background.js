function updateIconStatus(success) {
    const color = success ? "#4CAF50" : "#F44336";
    const text = success ? "ON" : "ERR";
    chrome.action.setBadgeBackgroundColor({ color: color });
    chrome.action.setBadgeText({ text: text });
}

async function updateGPS() {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), 3000); // 3 Sek statt 1.5

    try {
        const response = await fetch("http://127.0.0.1:8888", {
            method: "POST",
            cache: "no-cache",
            signal: controller.signal
        });
        clearTimeout(timeoutId);
        const data = await response.json();

        if (data && data.location) {
            updateIconStatus(true);
            const gpsMessage = {
                type: "GPS_UPDATE",
                data: {
                    coords: {
                        latitude: data.location.lat,
                        longitude: data.location.lng,
                        accuracy: data.accuracy || 10,
                        timestamp: Date.now()
                    }
                }
            };
            const tabs = await chrome.tabs.query({url: ["http://*/*", "https://*/*"]});
            tabs.forEach(tab => chrome.tabs.sendMessage(tab.id, gpsMessage).catch(() => {}));
        } else {
            updateIconStatus(false);
        }
    } catch (err) {
        updateIconStatus(false);
    }
}

// Alarms & Events ohne verschachtelte Callbacks
chrome.alarms.create("gps-tick", { periodInMinutes: 0.033 });
chrome.alarms.onAlarm.addListener((a) => { if(a.name === "gps-tick") updateGPS(); });
chrome.runtime.onMessage.addListener((m) => { if(m.type === "RESTART_SYNC") updateGPS(); });
chrome.runtime.onStartup.addListener(updateGPS);
chrome.runtime.onInstalled.addListener(updateGPS);

updateGPS();
setInterval(updateGPS, 3000);
