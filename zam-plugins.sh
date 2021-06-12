sudo apt build-dep zam-plugins
sudo apt install pkg-config libx11-dev libgl-dev liblo-dev libjack-dev && \
cd ~/ffmpeg_sources/ && git clone https://github.com/zamaudio/zam-plugins.git && cd zam-plugins  && git submodule update --init && make -j4 && sudo make install && ldconfig
