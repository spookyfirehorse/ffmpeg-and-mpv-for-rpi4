apt install -y libfftw3-bin libfftw3-dev  && \
cd ~/ffmpeg_sources && git clone https://github.com/swh/ladspa.git  && \
autoreconf -i && \
./configure && \
make -j4 && \
sudo make install
