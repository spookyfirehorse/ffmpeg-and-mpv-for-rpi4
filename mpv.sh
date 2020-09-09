export CPATH=~/ffmpeg_build/include && \
export LD_LIBRARY_PATH=~/ffmpeg_build/lib && \
export PKG_CONFIG_PATH=~/ffmpeg_build/lib/pkgconfig:/opt/vc/lib/pkgconfig  && \
cd ~/ffmpeg_sources  && \
git clone https://github.com/mpv-player/mpv.git && \
cd mpv && \
./bootstrap.py && \
./waf configure --enable-rpi --enable-rpi-mmal --disable-vaapi --enable-egl-drm --enable-egl-x11  --disable-wayland --disable-android --disable-vdpau --disable-vulkan && \
./waf -j4 && sudo  ./waf install && \
sudo apt build-dep vlc

