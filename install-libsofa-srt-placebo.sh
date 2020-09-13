#sudo pip3 install ninja && \
sudo apt install zlib1g-dev libcunit1-dev libcunit1-dev  && \
cd ~/ffmpeg_sources && git clone https://github.com/hoene/libmysofa.git && cd libmysofa/build  && \
cmake -DCMAKE_BUILD_TYPE=Debug .. && cd ~/ffmpeg_sources/libmysofa/build && cpack  && \
sudo apt purge -y libmysofa-dev  && \
sudo dpkg -i libmysofa-1.0.0-Linux.deb && cd ~/ffmpeg_sources && \
git clone https://github.com/AviSynth/AviSynthPlus.git && \
cd AviSynthPlus && /
mkdir avisynth-build && cd avisynth-build && \ 
cmake ../ -DHEADERS_ONLY:bool=on  && \
sudo make install 
  
sudo apt install glslang* spirv-tools && sudo apt install glslang* spirv-tools && \
cd ~/ffmpeg_sources
sudo apt purge libplacebo* && \
git clone https://github.com/haasn/libplacebo.git && \
cd ~/ffmpeg_sources/libplacebo && /
DIR=./build && \
meson $DIR  && \
ninja -C$DIR  && \
sudo ninja -Cbuild install && \
git clone --depth 1 https://github.com/Haivision/srt.git && \
cd ~/ffmpeg_sources/srt && \
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
make -j4 && \
make install



