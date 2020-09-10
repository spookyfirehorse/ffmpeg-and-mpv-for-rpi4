cd ~/ffmpeg_sources  && \
git clone https://github.com/mpv-player/mpv.git && \
cd mpv && \
./bootstrap.py && \
./waf configure --enable-rpi --enable-rpi-mmal --disable-vaapi --enable-egl-drm --enable-egl-x11  --disable-wayland --disable-android --disable-vdpau --disable-vulkan && \
./waf -j4 && sudo  ./waf install && \
sudo apt build-dep vlc

