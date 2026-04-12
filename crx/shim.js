(function() {
    let currentFakeCoords = {
        latitude: 0, longitude: 0, accuracy: 21.43,
        altitude: null, speed: null, heading: null, altitudeAccuracy: null
    };

    const activeWatchers = new Map();
    const hideIdentity = (originalFn, newFn) => {
        newFn.toString = () => originalFn.toString();
        return newFn;
    };

    window.addEventListener("GPSD_UPDATE_EVENT", (event) => {
        const data = event.detail.coords;
        const jitter = () => (Math.random() - 0.5) * 0.00001;
        const altJitter = () => (Math.random() - 0.5) * 0.2; // 20cm Schwankung

        currentFakeCoords = {
            latitude: (data.latitude || 0) + jitter(),
                            longitude: (data.longitude || 0) + jitter(),
                            accuracy: data.accuracy || (Math.random() * 5 + 18.2),
                            altitude: data.altitude ? (data.altitude + altJitter()) : null,
                            speed: data.speed || null,
                            heading: data.heading || null,
                            altitudeAccuracy: data.altitude ? 1.5 : null
        };
    });

    const createPositionObject = () => ({
        coords: { ...currentFakeCoords },
        timestamp: Date.now()
    });

    const origGetPos = navigator.geolocation.getCurrentPosition;
    navigator.geolocation.getCurrentPosition = hideIdentity(origGetPos, (success) => {
        setTimeout(() => success(createPositionObject()), 10);
    });

    const origWatchPos = navigator.geolocation.watchPosition;
    navigator.geolocation.watchPosition = hideIdentity(origWatchPos, (success) => {
        const id = Math.floor(Math.random() * 100000);
        const interval = setInterval(() => success(createPositionObject()), 1000);
        activeWatchers.set(id, interval);
        return id;
    });

    const origClearWatch = navigator.geolocation.clearWatch;
    navigator.geolocation.clearWatch = hideIdentity(origClearWatch, (id) => {
        if (activeWatchers.has(id)) {
            clearInterval(activeWatchers.get(id));
            activeWatchers.delete(id);
        }
    });

    const origQuery = navigator.permissions.query;
    navigator.permissions.query = hideIdentity(origQuery, (parameters) => {
        if (parameters?.name === 'geolocation') {
            return Promise.resolve({ state: 'granted', onchange: null });
        }
        return origQuery.apply(navigator.permissions, [parameters]);
    });
})();
