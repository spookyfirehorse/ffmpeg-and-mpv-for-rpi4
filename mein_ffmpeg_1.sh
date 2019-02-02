#!/bin/sh


 ./NVIDIA-Linux-x86_64-410.93.run
./cuda_10.0.130_410.48_linux.run --verbose --silent --toolkit --override

nano /etc/ld.so.conf

/usr/local/cuda-10.0/lib64/

cd ~/ffmpeg_sources && \
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git  && \
cd nv-codec-headers  && \
sed 's#@@PREFIX@@#/usr/local#' ffnvcodec.pc.in > ffnvcodec.pc  && \
sudo install -m 0755 -d '/usr/local/include/ffnvcodec'  && \
sudo install -m 0644 include/ffnvcodec/*.h '/usr/local/include/ffnvcodec'  && \
sudo install -m 0755 -d '/usr/local/lib/pkgconfig'  && \
sudo install -m 0644 ffnvcodec.pc '/usr/local/lib/pkgconfig'  


wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb && \
sudo dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb  && \
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub  && \
sudo apt-get update  && \
sudo apt-get install cuda  && \
cd ~/ffmpeg_sources && \
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git  && \
cd nv-codec-headers  && \
sed 's#@@PREFIX@@#/usr/local#' ffnvcodec.pc.in > ffnvcodec.pc  && \
install -m 0755 -d '/home/tom/ffmpeg_build/include/ffnvcodec'  && \
install -m 0644 include/ffnvcodec/*.h '/home/tom/ffmpeg_build/include/ffnvcodec'  && \
install -m 0755 -d '/home/tom/ffmpeg_build/lib/pkgconfig/'  && \
install -m 0644 ffnvcodec.pc '/home/tom/ffmpeg_build/lib/pkgconfig/' && \
sudo apt-get update -qq && sudo apt-get -y install \
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
  libxcb-shm0-dev \
  libpulse-dev \
  libssh-dev \
  libxcb-xfixes0-dev \
  pkg-config \
  texinfo \
  wget \
  zlib1g-dev && \
cd ~/ffmpeg_sources && \
wget https://www.nasm.us/pub/nasm/releasebuilds/2.14/nasm-2.14.tar.bz2 && \
tar xjvf nasm-2.14.tar.bz2 && \
cd nasm-2.14 && \
./autogen.sh && \
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
make -j4 && \
make install && \
cd ~/ffmpeg_sources && \
wget -O yasm-1.3.0.tar.gz https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz && \
tar xzvf yasm-1.3.0.tar.gz && \
cd yasm-1.3.0 && \
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
make -j4 && \
make install && \
cd ~/ffmpeg_sources && \
git -C x264 pull 2> /dev/null || git clone --depth 1 https://git.videolan.org/git/x264 && \
cd x264 && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static --enable-pic && \
PATH="$HOME/bin:$PATH" make -j4 && \
make install && \
sudo apt-get install -y mercurial libnuma-dev && \
cd ~/ffmpeg_sources && \
if cd x265 2> /dev/null; then hg pull && hg update; else hg clone https://bitbucket.org/multicoreware/x265; fi && \
cd x265/build/linux && \
PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED=off ../../source && \
PATH="$HOME/bin:$PATH" make -j4 && \
make install && \
cd ~/ffmpeg_sources && \
git -C libvpx pull 2> /dev/null || git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git && \
cd libvpx && \
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm && \
PATH="$HOME/bin:$PATH" make -j4 && \
make install && \
cd ~/ffmpeg_sources && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
make -j4 && \
make instal && \
cd ~/ffmpeg_sources && \
wget -O lame-3.100.tar.gz https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz && \
tar xzvf lame-3.100.tar.gz && \
cd lame-3.100 && \
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm && \
PATH="$HOME/bin:$PATH" make -j4 && \
make install && \
cd ~/ffmpeg_sources && \
git -C opus pull 2> /dev/null || git clone --depth 1 https://github.com/xiph/opus.git && \
cd opus && \
./autogen.sh && \
./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
make -j4 && \
make install && \
cd ~/ffmpeg_sources && \
git -C aom pull 2> /dev/null || git clone --depth 1 https://aomedia.googlesource.com/aom && \
mkdir aom_build && \
cd aom_build && \
PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED=off -DENABLE_NASM=on ../aom && \
PATH="$HOME/bin:$PATH" make -j4 && \
make install && \
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
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree \
  --enable-libsoxr \
  --enable-libvpx \
  --enable-x86asm \
  --enable-libpulse \
  --enable-libssh \
  --enable-opengl \
  --enable-cuda --enable-cuvid --enable-nvenc --enable-nonfree --enable-libnpp  \
  --enable-runtime-cpudetect && \
PATH="$HOME/bin:$PATH" make -j 10 && \
make install && \
hash -r &&  source ~/.profile && \



--enable-vaapi --enable-cuda --enable-cuvid --enable-nvenc \
--enable-omx --enable-omx-rpi --enable-mmal 

--enable-ffserver \

##############  RASPIAN COMPILE
git -C aom pull 2> /dev/null || git clone --depth 1 https://aomedia.googlesource.com/aom && \
mkdir aom_build && \
cd aom_build && \
PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build"  -DAOM_TARGET_CPU=generic -DENABLE_SHARED=off -DENABLE_NASM=on ../aom && \
PATH="$HOME/bin:$PATH" make && \
make install
#################
