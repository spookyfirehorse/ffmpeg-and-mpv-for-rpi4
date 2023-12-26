#!/bin/bash


for file in "$1"; do ffmpeg -hwaccel drm  -hwaccel_output_format drm_prime  -i "$file"  -c:v h264_v4l2m2m  -b:v 3M  -num_capture_buffers 512   -num_output_buffers 64 -bufsize 5M   -maxrate 5M  -filter:720:-1 -aspect 16:9 -c:a libfdk_aac  -b:a 96k -f mp4 "${file%.*}_1.mp4"; done
