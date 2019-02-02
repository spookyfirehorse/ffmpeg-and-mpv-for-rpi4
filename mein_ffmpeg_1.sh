
# Install Nvidia +cuda for gforce 1080

wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_410.48_linux && \
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/410.93/NVIDIA-Linux-x86_64-410.93.run && \
 ./cuda_10.0.130_410.48_linux.run --verbose --silent --toolkit --override && \
./cuda_10.0.130_410.48_linux.run  --silent --driver 


nano /etc/ld.so.conf


/usr/local/lib
/usr/local/cuda-10.0/lib64/

ldconfig

mkdir ~/ffmpeg_sources
mkdir ~/bin

cd ~/ffmpeg_sources && \
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git  && \
cd nv-codec-headers  && \
sed 's#@@PREFIX@@#/usr/local#' ffnvcodec.pc.in > ffnvcodec.pc  && \
sudo install -m 0755 -d '/usr/local/include/ffnvcodec'  && \
sudo install -m 0644 include/ffnvcodec/*.h '/usr/local/include/ffnvcodec'  && \
sudo install -m 0755 -d '/usr/local/lib/pkgconfig'  && \
sudo install -m 0644 ffnvcodec.pc '/usr/local/lib/pkgconfig'  

cd ~/ffmpeg_sources && \
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git  && \
cd nv-codec-headers  && \
sed 's#@@PREFIX@@#$HOME/ffmpeg_build/include#' ffnvcodec.pc.in > ffnvcodec.pc 
install -m 0755 -d '$HOME/ffmpeg_build/include/ffnvcodec'  && \
install -m 0644 include/ffnvcodec/*.h '$HOME/ffmpeg_build/include/ffnvcodec'  && \
install -m 0755 -d '$HOME/ffmpeg_build/lib/pkgconfig/'  && \
install -m 0644 ffnvcodec.pc '$HOME/ffmpeg_build/lib/pkgconfig/' 


sudo apt-get update -qq && apt build-dep ffmpeg -y && sudo apt-get -y install \
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
  pkg-config  libfdk-aac-dev libfdk-aac1 \
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
make install && \
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
  --extra-cflags="-I$HOME/ffmpeg_build/include -I/usr/local/cuda/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib -L/usr/local/cuda/lib64" \
  --extra-libs="-lpthread -lm" \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-libaom \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree \
  --enable-libsoxr \
  --enable-libvpx \
  --enable-libpulse \
  --enable-libssh --enable-libxvid \
  --enable-libass  --enable-avisynth  --enable-libspeex \
  --enable-opengl \
  --enable-omx  --disable-doc --disable-podpages  \
  --enable-cuda --enable-cuvid --enable-nvenc --enable-nonfree --enable-libnpp  \
  --enable-runtime-cpudetect \
  --enable-x86asm && \
PATH="$HOME/bin:$PATH" make -j10  && \
make install && \
hash -r

ssh username@host 

# audiodevice
arecord -L

ffmpeg  -f alsa -ac 2 -i plughw:CARD=PCH,DEV=0 -f v4l2  -i /dev/video0 -c:v h264_nvenc   -preset fast -b:v 300k   -r 10 -c:a libfdk_aac -b:a 128k  -ar 48000  -af aresample=async=1:min_hard_comp=0.100000:first_pts=0  -y -threads 4  -f matroska - | ffplay -vcodec h264_cuvid  -
