#!/bin/bash

# Prüfen, ob ein Argument übergeben wurde, sonst aktuelles Verzeichnis nehmen
TARGET="${1:-.}"

# Funktion für die Verarbeitung (dein Herzstück)
process_file() {
    local file="$1"
    local output="${file%.*}1.mkv"
    local temp="temp_repair_$$.mkv" # Eindeutiger Temp-Name

    echo "========================================"
    echo "VERARBEITE: $file"
    echo "========================================"

    # 1. SCHRITT: Sicherheits-Check (Software Repair)
    # Behebt 'Packed B-Frames' und 'non-interleaved AVI'
    if ! ffmpeg -y -i "$file" -c copy -bsf:v mpeg4_unpack_bframes "$temp" -loglevel error; then
        echo "!!! FEHLER beim Reparieren von $file - überspringe !!!"
        rm -f "$temp"
        return 1
    fi

    # 2. SCHRITT: Hardware-Encoding (Pi 4 V4L2M2M)
    # Nutzt deine stabilen Parameter
    ffmpeg -init_hw_device drm=dr:/dev/dri/renderD128 -fflags +genpts \
      -i "$temp" -filter_hw_device dr -metadata title="$file" \
      -map 0:v? -map 0:a? -map 0:s? \
      -c:v h264_v4l2m2m -b:v 2M -maxrate 3M -bufsize 12M -minrate 3M \
      -num_capture_buffers 64 -num_output_buffers 32 \
      -c:a libfdk_aac -b:a 128k -af "volume=2.0" \
      -scodec copy -f matroska "$output" -y

    if [ $? -eq 0 ]; then
        echo ">>> ERFOLG: $output erstellt."
        rm "$temp"
    else
        echo "!!! HW-ENCODER FEHLER bei $file !!!"
        echo "Tipp: Falls hängen geblieben, Treiber resetten oder rebooten."
        rm -f "$temp"
    fi
}

# Hauptschleife: Sucht nach .avi und .AVI Dateien
if [ -f "$TARGET" ]; then
    process_file "$TARGET"
else
    find "$TARGET" -maxdepth 1 -type f \( -iname "*.avi" \) | while read -r f; do
        process_file "$f"
    done
fi

echo "========================================"
echo "ALLE AUFGABEN ERLEDIGT! - Pi ist fertig."
echo -e "\a" # System-Beep (PC Speaker)
