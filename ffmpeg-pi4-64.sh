1. Raspberry Pi 3 (32-Bit / armhf)
Optimiert für Cortex-A53, Fokus auf Hardware-H.264 und WebP-Bilder.
bash
./configure \
  --prefix=/usr \
  --extra-version=ultra-2026-pi3-final \
  --libdir=/usr/lib/arm-linux-gnueabihf \
  --incdir=/usr/include/arm-linux-gnueabihf \
  --arch=arm \
  --cpu=cortex-a53 \
  --extra-cflags="-mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -O2 -pipe -ftree-vectorize" \
  --extra-ldflags="-latomic -Wl,-O1,--as-needed" \
  --extra-libs="-ludev -lstdc++" \
  --disable-all \
  --enable-gpl --enable-version3 --enable-nonfree --enable-shared \
  --enable-pthreads --enable-neon --enable-armv8 --enable-inline-asm \
  --enable-libx264 --enable-libx265 --enable-libmp3lame --enable-libopus --enable-libfdk-aac --enable-libwebp \
  --enable-avcodec --enable-avformat --enable-avfilter --enable-avdevice \
  --enable-swresample --enable-swscale --enable-libdrm --enable-v4l2-m2m \
  --enable-vulkan --enable-libplacebo --enable-gnutls --enable-network \
  --enable-libpulse --enable-libudev --enable-libssh \
  --enable-protocol='file,http,https,tcp,udp,rtp,rtsp,rtmp,tls,pipe' \
  --enable-encoder='libx264,libx265,libmp3lame,libopus,libfdk_aac,libwebp,h264_v4l2m2m' \
  --enable-decoder='h264,h264_v4l2m2m,hevc,hevc_v4l2m2m,mpeg2video,mpeg2_v4l2m2m,vp9,av1,aac,mp3,opus,webp' \
  --enable-muxer='mp4,mov,matroska,mp3,h264,hevc,rtsp,webp,image2' \
  --enable-demuxer='mov,matroska,mp3,rtsp,h264,hevc,mpegvideo,webp,image2' \
  --enable-parser='h264,hevc,mpeg2video,vp9,av1,aac,mpegaudio' \
  --enable-bsfs \
  --enable-filter='scale,copy,format,aresample,fps,crystalizer,bass,scaletempo,volume,libplacebo' \
  --enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa \
  --enable-ffmpeg --enable-ffprobe --enable-indevs --enable-indev='pulse,v4l2,kmsgrab,alsa' \
  --enable-outdevs --enable-outdev='pulse,v4l2,alsa' && \
make -j$(nproc)
Verwende Code mit Vorsicht.

2. Raspberry Pi 4 (64-Bit / aarch64)
Optimiert für Cortex-A72, inklusive SVT-AV1 und Hardware-HEVC-Encoder.
bash
./configure \
  --prefix=/usr \
  --extra-version=ultra-2026-pi4-final \
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
  --enable-libx264 --enable-libx265 --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libsvtav1 --enable-libwebp \
  --enable-avcodec --enable-avformat --enable-avfilter --enable-avdevice \
  --enable-swresample --enable-swscale --enable-libdrm --enable-v4l2-m2m \
  --enable-vulkan --enable-libplacebo --enable-libglslang --enable-gnutls --enable-network \
  --enable-libpulse --enable-libudev --enable-libssh \
  --enable-protocol='file,http,https,tcp,udp,rtp,rtsp,rtmp,tls,pipe' \
  --enable-encoder='libx264,libx265,libfdk_aac,libmp3lame,libopus,libsvtav1,libwebp,h264_v4l2m2m,hevc_v4l2m2m' \
  --enable-decoder='h264,h264_v4l2m2m,hevc,hevc_v4l2m2m,mpeg2video,mpeg2_v4l2m2m,vp9,av1,aac,mp3,opus,webp' \
  --enable-muxer='mp4,mov,matroska,mp3,h264,hevc,rtsp,webp,image2' \
  --enable-demuxer='mov,matroska,mp3,rtsp,h264,hevc,mpegvideo,webp,image2' \
  --enable-parser='h264,hevc,mpeg2video,vp9,av1,aac,mpegaudio' \
  --enable-bsfs \
  --enable-filter='scale,copy,format,aresample,fps,crystalizer,bass,scaletempo,volume,libplacebo' \
  --enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa \
  --enable-ffmpeg --enable-ffprobe --enable-indevs --enable-indev='pulse,v4l2,kmsgrab,alsa' \
  --enable-outdevs --enable-outdev='pulse,v4l2,alsa' && \
make -j$(nproc)
Verwende Code mit Vorsicht.

3. Raspberry Pi 5 (64-Bit / aarch64)
Maximale Power mit Cortex-A76 und AV1-Encoding-Optimierung.
bash
./configure \
  --prefix=/usr \
  --extra-version=ultra-2026-pi5-final \
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
  --enable-libx264 --enable-libx265 --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libsvtav1 --enable-libwebp \
  --enable-avcodec --enable-avformat --enable-avfilter --enable-avdevice \
  --enable-swresample --enable-swscale --enable-libdrm --enable-v4l2-m2m \
  --enable-vulkan --enable-libplacebo --enable-libglslang --enable-gnutls --enable-network \
  --enable-libpulse --enable-libudev --enable-libssh \
  --enable-protocol='file,http,https,tcp,udp,rtp,rtsp,rtmp,tls,pipe' \
  --enable-encoder='libx264,libx265,libfdk_aac,libmp3lame,libopus,libsvtav1,libwebp,h264_v4l2m2m' \
  --enable-decoder='h264,h264_v4l2m2m,hevc,hevc_v4l2m2m,mpeg2video,mpeg2_v4l2m2m,vp9,av1,aac,mp3,opus,webp' \
  --enable-muxer='mp4,mov,matroska,mp3,h264,hevc,rtsp,webp,image2' \
  --enable-demuxer='mov,matroska,mp3,rtsp,h264,hevc,mpegvideo,webp,image2' \
  --enable-parser='h264,hevc,mpeg2video,vp9,av1,aac,mpegaudio' \
  --enable-bsfs \
  --enable-filter='scale,copy,format,aresample,fps,crystalizer,bass,scaletempo,volume,libplacebo' \
  --enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa \
  --enable-ffmpeg --enable-ffprobe --enable-indevs --enable-indev='pulse,v4l2,kmsgrab,alsa' \
  --enable-outdevs --enable-outdev='pulse,v4l2,alsa' && \
make -j$(nproc)
Verwende Code mit Vorsicht.

Soll ich dir zeigen, wie du die neue AV1-Kompression auf dem Pi 5 nutzt, um Speicherplatz zu sparen?
KI-Antworten können Fehler enthalten. Weitere Informationen



