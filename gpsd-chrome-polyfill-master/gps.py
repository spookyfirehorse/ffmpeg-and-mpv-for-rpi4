import socket
import json
from http.server import BaseHTTPRequestHandler, HTTPServer

class GPSHandler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        self.end_headers()

    def do_POST(self):
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Content-type', 'application/json')
        self.end_headers()
        try:
            # Verbindung zum GPSD auf 10.0.0.32
            with socket.create_connection(("10.0.0.32", 2947), timeout=5) as s:
                s.sendall(b'?WATCH={"enable":true,"json":true};\n')
                f = s.makefile()
                
                # Wir lesen bis zu 50 Zeilen, um das TPV-Paket sicher zu finden
                for _ in range(50):
                    line = f.readline()
                    if not line: break
                    if '"class":"TPV"' in line:
                        tpv = json.loads(line)
                        if "lat" in tpv and "lon" in tpv:
                            res = {
                                "location": {
                                    "lat": tpv["lat"], 
                                    "lng": tpv["lon"]
                                },
                                "accuracy": tpv.get("eph", 10.0), # eph/epx ist die Genauigkeit
                                "timestamp": tpv.get("time")
                            }
                            print(f"Echtzeit-Fix gesendet: {res['location']}")
                            self.wfile.write(json.dumps(res).encode())
                            return
                
                print("Kein TPV-Paket im Stream gefunden.")
                self.wfile.write(b'{"error": "no fix"}')

        except Exception as e:
            print(f"Verbindungsfehler zu 10.0.0.32: {e}")
            self.wfile.write(b'{"error": "connection failed"}')

if __name__ == "__main__":
    print("GPS-Proxy aktiv auf http://127.0.0.1:8888")
    HTTPServer(('127.0.0.1', 8888), GPSHandler).serve_forever()
