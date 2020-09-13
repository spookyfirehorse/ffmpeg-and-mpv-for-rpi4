#sudo pip3 install ninja && \
cd ~/ffmpeg_sources && git clone https://github.com/hoene/libmysofa.git && \
apt install zlib1g-dev libcunit1-dev libcunit1-dev && \
cd build  && \
cmake -DCMAKE_BUILD_TYPE=Debug ..  && \
cd build && cpack  && \
sudo apt purge libmysofa-dev  && \
sudo dpkg -i libmysofa-1.0.0-Linux.deb && \
git clone https://github.com/AviSynth/AviSynthPlus.git && \
cd AviSynthPlus && /
mkdir avisynth-build && cd avisynth-build && \ 
cmake ../ -DHEADERS_ONLY:bool=on  && \
sudo make install && \  
sudo apt install glslang* spirv-toolsapt install glslang* spirv-tools && \
sudo apt purge libplacebo* && \
git clone https://github.com/haasn/libplacebo.git && \
cd libplacebo && /
DIR=./build && \
meson $DIR  && \
ninja -C$DIR  && \
sudo ninja -Cbuild install && \
git clone --depth 1 https://github.com/Haivision/srt.git && \
cd ~/ffmpeg_sources/srt && \
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
make -j4 && \
make install



