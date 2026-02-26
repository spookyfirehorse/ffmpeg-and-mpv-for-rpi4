
git clone  https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure  --enable-shared && \
make -j4 && \
sudo make install && sudo ldconfig

git clone https://github.com/mstorsjo/fdk-aac


1. Für den Raspberry Pi 5 (64-Bit, Cortex-A76)
autoreconf -fiv && \
./configure \
  --prefix=/usr \
  --enable-shared \
  --disable-static \
  --host=aarch64-linux-gnu \
  CFLAGS="-mcpu=cortex-a76 -O3 -pipe -ftree-vectorize" \
  CXXFLAGS="-mcpu=cortex-a76 -O3 -pipe -ftree-vectorize" \
  LDFLAGS="-Wl,-O1,--as-needed" && \
make -j$(nproc) && \
sudo make install && sudo ldconfig

1. Für den Raspberry Pi 5 (64-Bit, Cortex-A76)
autoreconf -fiv && \
./configure \
  --prefix=/usr \
  --enable-shared \
  --disable-static \
  --host=aarch64-linux-gnu \
  CFLAGS="-mcpu=cortex-a72 -O3 -pipe -ftree-vectorize" \
  CXXFLAGS="-mcpu=cortex-a72 -O3 -pipe -ftree-vectorize" \
  LDFLAGS="-Wl,-O1,--as-needed" && \
make -j$(nproc) && \
sudo make install && sudo ldconfig

2. Für den Raspberry Pi 3 (32-Bit, Cortex-A53)
Hier aktivieren wir zusätzlich die NEON-Einheit (VFPv4), um Audio-Berechnungen in Hardware zu beschleunigen.
bash
sudo apt update && sudo apt install -y autoconf libtool [Debian Package Search](https://packages.debian.org) && \
git clone https://github.com && \
cd fdk-aac && \
autoreconf -fiv && \
./configure \
  --prefix=/usr \
  --enable-shared \
  --disable-static \
  --host=arm-linux-gnueabihf \
  CFLAGS="-mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -O3 -pipe" \
  CXXFLAGS="-mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -O3 -pipe" && \
  LDFLAGS="-Wl,-O1,--as-needed" && \
make -j4 && \
sudo make install && sudo ldconfig



#alternative

#wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/fdk-aac_2.0.2.orig.tar.gz && tar -xf fdk-aac_2.0.2.orig.tar.gz  && cd fdk-aac-2.0.2/ && autoreconf -fiv && \
#./configure  --enable-shared && \
#make -j4 && \
#sudo make install && sudo ldconfig

wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2t64_2.0.3-1_armhf.deb
wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.3-1_armhf.deb


wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.3-1_arm64.deb
wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2t64_2.0.3-1_arm64.deb


wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.3-1_amd64.deb
wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2t64_2.0.3-1_amd64.deb

sudo dpkg -i libfdk-aac*
