cat << 'EOF' > bin/build-ffmpeg-skylake.sh
#!/bin/bash

# 3. FFmpeg Konfiguration
PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH" \
./configure --prefix=/usr \
--libdir=/usr/lib/x86_64-linux-gnu \
--incdir=/usr/include/x86_64-linux-gnu \
--extra-version="ultra-goldmont-8.0.1-FINAL-C" \
--arch=x86_64 \
--cpu=goldmont \
--extra-cflags='-march=goldmont -mtune=goldmont -O3 -pipe -fPIC -ffunction-sections -fdata-sections -fno-semantic-interposition -I/usr/include/vulkan' \
--extra-cxxflags='-march=goldmont -mtune=goldmont -O3 -pipe -fPIC -ffunction-sections -fdata-sections' \
--extra-ldflags='-L/usr/lib/x86_64-linux-gnu -Wl,-O3 -Wl,-rpath,/usr/lib/x86_64-linux-gnu -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -Wl,--gc-sections' \
--extra-libs='-lpthread -lm -lrt -ldl' \
--disable-everything --disable-hwaccels \
--enable-ffmpeg --enable-ffprobe --enable-avdevice --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale \
--enable-pthreads --enable-shared --disable-static --disable-debug --disable-doc --enable-libbluray --enable-libxml2 \
--enable-gpl --enable-version3 --enable-nonfree --enable-pic --enable-stripping --enable-lto \
--disable-cuda --disable-nvenc --disable-nvdec --disable-cuvid --disable-vdpau --disable-libnpp --disable-ffnvcodec \
--enable-vaapi --enable-vulkan --enable-libplacebo --enable-libshaderc --enable-opengl --enable-libdrm \
--enable-libdvdnav --enable-libdvdread \
--enable-hwaccel='h264_vaapi,hevc_vaapi,vp9_vaapi,av1_vaapi,mjpeg_vaapi,mpeg2_vaapi,vc1_vaapi,vp8_vaapi,h263_vaapi,mpeg4_vaapi,h264_vulkan,hevc_vulkan,av1_vulkan'\
--enable-gnutls --enable-gmp --enable-gcrypt --enable-network \
--enable-libvpx --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libvorbis \
--enable-libfreetype --enable-libharfbuzz --enable-libfribidi --enable-hardcoded-tables \
--enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa --enable-alsa --enable-libjack \
--enable-libx264 --enable-libx265 --enable-xlib --disable-sdl2 --disable-libpulse \
--enable-indev='v4l2,alsa,jack,lavfi,fbdev,xcbgrab,kmsgrab' \
--enable-outdev='v4l2,alsa,fbdev,opengl' \
--enable-protocol='async,bluray,cache,concat,crypto,data,ffrtmpcrypt,file,ftp,hls,http,https,httpproxy,icecast,md5,pipe,rtmp,rtmpe,rtmps,rtmpt,rtmpte,rtp,srtp,subfile,tcp,tls,udp,udplite,unix' \
--enable-demuxer='aac,ac3,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,aiff,asf,avi,dash,dts,dtshd,eac3,flac,flv,h264,hevc,hls,image2,matroska,mjpeg,mov,mp3,mpegps,mpegts,mpegvideo,null,ogg,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,rawvideo,rm,rtp,rtsp,srt,truehd,vobsub,wav,webm_dash_manifest,dvdnav,dvdread' \
--enable-muxer='aac,ac3,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,adts,av1,avi,dash,eac3,flac,flv,h264,hevc,hls,image2,matroska,mjpeg,mkv,mov,mp3,mp4,mpegts,null,ogg,opus,rtmp,rtp,rtsp,wav,dvdsub' \
--enable-decoder='h264,hevc,vp9,av1,mjpeg,mpeg1video,mpeg2video,mpeg4,aac,mp3,flac,vorbis,opus,pcm_s16le,pcm_s16be,pcm_s24le,pcm_s24be,pcm_s32le,pcm_s32be,pcm_f32le,pcm_f32be,pcm_s64le,pcm_s64be,pcm_f64le,pcm_f64be,pcm_u8,pcm_alaw,pcm_mulaw,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,adpcm_swf,ass,srt,dvdsub,dvbsub' \
--enable-encoder='h264_vaapi,hevc_vaapi,vp9_vaapi,mjpeg_vaapi,libfdk_aac,libmp3lame,libopus,libvorbis,libx264,libx265,ac3,eac3,flac,vorbis,pcm_s16le,pcm_s16be,pcm_s24le,pcm_s24be,pcm_s32le,pcm_s32be,pcm_f32le,pcm_f32be,pcm_s64le,pcm_s64be,pcm_f64le,pcm_f64be,pcm_u8,pcm_alaw,pcm_mulaw,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,ass,srt,dvdsub' \
--enable-filter='adelay,aecho,afifo,amix,anull,aresample,aformat,asetpts,asplit,colorspace,crystalizer,crop,drawtext,equalizer,firequalizer,format,fps,hwdownload,hwmap,hwupload,ladspa,lv2,rubberband,libplacebo,loudnorm,null,nullsrc,overlay,palettegen,paletteuse,pan,scale,scale_vaapi,setpts,transpose,volume,drawbox_vaapi,hstack_vaapi,vstack_vaapi' \
--enable-parser='aac,flac,h263,h264,hevc,mjpeg,mp3,mpegaudio,mpegvideo,mpeg4video,opus,vorbis,ac3,dca,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,dvdsub,dvd_pel' \
--enable-bsf='aac_adtstoasc,av1_metadata,extract_extradata,h264_metadata,h264_mp4toannexb,hevc_metadata,hevc_mp4toannexb,mjpeg2jpeg,mpeg4_unpack_bframes,null,opus_metadata,pcm_rechunk,vp9_metadata,vp9_superframe' \
--enable-asm --enable-x86asm --enable-inline-asm --enable-runtime-cpudetect --disable-indev=pulse --disable-outdev='pulse,xv'



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

chmod +x bin/build-ffmpeg-skylake.sh













 \
&& make -j$(nproc) && sudo make install && sudo ldconfig
