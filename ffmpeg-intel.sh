./configure --prefix=/usr  --libdir=/usr/lib/x86_64-linux-gnu  --incdir=/usr/include/x86_64-linux-gnu  --extra-version="ultra-goldmont-stable-rt-jack"  --arch=x86_64 --cpu=goldmont  --extra-cflags="-march=goldmont -mtune=goldmont -O3 -pipe -mfpmath=sse -msse4.2 -fPIC"  --extra-cxxflags="-march=goldmont -mtune=goldmont -O3 -pipe -fPIC"  --extra-ldflags="-L/usr/lib/x86_64-linux-gnu -Wl,-O1,--as-needed"  --extra-libs="-lpthread -lm -lrt -ldl -lstdc++"  --disable-everything  --enable-ffmpeg --enable-ffprobe --enable-avdevice --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale  --enable-pthreads --enable-shared --disable-static --disable-debug --disable-doc  --enable-gpl --enable-version3 --enable-nonfree --enable-pic --enable-stripping  --disable-cuda --disable-cuvid --disable-nvenc --disable-nvdec --disable-libnpp --disable-ffnvcodec  --enable-vaapi --disable-vulkan --disable-libshaderc --enable-libdrm --disable-vdpau  --enable-hwaccel=h264_vaapi,hevc_vaapi,vp9_vaapi,av1_vaapi  --enable-gnutls --enable-gmp --enable-gcrypt --enable-network  --enable-libx264 --enable-libx265 --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx  --enable-libfreetype --enable-libharfbuzz --enable-libfribidi  --enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa  --enable-alsa --enable-libjack --disable-libpulse  --enable-indev=v4l2,alsa,jack,fbdev,lavfi  --enable-outdev=v4l2,alsa,jack,fbdev,drm  --enable-protocol=file,http,https,tcp,udp,rtp,rtsp,rtmp,rtmpt,rtmpe,rtmps,ffrtmpcrypt,hls,pipe,crypto,tls,unix,cache,concat,data,lavfi  --enable-demuxer=avi,mov,matroska,flac,wav,mp3,ogg,aac,h263,h264,hevc,rtsp,sdp,rtp,rtmp,hls,flv,mpegts,mpegvideo,mjpeg,image2,lavfi  --enable-muxer=avi,mp4,mkv,mov,flac,wav,mp3,opus,ogg,rtsp,rtp,rtmp,flv,hls,mpegts,adts,dash,matroska,image2,null  --enable-decoder=h263,h263i,h263p,h264,hevc,vp9,av1,mjpeg,mpeg1video,mpeg2video,mpeg4,aac,mp3,flac,vorbis,opus,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo,adpcm_swf,ass,srt,h264_vaapi,hevc_vaapi,vp9_vaapi  --enable-encoder=h263,h263p,h264_vaapi,hevc_vaapi,vp9_vaapi,libx264,libx265,aac,libfdk_aac,libmp3lame,libopus,flac,mjpeg  --enable-filter=hwupload,hwdownload,format,fps,scale,crop,overlay,drawtext,aresample,volume,loudnorm,equalizer,crystalizer,ladspa,lv2,rubberband,scale_vaapi,deinterlace_vaapi,denoise_vaapi,sharpness_vaapi,procamp_vaapi,tonemap_vaapi,yadif_vaapi  --enable-parser=h263,h264,hevc,vp9,mjpeg,mpegvideo,mpeg4video,aac,mp3,flac,opus,vorbis  --enable-bsf=h264_mp4toannexb,h264_metadata,h264_redundant_pps,dump_extra,extract_extradata,hevc_mp4toannexb,hevc_metadata,mpeg4_unpack_bframes,aac_adtstoasc,null  --enable-asm --enable-x86asm --enable-inline-asm --enable-runtime-cpudetect  && make clean && make -j$(nproc) && sudo make install && sudo ldconfig


full working vaapi

