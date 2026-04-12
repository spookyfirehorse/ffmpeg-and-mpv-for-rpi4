chrome.runtime.onMessage.addListener((message) => {
    if (message.type === "GPS_UPDATE") {
        window.dispatchEvent(new CustomEvent("GPSD_UPDATE_EVENT", {
            detail: message.data
        }));
    }
});
