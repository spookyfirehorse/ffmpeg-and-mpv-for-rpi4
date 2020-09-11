sudo apt install python3-pip bc swh-plugins meson && sudo pip3 install ninja && \
cd ~/ffmpeg_sources && git clone https://github.com/pulseaudio-equalizer-ladspa/equalizer.git &&\
cd equalizer && \
meson build && \
cd build && \
ninja && \
sudo ninja install

