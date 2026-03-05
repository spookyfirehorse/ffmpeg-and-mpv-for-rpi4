sudo apt install libgnutls28-dev libp11-kit-dev libzstd-dev libidn2-dev libunistring-dev


make distclean && \
PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/local/lib/x86_64-linux-gnu/pkgconfig" \
./configure --prefix=/usr \
  --libdir=/usr/lib/x86_64-linux-gnu \
  --incdir=/usr/include/x86_64-linux-gnu \
  --extra-version="ultra-goldmont-stable-rt-jack" \
  --arch=x86_64 \
  --cpu=goldmont \
  --pkg-config-flags="--static" \
  --extra-cflags="-march=goldmont -mtune=goldmont -O3 -pipe -fPIC -I/usr/include/vulkan" \
  --extra-cxxflags="-march=goldmont -mtune=goldmont -O3 -pipe -fPIC" \
  --extra-ldflags="-L/usr/lib/x86_64-linux-gnu -Wl,-O1 -Wl,-rpath,/usr/lib/x86_64-linux-gnu -Wl,--as-needed" \
  --extra-libs="-lpthread -lm -lrt -ldl -lstdc++ -lxml2 -lz" \
  --disable-everything \
  --enable-ffmpeg --enable-ffprobe --enable-avdevice --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale \
  --enable-pthreads --enable-shared --disable-static --disable-debug --disable-doc \
  --enable-gpl --enable-version3 --enable-nonfree --enable-pic --enable-stripping --enable-lto \
  --disable-cuda --disable-cuvid --disable-nvenc --disable-nvdec --disable-libnpp --disable-ffnvcodec \
  --disable-libpulse --disable-indev=pulse --disable-outdev='pulse,xv' --enable-libxml2 \
  --enable-vaapi --enable-vulkan --enable-libshaderc --enable-libplacebo --enable-libdrm --disable-vdpau \
  --enable-hwaccel='h264_vaapi,hevc_vaapi,vp9_vaapi,av1_vaapi' \
  --enable-gnutls --enable-gmp --enable-gcrypt --enable-network \
  --enable-libx264 --enable-libx265 --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx \
  --enable-libfreetype --enable-libharfbuzz --enable-libfribidi \
  --enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa \
  --enable-alsa --enable-libjack  \
  --enable-indev='alsa,fbdev,jack,kmsgrab,lavfi,pipe,v4l2' \
  --enable-outdev='alsa,drm,fbdev,jack,kmsgrab,v4l2,pipe' \
  --enable-protocol='cache,concat,crypto,dash,fd,ffrtmpcrypt,file,hls,http,https,pipe,rtmp,rtmpe,rtmps,rtmpt,rtp,rtsp,srt,tcp,tls,udp,unix' \
  --enable-demuxer='aac,avi,concat,dash,flac,h264,hevc,hls,image2,lavfi,matroska,mjpeg,mov,mp3,mpegts,mpegvideo,ogg,rawvideo,rtmp,rtp,rtsp,sdp,wav' \
  --enable-muxer='adts,avi,dash,flac,hls,image2,matroska,mov,mp3,mp4,mpegts,null,ogg,opus,rawvideo,rtmp,rtp,rtsp,wav' \
  --enable-decoder='mov_text,dvdsub,dvbsub,h263,h263i,h263p,h264,hevc,vp9,av1,mjpeg,mpeg1video,mpeg2video,mpeg4,aac,mp3,flac,vorbis,opus,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo,adpcm_swf,ass,srt,h264_vaapi,hevc_vaapi,vp9_vaapi' \
  --enable-encoder='mov_text,dvdsub,dvbsub,libfdk_aac,libmp3lame,libopus,libvorbis,libx264,libx265,h264_vaapi,hevc_vaapi,vp9_vaapi,ac3,eac3,flac,pcm_s16le,pcm_s24le,rawvideo,ass,srt' \
  --enable-filter='hwupload,hwdownload,format,fps,scale,crop,overlay,drawtext,aresample,volume,loudnorm,equalizer,crystalizer,ladspa,lv2,rubberband,scale_vaapi,deinterlace_vaapi,denoise_vaapi,sharpness_vaapi,procamp_vaapi,tonemap_vaapi,yadif_vaapi,setdar,settb,setpts,asettb,asetpts,concat,aformat,bass,treble,afifo,anull,asplit,amix,anequalizer,surround,stereowiden,pad,pan,yadif,asubboost,asubcut,libplacebo' \
  --enable-parser='aac,flac,h263,h264,hevc,mjpeg,mp3,mpegaudio,mpegvideo,mpeg4video,opus,vorbis' \
  --enable-bsf='aac_adtstoasc,extract_extradata,h264_mp4toannexb,hevc_mp4toannexb,mpeg4_unpack_bframes,null,opus_metadata' \
  --enable-asm --enable-x86asm --enable-inline-asm --enable-runtime-cpudetect \
  && make clean && make -j$(nproc) && sudo make install && sudo ldconfig
