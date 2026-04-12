(function() {
    let current = { latitude: 0, longitude: 0, accuracy: 20 };

    window.addEventListener("GPSD_UPDATE_EVENT", (event) => {
        const d = event.detail;
        current = {
            latitude: d.lat || 0,
            longitude: d.lon || 0,
            altitude: d.alt || null,
            speed: d.speed || null,
            heading: d.track || null,
            accuracy: d.eph || 20
        };
    });

    navigator.geolocation.getCurrentPosition = (s) => s({coords: {...current}, timestamp: Date.now()});
    navigator.geolocation.watchPosition = (s) => setInterval(() => s({coords: {...current}, timestamp: Date.now()}), 1000);

    navigator.permissions.query = (p) => (p && p.name === 'geolocation')
    ? Promise.resolve({ state: 'granted' })
    : Promise.resolve({ state: 'denied' });
})();
