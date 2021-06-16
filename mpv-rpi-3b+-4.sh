
cd ~/ffmpeg_sources  && sudo rm -r mpv && \
git clone https://github.com/mpv-player/mpv.git && \
cd ~/ffmpeg_sources/mpv && \
./bootstrap.py && \
export PKG_CONFIG_PATH=/opt/vc/lib/pkgconfig && ./waf configure --enable-rpi --enable-rpi-mmal  --enable-egl-drm --enable-gl-x11 \
--enable-egl --enable-sdl2 --enable-ffmpeg-strict-abi --disable-libavdevice  --enable-xv --enable-zimg --enable-egl-x11 --enable-libmpv-shared --enable-libplacebo --enable-vulkan && 
./waf -j4 && sudo  ./waf install 

