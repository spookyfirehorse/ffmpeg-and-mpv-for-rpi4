
cd ~/ffmpeg_sources && apt source mpv && \
cd ~/ffmpeg_sources/mpv-0.34.0/ &&  chmod 777 waf && \
 ./waf configure  --enable-egl-drm --enable-gl-x11 \
--enable-egl --enable-sdl2   --enable-xv --enable-zimg --enable-egl-x11  --enable-libplacebo --enable-vulkan && 
./waf -j4 && sudo  ./waf install 

