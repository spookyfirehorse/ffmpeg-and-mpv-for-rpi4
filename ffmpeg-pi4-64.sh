1. Raspberry Pi 3 (32-Bit / armhf)
Optimiert für Cortex-A53, Pfade für 32-Bit Userland.
bash
./configure \
  --prefix=/usr \
  --extra-version=debian-pi3-ultra-2026 \
  --libdir=/usr/lib/arm-linux-gnueabihf \
  --incdir=/usr/include/arm-linux-gnueabihf \
  --arch=arm \
  --cpu=cortex-a53 \
  --extra-cflags="-mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -O2 -pipe" \
  --extra-ldflags="-latomic -Wl,-O1,--as-needed" \
  --extra-libs="-ludev -lstdc++" \
  --disable-all \
  --enable-gpl --enable-version3 --enable-nonfree --enable-shared \
  --enable-pthreads --enable-neon --enable-armv8 --enable-inline-asm \
  --enable-libx264 --enable-libx265 --enable-libmp3lame --enable-libopus --enable-libfdk-aac \
  --enable-avcodec --enable-avformat --enable-avfilter --enable-avdevice \
  --enable-swresample --enable-swscale --enable-libdrm --enable-v4l2-m2m \
  --enable-vulkan --enable-libplacebo --enable-libshaderc --enable-gnutls --enable-network \
  --enable-libpulse --enable-libudev --enable-libssh \
  --enable-protocol='file,http,https,tcp,udp,rtp,rtsp,rtmp,tls' \
  --enable-encoder='libx264,libx265,libmp3lame,libopus,libfdk_aac,h264_v4l2m2m' \
  --enable-decoder='h264,h264_v4l2m2m,hevc,hevc_v4l2m2m,mpeg2video,mpeg2_v4l2m2m,vp9,av1,aac,mp3,opus' \
  --enable-muxer='mp4,mov,matroska,mp3,h264,rtsp' \
  --enable-demuxer='mov,matroska,mp3,rtsp,h264,hevc,mpegvideo' \
  --enable-parser='h264,hevc,mpeg2video,vp9,av1,aac,mpegaudio' \
  --enable-bsfs \
  --enable-filter='scale,copy,format,aresample,fps,crystalizer,bass,scaletempo,volume,libplacebo' \
  --enable-ffmpeg --enable-ffprobe --enable-ladspa --enable-lv2 --enable-librubberband \
  --enable-libsoxr --enable-libbs2b --enable-libmysofa \
  --enable-indevs --enable-indev='pulse,v4l2,kmsgrab,alsa' \
  --enable-outdevs --enable-outdev='pulse,v4l2,alsa' && \
make -j$(nproc)
Verwende Code mit Vorsicht.

2. Raspberry Pi 4 (64-Bit / aarch64)
Optimiert für Cortex-A72 (Kali/Debian).
bash
./configure \
  --prefix=/usr \
  --extra-version=debian-pi4-ultra-2026 \
  --libdir=/usr/lib/aarch64-linux-gnu \
  --incdir=/usr/include/aarch64-linux-gnu \
  --arch=aarch64 \
  --cpu=cortex-a72 \
  --extra-cflags='-mcpu=cortex-a72 -O2 -pipe -ftree-vectorize' \
  --extra-ldflags='-latomic -Wl,-O1,--as-needed' \
  --extra-libs='-ludev -lstdc++' \
  --disable-all \
  --enable-gpl --enable-version3 --enable-nonfree --enable-shared \
  --enable-pthreads --enable-neon --enable-armv8 --enable-inline-asm \
  --enable-libx264 --enable-libx265 --enable-libfdk-aac --enable-libmp3lame --enable-libopus \
  --enable-avcodec --enable-avformat --enable-avfilter --enable-avdevice \
  --enable-swresample --enable-swscale --enable-libdrm --enable-v4l2-m2m \
  --enable-vulkan --enable-libplacebo --enable-gnutls --enable-network \
  --enable-libpulse --enable-libudev --enable-libssh \
  --enable-protocol='file,http,https,tcp,udp,rtp,rtsp,rtmp,tls' \
  --enable-encoder='libx264,libx265,libfdk_aac,libmp3lame,libopus,h264_v4l2m2m,hevc_v4l2m2m' \
  --enable-decoder='h264,h264_v4l2m2m,hevc,hevc_v4l2m2m,mpeg2video,mpeg2_v4l2m2m,vp9,av1,aac,mp3,opus' \
  --enable-muxer='mp4,mov,matroska,mp3,h264,rtsp' \
  --enable-demuxer='mov,matroska,mp3,rtsp,h264,hevc,mpegvideo' \
  --enable-parser='h264,hevc,mpeg2video,vp9,av1,aac,mpegaudio' \
  --enable-bsfs \
  --enable-filter='scale,copy,format,aresample,fps,crystalizer,bass,scaletempo,volume,libplacebo' \
  --enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa \
  --enable-ffmpeg --enable-ffprobe --enable-indevs --enable-indev='pulse,v4l2,kmsgrab,alsa' \
  --enable-outdevs --enable-outdev='pulse,v4l2,alsa' && \
make -j$(nproc)
Verwende Code mit Vorsicht.

3. Raspberry Pi 5 (64-Bit / aarch64)
Maximale Power für Cortex-A76.
bash
./configure \
  --prefix=/usr \
  --extra-version=debian-pi5-ultra-2026 \
  --libdir=/usr/lib/aarch64-linux-gnu \
  --incdir=/usr/include/aarch64-linux-gnu \
  --arch=aarch64 \
  --cpu=cortex-a76 \
  --extra-cflags='-mcpu=cortex-a76 -O3 -pipe -ftree-vectorize' \
  --extra-ldflags='-latomic -Wl,-O1,--as-needed' \
  --extra-libs='-ludev -lstdc++' \
  --disable-all \
  --enable-gpl --enable-version3 --enable-nonfree --enable-shared \
  --enable-pthreads --enable-neon --enable-armv8 --enable-inline-asm \
  --enable-libx264 --enable-libx265 --enable-libfdk-aac --enable-libmp3lame --enable-libopus \
  --enable-avcodec --enable-avformat --enable-avfilter --enable-avdevice \
  --enable-swresample --enable-swscale --enable-libdrm --enable-v4l2-m2m \
  --enable-vulkan --enable-libplacebo --enable-gnutls --enable-network \
  --enable-libpulse --enable-libudev --enable-libssh \
  --enable-protocol='file,http,https,tcp,udp,rtp,rtsp,rtmp,tls' \
  --enable-encoder='libx264,libx265,libfdk_aac,libmp3lame,libopus,h264_v4l2m2m' \
  --enable-decoder='h264,h264_v4l2m2m,hevc,hevc_v4l2m2m,mpeg2video,mpeg2_v4l2m2m,vp9,av1,aac,mp3,opus' \
  --enable-muxer='mp4,mov,matroska,mp3,h264,rtsp' \
  --enable-demuxer='mov,matroska,mp3,rtsp,h264,hevc,mpegvideo' \
  --enable-parser='h264,hevc,mpeg2video,vp9,av1,aac,mpegaudio' \
  --enable-bsfs \
  --enable-filter='scale,copy,format,aresample,fps,crystalizer,bass,scaletempo,volume,libplacebo' \
  --enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa \
  --enable-ffmpeg --enable-ffprobe --enable-indevs --enable-indev='pulse,v4l2,kmsgrab,alsa' \
  --enable-outdevs --enable-outdev='pulse,v4l2,alsa' && \
make -j$(nproc)
