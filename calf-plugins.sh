sudo apt build-dep calf-plugins && \
cd ~/ffmpeg_sources/ && git clone https://github.com/calf-studio-gear/calf.git && cd calf && ./autogen.sh && make -j4 && sudo make install
