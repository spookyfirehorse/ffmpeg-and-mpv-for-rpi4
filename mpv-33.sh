cd ~/ffmpeg_sources/  && apt source mpv && cd  ~/ffmpeg_sources/mpv-0.32.0  && chmod 777 waf  &&  ./waf configure --enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2 --enable-libmpv-shared --enable-libplacebo --enable-vulkan  --disable-vaapi --disable-vdpau  && ./waf -j4 && sudo  ./waf -j4 install