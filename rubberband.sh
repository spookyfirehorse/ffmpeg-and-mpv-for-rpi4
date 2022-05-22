cd ~/ffmpeg_sources/ && git clone https://github.com/breakfastquay/rubberband.git && \
cd ~/ffmpeg_sources/rubberband &&  LDFLAGS=-latomic meson build && ninja -C build && sudo ninja -j4 -C build install
