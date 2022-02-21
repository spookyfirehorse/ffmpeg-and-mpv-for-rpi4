#mkdir -p ~/ffmpeg_sources && \
#cd ~/ffmpeg_sources && \
#git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
#cd fdk-aac && \
#autoreconf -fiv && \
#./configure  --enable-shared && \
#make -j4 && \
#sudo make install && sudo ldconfig

wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/fdk-aac_2.0.2.orig.tar.gz && tar -xf fdk-aac_2.0.2.orig.tar.gz  && cd fdk-aac-2.0.2/ && autoreconf -fiv && \
./configure  --enable-shared && \
make -j4 && \
sudo make install && sudo ldconfig
