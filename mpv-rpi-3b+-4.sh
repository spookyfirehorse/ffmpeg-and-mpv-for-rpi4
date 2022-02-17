
 sudo ln -s /usr/bin/python3.9 /usr/bin/python && \
 cd ~/ffmpeg_sources && git clone https://github.com/mpv-player/mpv.git && cd mpv && git checkout v0.34.1 && ./bootstrap.py &&
./waf configure --enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2
--enable-libmpv-shared --disable-libplacebo --disable-vulkan && sudo ./waf -j4 && ./waf -j4 install

 

