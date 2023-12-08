#cd ~/ffmpeg_sources/ && git clone https://github.com/haasn/libplacebo.git && \
#cd ~/ffmpeg_sources/libplacebo && git checkout tags/v3.104.0 -b v3.104.0 \ 
#DIR=./build && DIR=./build && meson $DIR  && \
#meson configure $DIR   -Dvulkan=enabled -Dshaderc=enabled  && \
#ninja -C$DIR  && \
#sudo ninja -Cbuild install


git clone https://github.com/haasn/libplacebo.git
cd libplacebo
git submodule update --init
meson setup build
meson configure build   -Dvulkan=enabled -Dshaderc=enabled
meson compile -C build
sudo meson install -C build


sudo apt build-dep libplacebo && apt source libplacebo && cd libplacebo-2.72.2/ && meson build && git clone https://github.com/haasn/libplacebo.git &&   ninja -C build && sudo ninja -C build install
