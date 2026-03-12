cat << 'EOF' > bin/build-ffmpeg-goldmond.sh
#!/bin/bash

# 3. FFmpeg Konfiguration
PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH" \
./configure --prefix=/usr \
--libdir=/usr/lib/x86_64-linux-gnu \
--incdir=/usr/include/x86_64-linux-gnu \
--extra-version="ultra-goldmont-8.0.1-FINAL-C-FIXED" \
--arch=x86_64 \
--cpu=goldmont \
--extra-cflags='-march=goldmont -mtune=goldmont -O3 -pipe -fPIC -ffunction-sections -fdata-sections -fno-semantic-interposition -I/usr/include/vulkan' \
--extra-cxxflags='-march=goldmont -mtune=goldmont -O3 -pipe -fPIC -ffunction-sections -fdata-sections' \
--extra-ldflags='-L/usr/lib/x86_64-linux-gnu -Wl,-O3 -Wl,-rpath,/usr/lib/x86_64-linux-gnu -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -Wl,--gc-sections' \
--extra-libs='-Wl,--start-group -lshaderc_combined -lglslang -lMachineIndependent -lGenericCodeGen -lSPIRV -lSPIRV-Tools-opt -lSPIRV-Tools -Wl,--end-group -lplacebo -lvulkan -lstdc++ -lm' \
--disable-all --enable-hwaccels --enable-vaapi \
--enable-ffmpeg --enable-ffplay --enable-sdl2 --enable-ffprobe --enable-avdevice --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale \
--enable-pthreads --enable-shared --disable-static --enable-gnutls --disable-debug --disable-doc --enable-libbluray --enable-libxml2 \
--enable-gpl --enable-version3 --enable-nonfree --enable-pic --enable-stripping --enable-lto \
--disable-cuda --disable-nvenc --disable-cuda-llvm --disable-nvdec --disable-cuvid --disable-libnpp --disable-ffnvcodec --disable-cuda-nvcc \
--enable-libplacebo --enable-libshaderc --enable-vulkan --enable-opengl --enable-libdrm \
--enable-libdvdnav --enable-libdvdread \
--enable-hwaccel='av1_vaapi,h263_vaapi,h264_vaapi,hevc_vaapi,mjpeg_vaapi,mpeg2_vaapi,mpeg4_vaapi,vvc_vaapi,vc1_vaapi,vp8_vaapi,vp9_vaapi,wmv3_vaapi,h264_vulkan,hevc_vulkan,prores_vulkan,vp9_vulkan,ffv1_vulkan,av1_vulkan,prores_raw_vulkan' \
--enable-gnutls --enable-gmp --enable-gcrypt --enable-network \
--enable-libvpx --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libvorbis \
--enable-libfreetype --enable-libharfbuzz --enable-libfribidi  \
--enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa --enable-alsa --enable-libjack \
--enable-libx264 --enable-libx265 --enable-xlib --disable-libpulse \
--enable-indev='v4l2,alsa,jack,lavfi,fbdev,xcbgrab,kmsgrab' \
--enable-outdev='sdl2,v4l2,alsa,fbdev,opengl' \
--enable-protocol='fd,async,bluray,cache,concat,crypto,data,ffrtmpcrypt,file,ftp,hls,http,https,httpproxy,icecast,md5,pipe,rtmp,rtmpe,rtmps,rtmpt,rtmpte,rtp,srtp,subfile,tcp,tls,udp,udplite,unix' \
--enable-demuxer='aac,ac3,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,aiff,asf,avi,dash,dts,dtshd,eac3,flac,flv,h264,hevc,hls,image2,matroska,mjpeg,mov,mp3,mpegps,mpegts,mpegvideo,null,ogg,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,rawvideo,rm,rtp,rtsp,srt,truehd,vobsub,wav,webm_dash_manifest,dvdnav,dvdread' \
--enable-muxer='aac,ac3,adts,av1,avi,dash,eac3,flac,flv,h264,hevc,hls,image2,matroska,mjpeg,mov,mp3,mp4,mpegts,null,ogg,opus,rtmp,rtp,rtp,rtsp,wav' \
--enable-decoder='prores,wrapped_avframe,libx264,h264,hevc,h264_vulkan,hevc_vulkan,vp9,av1,mjpeg,mpeg1video,mpeg2video,mpeg4,aac,mp3,flac,vorbis,opus,pcm_s16le,pcm_s16be,pcm_s24le,pcm_s24be,pcm_s32le,pcm_s32be,pcm_f32le,pcm_f32be,pcm_s64le,pcm_s64be,pcm_f64le,pcm_f64be,pcm_u8,pcm_alaw,pcm_mulaw,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,adpcm_swf,ass,srt,dvdsub,dvbsub' \
--enable-encoder='prores,prores_aw,prores_ks,h264_vulkan,huffyuv,hevc_vulkan,ffv1_vulkan,prores_ks_vulkan,av1_vulkan,libx264,h264_vaapi,hevc_vaapi,vp9_vaapi,av1_vaapi,mjpeg_vaapi,mpeg2_vaapi,libx265,libfdk_aac,libmp3lame,libopus,libvorbis,ac3,eac3,flac,vorbis,pcm_s16le,pcm_s16be,pcm_s24le,pcm_s24be,pcm_s32le,pcm_s32be,pcm_f32le,pcm_f32be,pcm_s64le,pcm_s64be,pcm_f64le,pcm_f64be,pcm_u8,pcm_alaw,pcm_mulaw,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,ass,srt' \
--enable-filter='realtime,latency,vpp_vaapi,scale_vaapi,procamp_vaapi,sharpness_vaapi,transpose_vaapi,denoise_vaapi,tonemap_vaapi,framerates_vaapi,format_vaapi,hwmap,hwdownload,hwupload,scale_vulkan,adelay,aecho,afifo,amix,anull,aresample,aformat,asetpts,asplit,colorspace,crystalizer,bass,crop,drawtext,equalizer,firequalizer,format,fps,ladspa,lv2,rubberband,libplacebo,loudnorm,null,nullsrc,overlay,palettegen,paletteuse,pan,scale,setpts,transpose,volume,drawbox_vaapi,hstack_vaapi,vstack_vaapi' \
--enable-parser='aac,flac,h263,h264,hevc,mjpeg,mp3,mpegaudio,mpegvideo,mpeg4video,opus,vorbis,ac3,dca,dvdsub,dvd_nav' \
--enable-bsf='aac_adtstoasc,av1_metadata,extract_extradata,h264_metadata,h264_mp4toannexb,hevc_metadata,hevc_mp4toannexb,mjpeg2jpeg,mpeg4_unpack_bframes,null,opus_metadata,pcm_rechunk,vp9_metadata,vp9_superframe' \
--enable-asm --enable-x86asm --enable-inline-asm --enable-runtime-cpudetect --disable-indev=pulse --disable-outdev='pulse' \
--disable-avx --disable-avx2 --disable-avx512 --disable-fma3 --disable-fma4 --disable-xop 


