DIR=./build && \
meson $DIR && \
ninja -C$DIR && \
sudo ninja -Cbuild install
