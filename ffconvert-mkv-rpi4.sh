#!/bin/bash

for file in "$1"; do
  echo "--- Starte Sicherheits-Check für: $file ---"
  
  # 1. SCHRITT: Pack-B-Frames & Interleaving fixen (Stream Copy, kein HW-Risiko)
  # Dies erstellt eine saubere temporäre Datei, die den Hardware-Encoder nicht aufhängt.
  ffmpeg -y -i "$file" -c copy -bsf:v mpeg4_unpack_bframes "temp_repair.mkv"

  # Prüfen, ob Reparatur erfolgreich war
  if [ $? -eq 0 ]; then
    echo "--- Reparatur erfolgreich. Starte Hardware-Encoding ---"

    # 2. SCHRITT: Das eigentliche Encoding mit deinen Hardware-Parametern
    ffmpeg -init_hw_device drm=dr:/dev/dri/renderD128 -fflags +genpts \
      -i "temp_repair.mkv" -filter_hw_device dr -metadata title="$file" \
      -map 0:v? -map 0:a? -map 0:s? \
      -c:v h264_v4l2m2m -b:v 2M -maxrate 3M -bufsize 12M -minrate 3M \
      -num_capture_buffers 64 -num_output_buffers 32 \
      -c:a libfdk_aac -b:a 128k -af "volume=2.0" \
      -scodec copy -f matroska "${file%.*}1.mkv" -y

    # Aufräumen
    rm "temp_repair.mkv"
    echo "--- Fertig: ${file%.*}1.mkv ---"
  else
    echo "!!! FEHLER: Datei konnte nicht repariert werden. HW-Encoding übersprungen. !!!"
  fi
done
