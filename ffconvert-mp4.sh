#!/bin/bash


for file in "$1"; do ffmpeg   -hwaccel drm  -hwaccel_output_format drm_prime   -i "$file"  -c:v h264_v4l2m2m -b:v 2M -pix_fmt yuv420p -filter:v scale=1080:-1   -c:a libfdk_aac  -b:a 96k -f mp4 "${file%.*}_1.mp4"; done
