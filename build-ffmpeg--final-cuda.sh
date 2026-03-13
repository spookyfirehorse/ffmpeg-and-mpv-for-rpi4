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
--disable-everything \
--enable-ffmpeg --enable-ffplay --enable-ffprobe --enable-avdevice --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale \
--enable-pthreads --enable-shared --disable-static --enable-sdl2 --enable-gnutls --disable-debug --disable-doc --enable-libbluray --enable-libxml2 \
--enable-gpl --enable-nonfree --enable-pic --enable-stripping --enable-lto \
--enable-cuda-llvm --enable-nvenc --enable-nvdec --enable-cuvid --enable-libnpp --enable-ffnvcodec --enable-cuda-nvcc \
--enable-vulkan --enable-libplacebo --enable-libshaderc --enable-opengl --enable-libdrm --enable-libjack --disable-vdpau --disable-vaapi \
--enable-libdvdnav --enable-libdvdread --enable-xlib \
--enable-avx --enable-avx2 --enable-version3 \
--enable-hwaccels  \
--enable-hwaccel='av1_vulkan,ffv1_vulkan,h264_vulkan,hevc_vulkan,prores_raw_vulkan,vp9_vulkan,av1_nvdec,h264_nvdec,hevc_nvdec,mjpeg_nvdec,mpeg1_nvdec,mpeg2_nvdec,mpeg4_nvdec,vc1_nvdec,vp8_nvdec,vp9_nvdec,wmv3_nvdec' \
--enable-gnutls --enable-gmp --enable-gcrypt --enable-network \
--enable-libvpx --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libvorbis \
--enable-libfreetype --enable-libharfbuzz --enable-libfribidi --enable-hardcoded-tables \
--enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa --enable-alsa --enable-libjack \
--enable-libx264 --enable-libx265 --disable-libpulse \
--enable-indev='v4l2,alsa,jack,lavfi,fbdev,xcbgrab,kmsgrab,xv' \
--enable-outdev='sdl2,v4l2,alsa,fbdev' \
--enable-protocol='async,bluray,cache,concat,crypto,data,ffrtmpcrypt,file,ftp,hls,http,https,httpproxy,icecast,md5,pipe,rtmp,rtmpe,rtmps,rtmpt,rtmpte,rtp,srtp,subfile,tcp,tls,udp,udplite,unix' \
--enable-demuxer='aac,ac3,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,aiff,asf,avi,dash,dts,dtshd,eac3,flac,flv,h264,hevc,hls,image2,matroska,mjpeg,mov,mp3,mpegps,mpegts,mpegvideo,null,ogg,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,rawvideo,rm,rtp,rtsp,srt,truehd,vobsub,wav,webm_dash_manifest,dvdnav,dvdread' \
--enable-muxer='aac,ac3,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,adts,av1,avi,dash,eac3,flac,flv,h264,hevc,hls,image2,matroska,mjpeg,mkv,mov,mp3,mp4,mpegts,null,ogg,opus,rtmp,rtp,rtsp,wav,dvdsub' \
--enable-decoder='wrapped_avframe,prores,prores_raw,h264_vulkan,hevc_vulkan,vp9,h264_nvenc,hevc_nvenc,av1_nvenc,h264_cuvid,hevc_cuvid,mjpeg_cuvid,mpeg1_cuvid,mpeg2_cuvid,mpeg4_cuvid,vc1_cuvid,vp8_cuvid,vp9_cuvid,av1_cuvid,libfdk_aac,mpeg1video,mpeg2video,mpeg4,aac,mp3,flac,vorbis,opus,pcm_s16le,pcm_s16be,pcm_s24le,pcm_s24be,pcm_s32le,pcm_s32be,pcm_f32le,pcm_f32be,pcm_s64le,pcm_s64be,pcm_f64le,pcm_f64be,pcm_u8,pcm_alaw,pcm_mulaw,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,adpcm_swf,ass,srt,dvdsub,dvbsub,mov_text' \
--enable-encoder='prores,prores_ks,h264_vulkan,huffyuv,hevc_vulkan,ffv1_vulkan,prores_ks_vulkan,av1_vulkan,av1_nvenc,h264_nvenc,hevc_nvenc,libfdk_aac,libmp3lame,libopus,libvorbis,ac3,eac3,flac,vorbis,pcm_s16le,pcm_s16be,pcm_s24le,pcm_s24be,pcm_s32le,pcm_s32be,pcm_f32le,pcm_f32be,pcm_s64le,pcm_s64be,pcm_f64le,pcm_f64be,pcm_u8,pcm_alaw,pcm_mulaw,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,ass,srt,dvdsub,mov_text' \
--enable-filter='buffer,buffersink,abuffer,abuffersink,hwdownload,hwmap,hwupload,adelay,aecho,afifo,amix,anull,aresample,aformat,asetpts,asplit,colorspace,crystalizer,crop,drawtext,equalizer,firequalizer,format,scale_cuda,hwupload_cuda,bilateral_cuda,thumbnail_cuda,bwdif_cuda,chromakey_cuda,colorspace_cuda,overlay_cuda,pad_cuda,yadif_cuda,ladspa,libplacebo,loudnorm,lv2,null,nullsrc,overlay,palettegen,paletteuse,pan,rubberband,scale,scale_npp,setpts,transpose,volume' \
--enable-parser='h264,hevc,vp9,av1,mjpeg,mpegvideo,mpeg4video,aac,mp3,flac,opus,vorbis,ac3,dca,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,dvdsub,dvd_pel' \
--enable-bsf='av1_frame_merge,av1_frame_split,apv_metadata,av1_metadata,h264_metadata,hevc_metadata,mpeg2_metadata,opus_metadata,prores_metadata,vp9_metadata,vvc_metadata,aac_adtstoasc,h264_mp4toannexb,hevc_mp4toannexb,mjpeg2jpeg,mpeg4_unpack_bframes,null,pcm_rechunk,vp9_superframe' \
--enable-asm --enable-x86asm --enable-inline-asm --enable-runtime-cpudetect \


