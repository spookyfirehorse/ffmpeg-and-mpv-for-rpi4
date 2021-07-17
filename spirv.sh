cd ~/ffmpeg_sources/ && git clone https://github.com/KhronosGroup/SPIRV-Cross.git  && \
cd SPIRV-Cross   && \
./checkout_glslang_spirv_tools.sh && ./build_glslang_spirv_tools.sh  && \
cd ..  && \
mkdir cross  && \
cd cross  && \
cmake -j4 -DSPIRV_CROSS_SHARED=ON -DSPIRV_CROSS_STATIC=ON  -DSPIRV_CROSS_CLI=ON   ../SPIRV-Cross  && \
make -j4  && \
sudo make install
