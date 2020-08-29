sudo apt build-dep ffmpeg

sudo apt-get update -qq && sudo apt-get -y install
autoconf
automake
build-essential
cmake
doxygen
git
graphviz
imagemagick
libasound2-dev
libass-dev
libfreetype6-dev
libgmp-dev
libmp3lame-dev
libopencore-amrnb-dev
libopencore-amrwb-dev
libopus-dev
librtmp-dev
libsdl2-dev
libsdl2-image-dev
libsdl2-mixer-dev
libsdl2-net-dev
libsdl2-ttf-dev
libsnappy-dev
libsoxr-dev
libssh-gcrypt-dev
libssl-dev
libtool
libv4l-dev
libva-dev
libvdpau-dev
libvo-amrwbenc-dev
libvorbis-dev
libwebp-dev
libx264-dev
libx265-dev
libxcb-shape0-dev
libxcb-shm0-dev
libxcb-xfixes0-dev
libxcb1-dev
libxml2-dev
lzma-dev
meson
nasm
pkg-config
python3-dev
python3-pip
texinfo
wget
yasm
zlib1g-dev

git clone https://github.com/FFmpeg/FFmpeg.git

mkdir ffmpeg_sources
cd ffmpeg_sources
git clone https://github.com/FFmpeg/FFmpeg.git
cd ffmpeg

PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure
--prefix="$HOME/ffmpeg_build"
--pkg-config-flags="--static"
--extra-cflags="-I$HOME/ffmpeg_build/include"
--extra-ldflags="-L$HOME/ffmpeg_build/lib"
--extra-libs="-lpthread -lm"
--bindir="$HOME/bin"
--enable-gpl
--enable-libaom
--enable-libass
--enable-libfdk-aac
--enable-libfreetype
--enable-libmp3lame
--enable-libopus --enable-libv4l2
--enable-libvorbis --enable-libopencore_amrnb
--enable-libxvid --enable-sdl2 --enable-libopencore_amrwb
--enable-libx264 --enable-pthreads --enable-openssl
--enable-nonfree --disable-debug
--enable-libsoxr --enable-version3 --enable-libx265
--enable-libvpx --disable-doc --disable-htmlpages
--enable-libpulse --enable-libssh --disable-manpages --disable-podpages
--enable-opengl --enable-libzvbi --enable-avfilter --enable-filters
--enable-mmal --enable-omx --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx
--enable-runtime-cpudetect --enable-libwebp --disable-avresample --enable-swresample
--enable-x86asm --enable-libjack --enable-shared --disable-static --enable-librubberband --disable-vdpau --disable-vaapi --enable-gmp --enable-hardcoded-tables --disable-stripping

PATH="$HOME/bin:$PATH" make -j 4

make install

sudo apt build-dep mpv

sudo apt purge libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev

nano .bashrc

export CPATH=/home/spook/ffmpeg_build/include
export LD_LIBRARY_PATH=/home/spook/ffmpeg_build/lib
export PKG_CONFIG_PATH=/home/spook/ffmpeg_build/lib/pkgconfig
export PKG_CONFIG_PATH="/opt/vc/lib/pkgconfig

cd ffmpeg_sources

git clone https://github.com/mpv-player/mpv.git

cd mpv ./bootstrap

./waf configure --prefix=/usr/local --enable-rpi --enable-rpi-mmal --disable-vaapi --enable-egl-drm --enable-egl-x11 --disable-wayland --disable-wayland-protocols --disable-wayland-scanner --disable-gl-wayland --disable-android --disable-vdpau

./waf -j4

sudo ./waf install

nano .config/mpv/mpv.config

gpu-context=rpi
gpu-api=opengl
vo=rpi
hwdec=h264_mmal-mmal-copy
hwdec-codecs=all
