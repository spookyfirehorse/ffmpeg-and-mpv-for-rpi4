sudo apt install python3-pip bc ninja ninja-build meson libfftw3-bin libfftw3-dev && \
cd ~/ffmpeg_sources/ && git clone https://github.com/swh/ladspa.git  && \
autoreconf -i && \
./configure && \
make -j4 && \
sudo make install && \
cd ~/ffmpeg_sources && git clone https://github.com/pulseaudio-equalizer-ladspa/equalizer.git &&\
cd equalizer && \
meson build && \
cd build && \
ninja && \
sudo ninja install

