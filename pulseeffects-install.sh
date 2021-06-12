sudo apt build-dep pulseeffects && sudo apt install ladspa-sdk lv2-dev mda-lv2 rubberband-ladspa swh-lv2 zam-plugins  \
cd ~/ffmpeg_sources &&  git clone https://github.com/wwmm/pulseeffects.git && cd ~/ffmpeg_sources/pulseeffects && git checkout v4.7.0 && meson _build --prefix=/usr/local && sudo ninja -C _build install
cd ~/ffmpeg_sources/pulseeffects &&\
git checkout v4.8.5 && \
meson _build --prefix=/usr/local &&\ 
ninja -C _build install

