#!/bin/bash
for file in "$1"; do   ffmpeg  -ifo_palette default.IFO -y -probesize 1400M -analyzeduration 1410M -hwaccel drm -hwaccel_output_format drm_prime  \
  -canvas_size  720x576  -i "$file"  -ss 00:00:02 -metadata title="$file" \
  -map 0:v -scodec dvdsub   -map 0:s:0    \
 -c:v h264_v4l2m2m -profile:v 4 -level 4.2  -b:v 3M  -num_capture_buffers 92   -num_output_buffers 64 -bufsize 5M   -maxrate 5M  -aspect 16:9 \
  -c:a libopus     -b:a 128k -map 0:a      -f mp4  /media/storage/"${file%.*}.mkv"; done
# -filter:v scale=1280:-1

#ls -lah dvd/VIDEO_TS/
#mkdir dvd
#sudo mount /media/storage/dead_man.iso dvd/
#ls -lah dvd/VIDEO_TS/
#sudo cp dvd/VIDEO_TS/VTS_02_0.IFO default.IFO
#ffmpeg -h encoder=h264
##-num_output_buffers 4

## -num_capture_buffers 16
##mpv dvdnav:// --cache=no --dvd-device=/media/spooky/store/only-lovers-left-alive.img --stream-dump=/media/spooky/store/only-lovers-left-alive.vob
