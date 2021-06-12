cd ~/ffmpeg_sources && \
git -C aom pull 2> /dev/null || git clone --depth 1 https://aomedia.googlesource.com/aom && \
mkdir -p aom_build && \
cd aom_build && \
cmake AOM_SRC -DCMAKE_C_FLAGS="-mfpu=vfp -mfloat-abi=hard" -G "Unix Makefiles" -DENABLE_SHARED=off -DENABLE_NASM=on ../aom && \
make -j4 && \
sudo make install
