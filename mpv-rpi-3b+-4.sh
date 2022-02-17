
 # sudo ln -s /usr/bin/python3.9 /usr/bin/python && \
cd ~/ffmpeg_sources && wget http://deb.debian.org/debian/pool/main/m/mpv/mpv_0.34.1.orig.tar.gz  && tar -xf mpv_0.34.1.orig.tar.gz && cd ~/ffmpeg_sources/mpv-0.34.1 && ./bootstrap.py &&  ./waf configure --enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2 --enable-libmpv-shared --enable-libplacebo --enable-vulkan  --disable-vaapi --disable-vdpau  && ./waf -j4 && sudo  ./waf -j4 install

 

