#!/bin/bash
# --- USB 3.0 Sektion (Hub 2) ---
# Schaltet die blauen Ports und die ASMT SATA Bridge / Genesys Hub ein
/usr/sbin/uhubctl -l 2 -a 1
/bin/sleep 1

# --- USB 2.0 Sektion (Hub 1-1) ---
# Schaltet die schwarzen Ports und den Genesys 2.1 Hub ein
/usr/sbin/uhubctl -l 1-1 -a 1
/bin/sleep 1

# --- Externer Genesys Hub (Spezialfall ganged) ---
# Da der Genesys Hub als 'ganged' gemeldet wird, schalten wir ihn explizit an
/usr/sbin/uhubctl -l 2-2 -a 1 2>/dev/null
/usr/sbin/uhubctl -l 1-1.2 -a 1 2>/dev/null
