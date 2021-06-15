sudo apt install php-all-dev sndfile-tools libsndfile1-dev && cd ~/ffmpeg_sources/  && \ 
git clone  https://salsa.debian.org/multimedia-team/lsp-plugins.git && \
cd ~/ffmpeg_sources/lsp-plugins && ./build-armv7a.sh && \
make -j4 && \
sudo make install
