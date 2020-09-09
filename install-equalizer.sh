apt install python3-pip bc swh-plugins meson && pip3 install ninja && \
meson build && \
cd build && ?\
ninja && \
sudo ninja install
