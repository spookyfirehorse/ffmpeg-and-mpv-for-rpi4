sudo apt build-dep lsp-plugins && sudo apt install php-all-dev sndfile-tools libsndfile1-dev && cd ~/ffmpeg_sources/  && \ 
git clone  https://salsa.debian.org/multimedia-team/lsp-plugins.git && \
cd ~/ffmpeg_sources/lsp-plugins && ./build-aarch64.sh && \
make -j4 && \
sudo make install %% \
sudo apt install -y libfftw3-bin libfftw3-dev  && \
cd ~/ffmpeg_sources && git clone https://github.com/swh/ladspa.git &&  cd ~/ffmpeg_sources/ladspa && \
autoreconf -i && \
./configure && \
make -j4 && \
sudo make install && \
sudo apt build-dep lsp-plugins pulseeffects && sudo apt install ladspa-sdk lv2-dev mda-lv2 rubberband-ladspa swh-lv2 zam-plugins calf-plugins  \
cd ~/ffmpeg_sources &&  apt source pulseeffects && cd ~/ffmpeg_sources/pulseeffects-4.8.4/ && \
meson _build --prefix=/usr/ &&\ 
ninja -j4 -C _build install
