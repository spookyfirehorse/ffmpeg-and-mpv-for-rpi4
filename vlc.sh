apt build-dep vlc && \
cd /usr/local/src/ && git clone https://github.com/videolan/vlc.git && \
cd vlc && ./bootstrap && \
./configure \
--enable-mmal --enable-omxil --enable-rpi-omxil  \
--disable-libva --enable-fdkaac --enable-gles2  --disable-vdpau --disable-wayland --disable-qt && \
make -j4 && make install && ldconfig && \
apt purge libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev  ffmpeg mpv && \
apt-mark manual opencv* && sudo apt-mark manual lib* && sudo apt-mark manual *-dev && \
apt-mark hold libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev 
