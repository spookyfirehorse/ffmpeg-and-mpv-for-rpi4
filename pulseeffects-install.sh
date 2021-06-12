sudo apt build-dep lsp-plugins && sudo apt install php-all-dev sndfile-tools libsndfile1-dev && cd ~/ffmpeg_sources/  && \ 
git clone  https://salsa.debian.org/multimedia-team/lsp-plugins.git && \
cd ~/ffmpeg_sources/lsp-plugins && ./build-armv7a.sh && \
make -j4 && \
sudo make install %% \
sudo apt install -y libfftw3-bin libfftw3-dev  && \
cd ~/ffmpeg_sources && git clone https://github.com/swh/ladspa.git  && \
autoreconf -i && \
./configure && \
make -j4 && \
sudo make install && \
sudo apt build-dep lsp-plugins pulseeffects && sudo apt install ladspa-sdk lv2-dev mda-lv2 rubberband-ladspa swh-lv2 zam-plugins calf-plugins  \
cd ~/ffmpeg_sources &&  git clone https://github.com/wwmm/pulseeffects.git && cd ~/ffmpeg_sources/pulseeffects && git checkout v4.7.0 && meson _build --prefix=/usr/local && sudo ninja -C _build install
cd ~/ffmpeg_sources/pulseeffects &&\
git checkout v4.8.5 && \
meson _build --prefix=/usr/local &&\ 
sudo ninja -C _build install