./configure --prefix=/usr \
 --libdir=/usr/lib/x86_64-linux-gnu \
 --incdir=/usr/include/x86_64-linux-gnu \
 --extra-version="ultra-goldmont-stable-rt-jack" \
 --arch=x86_64 --cpu=goldmont \
 --extra-cflags="-march=goldmont -mtune=goldmont -O3 -pipe -mfpmath=sse -msse4.2 -fPIC" \
 --extra-cxxflags="-march=goldmont -mtune=goldmont -O3 -pipe -fPIC" \
 --extra-ldflags="-L/usr/lib/x86_64-linux-gnu -Wl,-O1,--as-needed" \
 --extra-libs="-lpthread -lm -lrt -ldl -lstdc++" \
 --disable-everything \
 --enable-ffmpeg --enable-ffprobe --enable-avdevice --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale \
 --enable-pthreads --enable-shared --disable-static --disable-debug --disable-doc \
 --enable-gpl --enable-version3 --enable-nonfree --enable-pic --enable-stripping \
 --disable-cuda --disable-cuvid --disable-nvenc --disable-nvdec --disable-libnpp --disable-ffnvcodec \
 --enable-vaapi --disable-vulkan --disable-libshaderc --enable-libdrm --disable-vdpau \
 --enable-hwaccel=h264_vaapi,hevc_vaapi,vp9_vaapi,av1_vaapi \
 --enable-gnutls --enable-gmp --enable-gcrypt --enable-network \
 --enable-libx264 --enable-libx265 --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx \
 --enable-libfreetype --enable-libharfbuzz --enable-libfribidi \
 --enable-ladspa --enable-lv2 --enable-librubberband --enable-libsoxr --enable-libbs2b --enable-libmysofa \
 --enable-alsa --enable-libjack --disable-libpulse \
 --enable-indev=v4l2,alsa,jack,fbdev,lavfi \
 --enable-outdev=v4l2,alsa,jack,fbdev,drm \
 --enable-protocol=file,http,https,tcp,udp,rtp,rtsp,rtmp,rtmpt,rtmpe,rtmps,ffrtmpcrypt,hls,pipe,crypto,tls,unix,cache,concat,data,lavfi \
 --enable-demuxer=avi,mov,matroska,flac,wav,mp3,ogg,aac,h263,h264,hevc,rtsp,sdp,rtp,rtmp,hls,flv,mpegts,mpegvideo,mjpeg,image2,lavfi \
 --enable-muxer=avi,mp4,mkv,mov,flac,wav,mp3,opus,ogg,rtsp,rtp,rtmp,flv,hls,mpegts,adts,dash,matroska,image2,null \
 --enable-decoder=h263,h263i,h263p,h264,hevc,vp9,av1,mjpeg,mpeg1video,mpeg2video,mpeg4,aac,mp3,flac,vorbis,opus,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo,adpcm_swf,ass,srt,h264_vaapi,hevc_vaapi,vp9_vaapi \
 --enable-encoder=h263,h263p,h264_vaapi,hevc_vaapi,vp9_vaapi,libx264,libx265,aac,libfdk_aac,libmp3lame,libopus,flac,mjpeg \
 --enable-filter=hwupload,hwdownload,format,fps,scale,crop,overlay,drawtext,aresample,volume,loudnorm,equalizer,crystalizer,ladspa,lv2,rubberband,scale_vaapi,deinterlace_vaapi,denoise_vaapi,sharpness_vaapi,procamp_vaapi,tonemap_vaapi,yadif_vaapi \
 --enable-parser=h263,h264,hevc,vp9,mjpeg,mpegvideo,mpeg4video,aac,mp3,flac,opus,vorbis \
 --enable-bsf=h264_mp4toannexb,h264_metadata,h264_redundant_pps,dump_extra,extract_extradata,hevc_mp4toannexb,hevc_metadata,mpeg4_unpack_bframes,aac_adtstoasc,null \
 --enable-asm --enable-x86asm --enable-inline-asm --enable-runtime-cpudetect \
 && make clean && make -j$(nproc) && sudo make install && sudo ldconfig
