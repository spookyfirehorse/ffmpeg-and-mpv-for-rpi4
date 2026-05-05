import asyncio
import json
import websockets
import time

# Konfiguration
GPSD_HOST = "10.0.0.32"
GPSD_PORT = 2947
LISTEN_HOST = "127.0.0.1"
LISTEN_PORT = 9999

connected_clients = set()

async def gpsd_reader():
    while True:
        try:
            print(f"Verbinde zu GPSD ({GPSD_HOST})...")
            reader, writer = await asyncio.open_connection(GPSD_HOST, GPSD_PORT)
            writer.write(b'?WATCH={"enable":true,"json":true};\n')
            await writer.drain()

            while True:
                line = await reader.readline()
                if not line: break
                
                # Schneller Check vor dem teuren json.loads
                if b'"class":"TPV"' in line:
                    tpv = json.loads(line.decode())
                    if "lat" in tpv and "lon" in tpv:
                        payload = json.dumps({
                            "location": {"lat": tpv["lat"], "lng": tpv["lon"]},
                            "accuracy": max(1.0, float(tpv.get("eph", 10.0))),
                            "altitude": tpv.get("altHAE") or tpv.get("alt"),
                            "speed": tpv.get("speed"),
                            "heading": tpv.get("track"),
                            "timestamp": time.time()
                        })

                        if connected_clients:
                            # Sende an alle, aber ignoriere Fehler einzelner Clients sofort
                            await asyncio.gather(
                                *[asyncio.create_task(client.send(payload)) for client in connected_clients], 
                                return_exceptions=True
                            )
        except Exception as e:
            print(f"GPSD-Fehler: {e}. Neustart in 5s...")
            await asyncio.sleep(5)

async def ws_handler(websocket):
    connected_clients.add(websocket)
    print(f"Client verbunden. Gesamt: {len(connected_clients)}")
    try:
        # keep_alive_timeout verhindert, dass "tote" Leichen die Liste füllen
        async for message in websocket:
            pass 
    except websockets.exceptions.ConnectionClosed:
        pass
    finally:
        connected_clients.discard(websocket)
        print(f"Client getrennt. Verbleibend: {len(connected_clients)}")

async def main():
    # Starte den GPSD-Reader im Hintergrund
    asyncio.create_task(gpsd_reader())
    
    # Websocket Server mit Pings (wichtig für Stabilität)
    async with websockets.serve(
        ws_handler, 
        LISTEN_HOST, 
        LISTEN_PORT,
        ping_interval=10, # Prüft alle 10 Sek, ob Client noch da
        ping_timeout=5    # Wartet 5 Sek auf Antwort
    ):
        print(f"WebSocket-Proxy aktiv auf ws://{LISTEN_HOST}:{LISTEN_PORT}")
        await asyncio.Future() # Run forever

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        pass
