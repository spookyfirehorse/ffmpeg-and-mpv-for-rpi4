sudo apt build-dep mpv && cd ~/ffmpeg_sources  && \
git clone https://github.com/mpv-player/mpv.git && \
cd ~/ffmpeg_sources/mpv && \
./bootstrap.py  && ./waf configure  --enable-cuda-interop --enable-cuda-hwaccel --enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2    \
--enable-xv  --enable-egl-x11 --enable-libplacebo --enable-vulkan  --enable-cuda-hwaccel --enable-ffmpeg-strict-abi  \
./waf -j4 && sudo  ./waf install 
