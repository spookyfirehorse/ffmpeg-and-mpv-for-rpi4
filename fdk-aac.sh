mkdir -p ~/ffmpeg_sources && \
cd ~/ffmpeg_sources && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure  --enable-shared && \
make -j4 && \
sudo make install && sudo ldconfig