if [ $? -eq 0 ]; then
    make -j$(nproc)
    sudo make install
    
sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libavcode*
sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libavdevic*
sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libavfilte*
sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libavforma*
sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libavutil*
sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libpostpro*
sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libswresampl*
sudo strip --strip-unneeded /usr/lib/x86_64-linux-gnu/libswscale*
ls -l /usr/lib/x86_64-linux-gnu/libav* /usr/lib/x86_64-linux-gnu/libsw* /usr/lib/x86_64-linux-gnu/libpostproc* | awk '{sum += $5} END {print sum / 1024 / 1024 " MB"}'

   
    sudo ldconfig
    echo "Build & Stripping erfolgreich abgeschlossen!"
else
    echo "Fehler während der Konfiguration!"
    exit 1
fi
EOF

chmod +x ~/bin/build-ffmpeg-goldmond.sh





export CFLAGS="-march=goldmont -mtune=goldmont -O3 -pipe -fno-semantic-interposition"
export LDFLAGS="-Wl,-O3 -Wl,--as-needed -Wl,--gc-sections"
meson setup build \
--prefix=/usr \
--libdir=/usr/lib/x86_64-linux-gnu \
-Dbuildtype=release \
-Doptimization=3 \
-Dlibmpv=true \
-Dvaapi=enabled \
-Dvulkan=enabled \
-Dshaderc=disabled \
-Dplacebo=enabled \
-Dcuda-interop=enabled \
-Dpipewire=enabled
meson compile -C build
sudo meson install -C build