if [ $? -eq 0 ]; then
    make -j$(nproc)
    sudo make install
    
    # 4. Stripping
   sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libavcode*
   sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libavdevic*
   sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libavfilte*
   sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libavforma*
   sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libavutil*
   sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libpostpro*
   sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libswresampl*
   sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libswscale*
   
    # 5. NVIDIA Symlinks final sicherstellen
    sudo ln -sf $LIB_DIR/libcuda.so.1 $LIB_DIR/libcuda.so
    sudo ln -sf $LIB_DIR/libnvidia-encode.so.1 $LIB_DIR/libnvidia-encode.so
    sudo ln -sf $LIB_DIR/libnvcuvid.so.1 $LIB_DIR/libnvcuvid.so

    sudo ldconfig
    ls -l /usr/lib/x86_64-linux-gnu/libav* /usr/lib/x86_64-linux-gnu/libsw* /usr/lib/x86_64-linux-gnu/libpostproc* | awk '{sum += $5} END {print sum / 1024 / 1024 " MB"}'

    echo "Build & Stripping erfolgreich abgeschlossen!"
else
    echo "Fehler während der Konfiguration!"
    exit 1
fi
EOF

chmod +x bin/build-ffmpeg-skylake.sh




export CFLAGS="-march=skylake -mtune=skylake -O3 -pipe -fno-semantic-interposition"
export LDFLAGS="-Wl,-O3 -Wl,--as-needed -Wl,--gc-sections"

meson setup build \
  --prefix=/usr \
  --libdir=/usr/lib/x86_64-linux-gnu \
  -Dcuda-hwaccel=enabled \
  -Dcuda-interop=enabled \
  -Dwayland=enabled \
  -Db_lto=true \
  -Ddmabuf-wayland=enabled \
  -Dvulkan=enabled \
  -Dshaderc=disabled \
  -Ddrm=enabled \
  -Dgbm=enabled \
  -Degl-wayland=enabled \
  -Degl-drm=enabled \
  -Dgl=enabled \
  -Dalsa=enabled \
  -Dpipewire=enabled \
  -Dpulse=disabled \
  -Dx11=disabled \
  -Dvaapi=disabled \
  -Dvdpau=disabled \
  -Dvdpau-gl-x11=disabled \
  -Damf=disabled \
  -Dandroid-media-ndk=disabled \
  -Dmacos-11-features=disabled \
  -Dmacos-touchbar=disabled \
  -Dswift-build=disabled \
  -Dwin32-smtc=disabled \
  -Dd3d11=disabled \
  -Ddirect3d=disabled \
  -Dsdl2-video=disabled \
  -Dsdl2-audio=disabled \
  -Dopenal=disabled \
  -Dmanpage-build=disabled \
  -Dhtml-build=disabled \
  -Dlibmpv=true 

meson compile -C build
sudo meson install -C build


grep "ffplay_deps" ffbuild/config.log
