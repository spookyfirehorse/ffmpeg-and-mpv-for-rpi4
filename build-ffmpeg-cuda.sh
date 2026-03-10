cat << 'EOF' > bin/build-ffmpeg-skylake.sh
#!/bin/bash
# FFmpeg Build-Skript für Skylake (NVENC, VAAPI, Vulkan)

# 1. System-Abhängigkeiten installieren
sudo apt update && sudo apt install -y libnpth0-dev
# Optional: sudo apt build-dep ffmpeg (benötigt deb-src in sources.list)

# Vor den Symlinks prüfen, ob die NVIDIA-Treiber überhaupt installiert sind
if [ ! -f /usr/lib/x86_64-linux-gnu/libcuda.so.1 ]; then
    echo "FEHLER: NVIDIA-Treiber (libcuda.so.1) nicht gefunden!"
    echo "Bitte installiere die NVIDIA-Treiber (z.B. nvidia-driver-535) zuerst."
    exit 1
fi

# 2. NVIDIA Symlinks sicherstellen (VOR dem Build für configure)
sudo ln -sf /usr/lib/x86_64-linux-gnu/libcuda.so.1 /usr/lib/x86_64-linux-gnu/libcuda.so
sudo ln -sf /usr/lib/x86_64-linux-gnu/libnvidia-encode.so.1 /usr/lib/x86_64-linux-gnu/libnvidia-encode.so
sudo ln -sf /usr/lib/x86_64-linux-gnu/libnvcuvid.so.1 /usr/lib/x86_64-linux-gnu/libnvcuvid.so

# Verzeichnisse definieren
LIB_DIR="/usr/lib/x86_64-linux-gnu"

