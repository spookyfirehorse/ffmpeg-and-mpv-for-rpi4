#!/bin/bash

# Abbrechen bei Fehlern
set -e

# Prüfung auf Root-Rechte
if [[ $EUID -ne 0 ]]; then
   echo "Fehler: Dieses Skript muss als root ausgeführt werden (Nutze sudo)." 1>&2
   exit 1
fi

# Raspberry Pi Hardware-Check
if ! grep -q "Raspberry Pi" /proc/device-tree/model; then
  echo "Fehler: Dieses Skript ist nur für Raspberry Pi geeignet."
  exit 1
fi

ver="1.0"
marker="0.0.0"
FIX_DTBO="wm8960-final-fix.dtbo"
CONFIG_PATH="/boot/firmware/config.txt"
[ ! -f "$CONFIG_PATH" ] && CONFIG_PATH="/boot/config.txt"

# Sicherstellen, dass die Fix-Datei existiert
if [ ! -f "$FIX_DTBO" ]; then
    echo "Fehler: Datei $FIX_DTBO nicht im aktuellen Verzeichnis gefunden!"
    exit 1
fi

echo "--> Starte Installation mit FIX: $FIX_DTBO"

# Abhängigkeiten installieren (ohne Kernel-Header)
apt update
apt-get -y install dkms git i2c-tools libasound2-plugins

function install_module {
  local src=$1
  local mod=$2
  echo "--> Installiere DKMS Modul: $mod"
  
  if [[ -d /var/lib/dkms/$mod/$ver/$marker ]]; then
    rmdir /var/lib/dkms/$mod/$ver/$marker
  fi

  if [[ -e /usr/src/$mod-$ver || -e /var/lib/dkms/$mod/$ver ]]; then
    dkms remove --force -m $mod -v $ver --all || true
    rm -rf /usr/src/$mod-$ver
  fi
  
  mkdir -p /usr/src/$mod-$ver
  cp -a $src/* /usr/src/$mod-$ver/
  dkms add -m $mod -v $ver
  dkms build -m $mod -v $ver
  dkms install --force -m $mod -v $ver

  mkdir -p /var/lib/dkms/$mod/$ver/$marker
}

# Modul-Installation
install_module "./" "wm8960-soundcard"

# Overlays kopieren (NUR die fixierte Datei)
echo "--> Kopiere Fix-Overlay $FIX_DTBO..."
TARGET_OVERLAY_DIR="/boot/overlays"
[ -d "/boot/firmware/overlays" ] && TARGET_OVERLAY_DIR="/boot/firmware/overlays"
cp "$FIX_DTBO" "$TARGET_OVERLAY_DIR/"

# Kernel Module eintragen
echo "--> Konfiguriere Kernel-Module..."
for mod in i2c-dev snd-soc-wm8960 snd-soc-wm8960-soundcard; do
  grep -q "^$mod" /etc/modules || echo "$mod" >> /etc/modules
done

# config.txt anpassen
echo "--> Konfiguriere $CONFIG_PATH für $FIX_DTBO..."
sed -i 's/^#\(dtparam=i2c_arm=on\)/\1/' $CONFIG_PATH || true
sed -i 's/^#\(dtparam=i2s=on\)/\1/' $CONFIG_PATH || true

# Alte Einträge entfernen
sed -i '/dtoverlay=wm8960-soundcard/d' $CONFIG_PATH

# Neuen Fix eintragen
FIX_NAME=$(basename "$FIX_DTBO" .dtbo)
for param in "dtoverlay=i2s-mmap" "dtoverlay=$FIX_NAME"; do
  grep -q "^$param" $CONFIG_PATH || echo "$param" >> $CONFIG_PATH
done

# Konfigurationsdateien und Service
echo "--> Installiere Konfigurationsdateien und Service..."
mkdir -p /etc/wm8960-soundcard
cp *.conf *.state /etc/wm8960-soundcard/ 2>/dev/null || true
cp wm8960-soundcard /usr/bin/ 2>/dev/null || true
chmod +x /usr/bin/wm8960-soundcard 2>/dev/null || true
cp wm8960-soundcard.service /lib/systemd/system/ 2>/dev/null || true

systemctl daemon-reload
systemctl enable wm8960-soundcard.service || true

echo "------------------------------------------------------"
echo " Fertig! Der Fix '$FIX_DTBO' wurde aktiviert."
echo " Bitte starte deinen Raspberry Pi neu: sudo reboot"
echo "------------------------------------------------------"
