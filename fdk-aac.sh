
git clone  https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure  --enable-shared && \
make -j4 && \
sudo make install && sudo ldconfig

#alternative

#wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/fdk-aac_2.0.2.orig.tar.gz && tar -xf fdk-aac_2.0.2.orig.tar.gz  && cd fdk-aac-2.0.2/ && autoreconf -fiv && \
#./configure  --enable-shared && \
#make -j4 && \
#sudo make install && sudo ldconfig

http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2t64_2.0.3-1_armhf.deb
http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.3-1_armhf.deb


http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.3-1_arm64.deb
http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2t64_2.0.3-1_arm64.deb


http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.3-1_amd64.deb
http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2t64_2.0.3-1_amd64.deb
