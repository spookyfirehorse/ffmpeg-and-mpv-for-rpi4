#!/bin/bash
# Ebene 1: Haupt-Controller (Root)
/usr/sbin/uhubctl -l 1 -p 1 -a 1
/bin/sleep 1

# Ebene 2: Der primäre 4-Port Hub (LAN9514)
# Schaltet Ports 2, 3 und 4 am Pi frei
/usr/sbin/uhubctl -l 1-1 -a 1
/bin/sleep 1

# Ebene 3: Der interne LAN/USB-Sub-Hub
# Stellt sicher, dass Ethernet (Port 1) und Serial (Port 3) laufen
/usr/sbin/uhubctl -l 1-1.1 -a 1
