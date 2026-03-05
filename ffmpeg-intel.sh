sudo apt install libgnutls28-dev libp11-kit-dev libzstd-dev libidn2-dev libunistring-dev



#!/bin/bash
make distclean && \
PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/local/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH" \
./configure --prefix=/usr \
 --libdir=/usr/lib/x86_64-linux-gnu \
 --incdir=/usr/include/x86_64-linux-gnu \
 --extra-version="ultra-skylake-universal-C-support" \
 --arch=x86_64 \
 --cpu=skylake \
 --extra-cflags='-march=skylake -O3 -pipe -fPIC -I/usr/include/vulkan' \
 --extra-cxxflags='-march=skylake -O3 -pipe -fPIC' \
 --extra-ldflags='-L/usr/lib/x86_64-linux-gnu -Wl,-O1 -Wl,-rpath,/usr/lib/x86_64-linux-gnu -Wl,--as-needed' \
 --extra-libs='-lpthread -lm -lrt -ldl -lstdc++ -lxml2 -lz' \
 --nvcc=/usr/bin/nvcc \
 --disable-everything --disable-hwaccels \
 --enable-ffmpeg --enable-ffprobe --enable-avdevice --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale \
 --enable-pthreads --enable-shared --disable-static --disable-debug --disable-doc \
 --enable-gpl --enable-version3 --enable-nonfree --enable-pic --enable-stripping --enable-lto \
 --enable-cuda-nvcc --enable-libnpp --enable-ffnvcodec --enable-nvenc --enable-nvdec \
 --enable-vaapi --enable-vulkan --enable-libplacebo --enable-libshaderc --disable-vdpau \
 --enable-hwaccel='h264_nvdec,hevc_nvdec,vp9_nvdec,av1_nvdec,h264_vaapi,hevc_vaapi' \
 --enable-gnutls --enable-gmp --enable-gcrypt --enable-network \
 --enable-libvpx --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libvorbis \
 --enable-libfreetype --enable-libharfbuzz --enable-libfribidi --enable-hardcoded-tables \
 --enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa --enable-alsa --enable-libjack \
 --enable-libx264 --enable-libx265 --enable-xlib --disable-sdl2 --disable-libpulse \
 --enable-indev='v4l2,alsa,jack,fbdev,lavfi,pipe' \
 --enable-outdev='v4l2,alsa,jack,fbdev,drm,pipe' \
 --enable-protocol='file,http,https,tcp,udp,rtp,rtsp,rtmp,rtmpt,rtmpe,rtmps,ffrtmpcrypt,hls,dash,srt,unix,cache,crypto,concat,data,lavfi,pipe' \
 --enable-demuxer='mov,matroska,flac,wav,mp3,ogg,aac,avi,h264,hevc,rtsp,sdp,rtp,rtmp,hls,flv,mpegts,mpegvideo,mjpeg,image2,lavfi,ac3,eac3,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt' \
 --enable-muxer='mp4,mkv,mov,avi,flac,wav,mp3,opus,ogg,rtsp,rtp,rtmp,flv,hls,mpegts,adts,dash,matroska,image2,null,ac3,eac3,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt' \
 --enable-decoder='h264,hevc,vp9,av1,mjpeg,mpeg1video,mpeg2video,mpeg4,h264_cuvid,hevc_cuvid,vp9_cuvid,aac,mp3,flac,vorbis,opus,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,adpcm_swf,ass,srt' \
 --enable-encoder='h264_nvenc,hevc_nvenc,av1_nvenc,h264_vaapi,hevc_vaapi,libfdk_aac,libmp3lame,libopus,libvorbis,libx264,libx265,ac3,eac3,flac,vorbis,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt,ass,srt' \
 --enable-filter='afifo,anull,asplit,amix,aresample,aformat,volume,loudnorm,equalizer,crystalizer,ladspa,lv2,rubberband,scale,format,fps,crop,overlay,drawtext,hwupload_cuda,hwdownload,scale_npp,yadif_cuda,libplacebo' \
 --enable-parser='h264,hevc,vp9,mjpeg,mpegvideo,mpeg4video,aac,mp3,flac,opus,vorbis,ac3,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt' \
 --enable-bsf='h264_mp4toannexb,hevc_mp4toannexb,mpeg4_unpack_bframes,aac_adtstoasc,extract_extradata,null,opus_metadata' \
 --enable-asm --enable-inline-asm --enable-runtime-cpudetect --disable-indev=pulse --disable-outdev='pulse,xv' \
 && make -j$(nproc) && sudo make install && sudo ldconfig
