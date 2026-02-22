./configure \
  --prefix=/usr \
  --extra-version=ultra-clean \
  --libdir=/usr/lib/arm-linux-gnueabihf \
  --incdir=/usr/include/arm-linux-gnueabihf \
  --arch=aarch64 \
  --cpu=cortex-a53 \
  --extra-cflags='-mcpu=cortex-a53 -O3 -pipe -ftree-vectorize -flto' \
  --extra-ldflags='-latomic -Wl,-O1,--as-needed -flto' \
  --extra-libs='-ludev -lstdc++' \
  --disable-doc --disable-manpages --disable-htmlpages --disable-podpages --disable-txtpages \
  --enable-lto --enable-gpl --enable-nonfree --disable-static --enable-shared \
  --disable-everything \
  --enable-libjack \
  --enable-libpulse \
  --enable-swresample \
  --enable-network --enable-libplacebo --enable-libshaderc --enable-vulkan --enable-libdrm --enable-libudev --enable-epoxy --enable-sand --enable-v4l2-m2m --enable-v4l2-request --enable-libass --enable-openssl --enable-sdl2 --enable-opengl \
  --enable-indev=alsa,pulse,jack \
  --enable-outdev=alsa,pulse,jack \
  --enable-protocol=rtsp,rtp,tcp,udp,file,pipe,sdp,http,https,tls,hls \
  --enable-demuxer=rtsp,h264,hevc,av1,m4v,mp3,pulse,alsa,mpegts,mov,opus,matroska,sdp,image2,asf,hls \
  --enable-muxer=rtsp,mp4,h264,hevc,mp3,mpegts,adts,opus,matroska,rtp,hls,ipod \
  --enable-decoder=h264,h264_v4l2m2m,hevc,hevc_v4l2m2m,av1,aac,mp3,mp3float,opus,ass,subrip,mov_text,mjpeg,pcm_s16le,pcm_f32le \
  --enable-encoder=libfdk_aac,libmp3lame,libopus,h264_v4l2m2m,hevc_v4l2m2m,copy \
  --enable-parser=h264,hevc,av1,mpegaudio,aac,opus \
  --enable-filter=vulkan,placebo,format,hwupload,scale,v4l2_request,v4l2m2m,aresample,aformat \
  --enable-libfdk-aac --enable-libmp3lame --enable-libopus


./configure \
  --prefix=/usr \
  --extra-version=ultra-clean \
  --libdir=/usr/lib/aarch64-linux-gnu \
  --incdir=/usr/include/aarch64-linux-gnu \
  --arch=aarch64 \
  --cpu=cortex-a76 \
  --extra-cflags='-mcpu=cortex-a76 -O3 -pipe -ftree-vectorize -flto' \
  --extra-ldflags='-latomic -Wl,-O1,--as-needed -flto' \
  --extra-libs='-ludev -lstdc++' \
  --disable-doc --disable-manpages --disable-htmlpages --disable-podpages --disable-txtpages \
  --enable-lto --enable-gpl --enable-nonfree --disable-static --enable-shared \
  --disable-everything \
  --enable-libjack \
  --enable-libpulse \
  --enable-swresample \
  --enable-network --enable-libplacebo --enable-libshaderc --enable-vulkan --enable-libdrm --enable-libudev --enable-epoxy --enable-sand --enable-v4l2-m2m --enable-v4l2-request --enable-libass --enable-openssl --enable-sdl2 --enable-opengl \
  --enable-indev=alsa,pulse,jack \
  --enable-outdev=alsa,pulse,jack \
  --enable-protocol=rtsp,rtp,tcp,udp,file,pipe,sdp,http,https,tls,hls \
  --enable-demuxer=rtsp,h264,hevc,av1,m4v,mp3,pulse,alsa,mpegts,mov,opus,matroska,sdp,image2,asf,hls \
  --enable-muxer=rtsp,mp4,h264,hevc,mp3,mpegts,adts,opus,matroska,rtp,hls,ipod \
  --enable-decoder=h264,h264_v4l2m2m,hevc,hevc_v4l2m2m,av1,aac,mp3,mp3float,opus,ass,subrip,mov_text,mjpeg,pcm_s16le,pcm_f32le \
  --enable-encoder=libfdk_aac,libmp3lame,libopus,h264_v4l2m2m,hevc_v4l2m2m,copy \
  --enable-parser=h264,hevc,av1,mpegaudio,aac,opus \
  --enable-filter=vulkan,placebo,format,hwupload,scale,v4l2_request,v4l2m2m,aresample,aformat \
  --enable-libfdk-aac --enable-libmp3lame --enable-libopus



./configure \
  --prefix=/usr \
  --extra-version=ultra-clean \
  --libdir=/usr/lib/aarch64-linux-gnu \
  --incdir=/usr/include/aarch64-linux-gnu \
  --arch=aarch64 \
  --cpu=cortex-a72 \
  --extra-cflags='-mcpu=cortex-a72 -O3 -pipe -ftree-vectorize -flto' \
  --extra-ldflags='-latomic -Wl,-O1,--as-needed -flto' \
  --extra-libs='-ludev -lstdc++' \
  --disable-doc --disable-manpages --disable-htmlpages --disable-podpages --disable-txtpages \
  --enable-lto --enable-gpl --enable-nonfree --disable-static --enable-shared \
  --disable-everything \
  --enable-libjack \
  --enable-libpulse \
  --enable-swresample \
  --enable-network --enable-libplacebo --enable-libshaderc --enable-vulkan --enable-libdrm --enable-libudev --enable-epoxy --enable-sand --enable-v4l2-m2m --enable-v4l2-request --enable-libass --enable-openssl --enable-sdl2 --enable-opengl \
  --enable-indev=alsa,pulse,jack \
  --enable-outdev=alsa,pulse,jack \
  --enable-protocol=rtsp,rtp,tcp,udp,file,pipe,sdp,http,https,tls,hls \
  --enable-demuxer=rtsp,h264,hevc,av1,m4v,mp3,pulse,alsa,mpegts,mov,opus,matroska,sdp,image2,asf,hls \
  --enable-muxer=rtsp,mp4,h264,hevc,mp3,mpegts,adts,opus,matroska,rtp,hls,ipod \
  --enable-decoder=h264,h264_v4l2m2m,hevc,hevc_v4l2m2m,av1,aac,mp3,mp3float,opus,ass,subrip,mov_text,mjpeg,pcm_s16le,pcm_f32le \
  --enable-encoder=libfdk_aac,libmp3lame,libopus,h264_v4l2m2m,hevc_v4l2m2m,copy \
  --enable-parser=h264,hevc,av1,mpegaudio,aac,opus \
  --enable-filter=vulkan,placebo,format,hwupload,scale,v4l2_request,v4l2m2m,aresample,aformat \
  --enable-libfdk-aac --enable-libmp3lame --enable-libopus

