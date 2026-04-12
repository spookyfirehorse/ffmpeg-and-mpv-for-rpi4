let socket = null;
let lastGpsData = null;

function connectGPS() {
    if (socket) { try { socket.close(); } catch(e) {} }
    socket = new WebSocket("ws://127.0.0.1:9999");

    socket.onopen = () => {
        chrome.action.setBadgeText({ text: "ON" });
        chrome.action.setBadgeBackgroundColor({ color: "#4CAF50" });
    };

    socket.onmessage = (event) => {
        try {
            const data = JSON.parse(event.data);
            if (data.class === "TPV" && data.lat) {
                lastGpsData = data;
                // Sende an Tabs für die Karte
                chrome.tabs.query({}, (tabs) => {
                    tabs.forEach(tab => {
                        chrome.tabs.sendMessage(tab.id, {type: "GPS_UPDATE", data: data}).catch(() => {});
                    });
                });
            }
        } catch (e) {}
    };

    socket.onclose = () => {
        chrome.action.setBadgeText({ text: "ERR" });
        chrome.action.setBadgeBackgroundColor({ color: "#F44336" });
        setTimeout(connectGPS, 3000);
    };
}

chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    if (message.type === "GET_LAST_GPS") sendResponse(lastGpsData);
    return true;
});

connectGPS();
