git clone https://github.com/spookyfirehorse/raspberry-pi-with-ffmpeg-all-codecs-mpv-rpi-.git && \
cd ~/raspberry-pi-with-ffmpeg-all-codecs-mpv-rpi- &&  \
cp bashrc ~/.bashrc &&  mkdir -p ~/.config/mpv && cp mpv.conf ~/.config/mpv/ && mkdir -p ~/.config/vlc && cp vlcrc ~/.config/vlc/ && \
sudo apt -y  install autoconf automake build-essential pkg-config cmake doxygen git graphviz imagemagick libasound2-dev libass-dev libfreetype6-dev \
libgmp-dev  libopus-dev librtmp-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-net-dev libsdl2-ttf-dev \
libsnappy-dev libsoxr-dev libssl-dev  libv4l-dev libva-dev libvorbis-dev libx264-dev libxcb-shape0-dev \
libxcb-shm0-dev libxcb-xfixes0-dev libxcb1-dev libxml2-dev lzma-dev nasm python3*-dev python3-pip texinfo wget yasm zlib1g-dev youtube-dl \
libgtk2.0-dev  python3-numpy python-dev libtiff5-dev libjasper-dev libdc1394-22-dev libv4l-dev libtbb-dev libmp3lame-dev \
libopencore-amrnb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils mousepad git-core libass-dev \
libfreetype6-dev libsdl2-dev libtool libvdpau-dev libvorbis-dev libxcb1-dev libvpx-dev libpulse-dev  libwebp-dev libxvidcore-dev \
libzvbi-dev libxcb-shm0-dev  libv4l-dev libxcb-xfixes0-dev libvpx-dev texinfo libpulse-dev libomxil-bellagio-dev libssh-gcrypt-dev \
libssl-dev wget zlib1g-dev nasm yasm libx264-dev   libnuma-dev libgles2-mesa-dev git devscripts equivs meson spirv-tools libplacebo* \
libxcb-shm0-dev libxcb-xv0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-composite0-dev libx11-xcb-dev libqt5*-dev qt5*-dev libgstreamer-plugins-base1.0-dev


mkdir -p ~/ffmpeg_sources && \
cd ~/ffmpeg_sources && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure  --disable-shared && \
make -j4 && \
sudo make install && sudo ldconfig && sudo apt -y  build-dep ffmpeg && mkdir -p ~/bin && \
cd ~/ffmpeg_sources && wget https://ffmpeg.org/releases/ffmpeg-4.3.1.tar.bz2 && tar xjvf ffmpeg-4.3.1.tar.bz2 && cd ffmpeg-4.3.1 && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" \
./configure --prefix="$HOME/ffmpeg_build" --pkg-config-flags="--static" --extra-cflags="-I$HOME/ffmpeg_build/include" \
--extra-ldflags="-L$HOME/ffmpeg_build/lib" --extra-libs="-lpthread -lm" --bindir="$HOME/bin" \
--enable-gpl --enable-libaom --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libv4l2 \
--enable-libxvid --enable-sdl2 --enable-libx264 --enable-pthreads --enable-openssl --enable-nonfree --disable-debug --enable-libsoxr --enable-version3 \
--enable-libvpx --disable-doc --disable-htmlpages --enable-libpulse --enable-libssh --disable-manpages --disable-podpages --enable-opengl --enable-libzvbi \
--enable-avfilter --enable-filters --enable-mmal --enable-omx --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx  \
--enable-runtime-cpudetect --enable-libwebp --disable-avresample --enable-swresample --enable-x86asm --enable-libjack --enable-shared --disable-static \
--enable-librubberband --disable-vdpau --disable-vaapi --enable-gmp --enable-hardcoded-tables --disable-stripping



PATH="$HOME/bin:$PATH" make -j 4 && make install && cd ~/bin && sudo cp ff* /usr/local/bin/ && sudo apt -y build-dep mpv && \
sudo apt -y purge libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev && \ 
sudo apt-mark manual opencv* && sudo apt-mark manual lib* && sudo apt-mark manual *-dev && exit


cd ~/ffmpeg_sources && \
git clone https://github.com/mpv-player/mpv.git && \
cd mpv && \
./bootstrap.py && \
./waf configure --prefix=/usr/local --enable-rpi --enable-rpi-mmal --disable-vaapi --enable-egl-drm --enable-egl-x11 --disable-wayland --disable-wayland-protocols --disable-wayland-scanner --disable-gl-wayland --disable-android --disable-vdpau --disable-vulkan

./waf -j4 && \
sudo ./waf install

#  sudo cp config.txt /boot/


sudo nano /boot/config.txt

###########

gpu_mem=128

#dtoverlay=vc4-kms-v3d

#dtoverlay=vc4-fkms-v3d

###############

disable all vd3 and set gpu mem 128 


sudo reboot



mpv example.mp4

enjoy
buy me a beer !

####################################################################################################

VLC

####################################################################################################

sudo apt-get install libxcb-shm0-dev libxcb-xv0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-composite0-dev libx11-xcb-dev \
libqt5*-dev qt5*-dev libplacebo* xcb-xkb*-dev && \
sudo apt build-dep vlc && \
apt purge libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev && \
sudo apt-mark manual opencv* && sudo apt-mark manual lib* && sudo apt-mark manual *-dev && \
apt-mark hold libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev && \
cd ~/ffmpeg_sources && git clone https://github.com/videolan/vlc.git && \
cd vlc && ./bootstrap && \
./configure  --enable-mmal --enable-omxil --enable-rpi-omxil --disable-libva --enable-fdkaac --enable-gles2  --disable-vdpau --disable-wayland --disable-wayland-protocols  --disable-wayland-scanner --disable-gl-wayland  --disable-qt

make -j4 && \
sudo make install && \ 
sudo ldconfig


cvlc   example.mp4
