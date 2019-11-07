mkdir -p ~/ffmpeg_sources ~/bin


sudo apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libass-dev \
  libfreetype6-dev \
  libsdl2-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libvorbis-dev \
  libxcb1-dev \
  libxcb-shm0-dev libfdk-aac-dev libfdk-aac1 \
  libxcb-xfixes0-dev libvpx-dev libfdk-aac-dev libmp3lame-dev \
  pkg-config \
  texinfo libpulse-dev \
  wget zlib1g-dev nasm yasm libx264-dev libx265-dev libnuma-dev  libssl-dev libaom*

apt build-deb ffmpeg

cd ~/ffmpeg_sources && \
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-libaom \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis --target-os=linux  \
  --enable-libvpx  --enable-libxvid --enable-sdl2 \
  --enable-libx264 --enable-pthreads --enable-openssl --enable-static  \
  --enable-nonfree --disable-debug --disable-shared \
  --enable-libsoxr  --enable-version3 --enable-libx265 \
  --enable-libvpx --disable-doc --disable-htmlpages \
  --enable-libpulse --enable-omx --enable-omx-rpi --enable-mmal \
  --enable-libssh  --disable-manpages --disable-podpages    \
  --enable-opengl --enable-libzvbi --enable-avfilter --enable-filters \
  --enable-omx --enable-omx-rpi  --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx \
  --enable-runtime-cpudetect --enable-libwebp --disable-avresample --enable-swresample \
  --enable-x86asm && \
PATH="$HOME/bin:$PATH" make -j 4  && \
make install && \
hash -r	


ssh pi@raspi

arecord -L   ## give you the device name for audio here is hw:Card bla nla

/opt/vc/bin/raspivid -md 5  -vf -hf   -ex auto -o - -t 0 --ISO 300  -w 640 -h 360 -fps 15 |  ffmpeg -i - -f h264_omx  -c:v rawvideo -pix_fmt yuv420p  -f v4l2 /dev/video1


ssh scorpio ffmpeg -re -f alsa -ac 1 -i hw:CARD=Device,DEV=0   -f v4l2  -i /dev/video1    -c:v h264_omx -preset ultrafast -tune zerolatency -b:v 1000k  -r 15 -c:a libfdk_aac -b:a 128k  -ar 48000 -af aresample=async=1:min_hard_comp=0.100000:first_pts=0  -y   -f matroska - | ffplay -vcodec h264_cuvid  -acodec libfdk_aac -ssh user@ip 