# 3. FFmpeg Konfiguration
PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH" \
./configure --prefix=/usr \
--libdir=/usr/lib/x86_64-linux-gnu \
--incdir=/usr/include/x86_64-linux-gnu \
--extra-version="ultra-skylake-universal-C-support" \
--arch=x86_64 \
--cpu=skylake \
--extra-cflags='-march=skylake -O3 -pipe -fPIC -ffunction-sections -fdata-sections -fno-semantic-interposition -I/usr/include/vulkan' \
--extra-cxxflags='-march=skylake -O3 -pipe -fPIC -ffunction-sections -fdata-sections' \
--extra-ldflags='-L/usr/lib/x86_64-linux-gnu -Wl,-O3 -Wl,-rpath,/usr/lib/x86_64-linux-gnu -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -Wl,--gc-sections' \
--extra-libs='-lpthread -lm -lrt -ldl' \
--nvcc=/usr/bin/nvcc \
--disable-everything --disable-hwaccels \
--enable-ffmpeg --enable-ffprobe --enable-avdevice --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale \
--enable-pthreads --enable-shared --disable-static --disable-debug --disable-doc --enable-libbluray --enable-libxml2 \
--enable-gpl --enable-version3 --enable-nonfree --enable-pic --enable-stripping --enable-lto \
--enable-cuda-nvcc --enable-libnpp --enable-ffnvcodec --enable-nvenc --enable-nvdec \
--enable-vaapi --enable-vulkan --enable-libplacebo --enable-libshaderc --enable-opengl --enable-libdrm --enable-libjack --disable-vdpau \
--enable-libdvdnav --enable-libdvdread \
--enable-hwaccel='h264_nvdec,hevc_nvdec,vp9_nvdec,av1_nvdec,mjpeg_nvdec,mpeg1_nvdec,mpeg2_nvdec,mpeg4_nvdec,vc1_nvdec,h264_vaapi,hevc_vaapi,h264_vulkan,hevc_vulkan,av1_vulkan' \
--enable-gnutls --enable-gmp --enable-gcrypt --enable-network \
--enable-libvpx --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libvorbis \
--enable-libfreetype --enable-libharfbuzz --enable-libfribidi --enable-hardcoded-tables \
--enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa --enable-alsa --enable-libjack \
--enable-libx264 --enable-libx265 --enable-xlib --disable-sdl2 --disable-libpulse \
--enable-indev='v4l2,alsa,jack,lavfi,fbdev,xcbgrab,kmsgrab' \
--enable-outdev='v4l2,alsa,fbdev' \
--enable-protocol='async,bluray,cache,concat,crypto,data,ffrtmpcrypt,file,ftp,hls,http,https,httpproxy,icecast,md5,pipe,rtmp,rtmpe,rtmps,rtmpt,rtmpte,rtp,srtp,subfile,tcp,tls,udp,udplite,unix' \
--enable-demuxer='aac,ac3,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,aiff,asf,avi,dash,dts,dtshd,eac3,flac,flv,h264,hevc,hls,image2,matroska,mjpeg,mov,mp3,mpegps,mpegts,mpegvideo,null,ogg,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,rawvideo,rm,rtp,rtsp,srt,truehd,vobsub,wav,webm_dash_manifest,dvdnav,dvdread' \
--enable-muxer='aac,ac3,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,adts,av1,avi,dash,eac3,flac,flv,h264,hevc,hls,image2,matroska,mjpeg,mkv,mov,mp3,mp4,mpegts,null,ogg,opus,rtmp,rtp,rtsp,wav,dvdsub' \
--enable-decoder='h264,hevc,vp9,av1,mjpeg,mpeg1video,mpeg2video,mpeg4,h264_cuvid,hevc_cuvid,vp9_cuvid,av1_cuvid,mjpeg_cuvid,mpeg2_cuvid,mpeg4_cuvid,aac,mp3,flac,vorbis,opus,pcm_s16le,pcm_s16be,pcm_s24le,pcm_s24be,pcm_s32le,pcm_s32be,pcm_f32le,pcm_f32be,pcm_s64le,pcm_s64be,pcm_f64le,pcm_f64be,pcm_u8,pcm_alaw,pcm_mulaw,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,adpcm_swf,ass,srt,dvdsub,dvbsub,mov_text' \
--enable-encoder='h264_nvenc,hevc_nvenc,av1_nvenc,h264_vaapi,hevc_vaapi,libfdk_aac,libmp3lame,libopus,libvorbis,libx264,libx265,ac3,eac3,flac,vorbis,pcm_s16le,pcm_s16be,pcm_s24le,pcm_s24be,pcm_s32le,pcm_s32be,pcm_f32le,pcm_f32be,pcm_s64le,pcm_s64be,pcm_f64le,pcm_f64be,pcm_u8,pcm_alaw,pcm_mulaw,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,ass,srt,dvdsub,mov_text' \
--enable-filter='adelay,aecho,afifo,amix,anull,aresample,aformat,asetpts,asplit,colorspace,crystalizer,crop,drawtext,equalizer,firequalizer,format,format_cuda,fps,hwdownload,hwdownload_cuda,hwdownload_vaapi,hwmap,hwupload,hwupload_cuda,hwupload_vaapi,ladspa,libplacebo,loudnorm,lv2,null,nullsrc,overlay,palettegen,paletteuse,pan,rubberband,scale,scale_cuda,scale_npp,setpts,transpose,volume,yadif_cuda' \
--enable-parser='h264,hevc,vp9,av1,mjpeg,mpegvideo,mpeg4video,aac,mp3,flac,opus,vorbis,ac3,dca,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,dvdsub,dvd_pel' \
--enable-bsf='aac_adtstoasc,av1_metadata,extract_extradata,h264_metadata,h264_mp4toannexb,hevc_metadata,hevc_mp4toannexb,mjpeg2jpeg,mpeg4_unpack_bframes,null,opus_metadata,pcm_rechunk,vp9_metadata,vp9_superframe' \
--enable-asm --enable-x86asm --enable-inline-asm --enable-runtime-cpudetect --disable-indev=pulse --disable-outdev='pulse,xv' \
&& make -j$(nproc) && sudo make install && sudo ldconfig


if [ $? -eq 0 ]; then
    make -j$(nproc)
    sudo make install
    
    # 4. Stripping
    echo "Stripping binaries and libraries..."
    sudo strip --strip-unneeded /usr/bin/ffmpeg /usr/bin/ffprobe
    sudo strip --strip-unneeded $LIB_DIR/libavcodec.so* $LIB_DIR/libavdevice.so* $LIB_DIR/libavfilter.so* \
                                $LIB_DIR/libavformat.so* $LIB_DIR/libavutil.so* $LIB_DIR/libswresample.so* \
                                $LIB_DIR/libswscale.so*
    
    # 5. NVIDIA Symlinks final sicherstellen
    sudo ln -sf $LIB_DIR/libcuda.so.1 $LIB_DIR/libcuda.so
    sudo ln -sf $LIB_DIR/libnvidia-encode.so.1 $LIB_DIR/libnvidia-encode.so
    sudo ln -sf $LIB_DIR/libnvcuvid.so.1 $LIB_DIR/libnvcuvid.so

    sudo ldconfig
    echo "Build & Stripping erfolgreich abgeschlossen!"
else
    echo "Fehler während der Konfiguration!"
    exit 1
fi
EOF

chmod +x bin/build-ffmpeg-skylake.sh
