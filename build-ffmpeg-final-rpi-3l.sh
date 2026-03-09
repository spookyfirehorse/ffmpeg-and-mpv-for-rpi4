# pi 3


# minimal

cat << 'EOF' > bin/build-ffmpeg-final-rpi-3.sh
#!/bin/bash
# FFmpeg Build-Skript für RPi5 (Ultra-Minimal / Vulkan & V4L2)

# Alte Quellen entfernen
sudo rm -rf ~/rpi-ffmpeg

# Repository klonen
git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git ~/rpi-ffmpeg
cd ~/rpi-ffmpeg || exit

TMPDIR=/home/spook/tmp PKG_CONFIG_PATH="/usr/lib/arm-linux-gnueabihf/pkgconfig" \
./configure \
  --prefix=/usr \
  --libdir=/usr/lib/arm-linux-gnueabihf \
  --incdir=/usr/include/arm-linux-gnueabihf \
  --extra-version=ultra-pi3-armhf-jc-final-minimal \
  --arch=arm --target-os=linux --cpu=cortex-a53 \
  --fatal-warnings \
  --extra-cflags='-I/usr/include/libdrm -I/usr/include/gbm -mcpu=cortex-a53+crypto -O2 -pipe -ftree-vectorize -flto -Wno-stringop-overflow' \
  --extra-ldflags='-L/usr/lib/arm-linux-gnueabihf -lgbm -ldrm -latomic -Wl,-O2 -Wl,-rpath,/usr/lib/arm-linux-gnueabihf -Wl,--as-needed -flto -lstdc++' \
  --extra-libs='-L/usr/lib/arm-linux-gnueabihf -lpthread -Wl,-O2 -lm -lrt -ldl -lasound -lstdc++ -ljack -ldrm -lgbm -lgnutls -lgcrypt -lgpg-error -lxml2 -lfdk-aac -lFLAC -lopus -lass -lsoxr -lfreetype -lharfbuzz -lfribidi -lrubberband' \
  --disable-everything \
  --disable-hwaccels \
  --enable-ffmpeg --enable-ffprobe --disable-ffplay \
  --enable-shared --disable-static \
  --disable-debug --enable-stripping \
  --enable-hardcoded-tables --enable-pic --enable-pthreads \
  --enable-gpl --enable-version3 --enable-nonfree --enable-lto \
  --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale --enable-avdevice \
  --enable-libxml2 --enable-v4l2-m2m --enable-v4l2-request --enable-sand --enable-libdrm --enable-epoxy --enable-libudev \
  --enable-opengl --disable-vulkan --disable-libshaderc --disable-libplacebo \
  --enable-hwaccel=hevc_v4l2request \
  --enable-libass --enable-libfdk-aac --enable-libopus --enable-libsoxr --enable-libfreetype --enable-libharfbuzz --enable-libfribidi \
  --enable-ladspa --enable-lv2 --enable-librubberband --enable-alsa --enable-libpulse --enable-libjack \
  --enable-network --enable-gnutls --enable-gcrypt --enable-asm --enable-inline-asm --enable-neon --enable-runtime-cpudetect \
  --enable-protocol='pipe,file,fd,tcp,udp,rtp,rtsp,tls,rtmp,rtmpt,rtmpe,rtmps,ffrtmpcrypt,hls,dash,srt,unix,cache,crypto,concat' \
  --enable-bsf='mpeg2_metadata,hevc_metadata,h264_metadata,h264_mp4toannexb,hevc_mp4toannexb,mpeg4_unpack_bframes,aac_adtstoasc,opus_metadata,extract_extradata,null' \
  --enable-filter='firequalizer,realtime,latency,deinterlace_v4l2m2m,scale_v4l2m2m,format,scale,fps,setdar,settb,setpts,asettb,asetpts,concat,aresample,aformat,volume,loudnorm,equalizer,bass,treble,crystalizer,ladspa,lv2,rubberband,afade' \
  --enable-decoder='libfdk_aac,h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,mpeg1_v4l2m2m,mpeg2_v4l2m2m,mpeg4_v4l2m2m,hevc_v4l2request,opus,aac,ac3,eac3,mpegaudio,flac,vorbis,ass,srt,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo,adpcm_ms,adpcm_ima_wav' \
  --enable-encoder='h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,libfdk_aac,aac,libopus,flac,ass,srt,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo' \
  --enable-demuxer='id3v1,id3v2,matroska,matroska_audio,mpegts,mov,flac,wav,ogg,aac,avi,h264,hevc,rtsp,sdp,rtp,rtmp,hls,dash,mjpeg,image2,concat,rawvideo' \
  --enable-muxer='yuv4mpegpipe,adts,matroska,matroska_audio,mp4,mov,avi,flac,wav,opus,ogg,rtp,rtmp,rtsp,hls,dash,mpegts,image2,rawvideo,null,webm_dash_manifest' \
  --enable-parser='dca,ac3,eac3,h264,hevc,mjpeg,mpegvideo,mpeg4video,mpegaudio,aac,opus,flac,vorbis,h263' \
  --enable-indev='v4l2,alsa,jack,kmsgrab,v4l2_m2m,pipe,lavfi' \
  --enable-outdev='v4l2,alsa,jack,drm,kmsgrab,pipe,v4l2_m2m' \
  --enable-xlib \
  --disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages \
  --disable-sdl2 --disable-sndio --disable-indev=pulse --disable-outdev=pulse,xv \
  --disable-amf --disable-vdpau --disable-vaapi --disable-cuda-llvm --disable-ffnvcodec --disable-cuvid --disable-nvenc --disable-nvdec --disable-libnpp --disable-cuda --disable-cuda-nvcc --disable-omx --disable-omx-rpi --disable-mmal

make -j2
sudo make install

# Strippen für minimale Dateigröße
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavcode*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavdevic*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavfilte*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavforma*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavutil*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libpostpro*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libswresampl*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libswscale*

echo "Fertig! Installierte Größe:"
ls -l /usr/lib/arm-linux-gnueabihf/libav* /usr/lib/arm-linux-gnueabihf/libsw* /usr/lib/arm-linux-gnueabihf/libpostproc* | awk '{sum += $5} END {print sum / 1024 / 1024 " MB"}'
EOF

chmod +x bin/build-ffmpeg-final-rpi-3.sh
