cd ~/ffmpeg_sources/ && git clone https://github.com/haasn/libplacebo.git && \
cd ~/ffmpeg_sources/libplacebo && \ 
DIR=./build && DIR=./build && meson $DIR  && \
meson configure $DIR   -Dvulkan=enabled -Dshaderc=enabled  && \
ninja -C$DIR  && \
sudo ninja -Cbuild install
