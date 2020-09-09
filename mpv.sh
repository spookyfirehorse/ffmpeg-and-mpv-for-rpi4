sudo apt -y build-dep mpv && \
sudo apt -y purge libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev mpv ffmpeg && \
sudo apt-mark manual opencv* && sudo apt-mark manual lib* && sudo apt-mark manual *-dev && apt build-dep mpv && \
cd /usr/local/src/ && \
git clone https://github.com/mpv-player/mpv.git && \
cd mpv && \
./bootstrap.py && \
./waf configure --enable-rpi --enable-rpi-mmal --disable-vaapi --enable-egl-drm \ 
--enable-egl-x11 --disable-wayland --disable-android --disable-vdpau --disable-vulkan && \
./waf -j4 && sudo  ./waf install
