#cd ~/ffmpeg_sources/ && git clone https://github.com/haasn/libplacebo.git && \
#cd ~/ffmpeg_sources/libplacebo && git switch -c v3.104.0 \ 
#DIR=./build && DIR=./build && meson $DIR  && \
#meson configure $DIR   -Dvulkan=enabled -Dshaderc=enabled  && \
#ninja -C$DIR  && \
#sudo ninja -Cbuild install


sudo apt build-dep libplacebo && apt source libplacebo && cd libplacebo-2.72.2/ && meson build && meson configure build  -Dvulkan=enabled -Dshaderc=enabled &&   ninja -C build && sudo ninja -C build install
