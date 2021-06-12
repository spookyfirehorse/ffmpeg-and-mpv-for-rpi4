cd ~/ffmpeg_sources/ && git clone  https://github.com/acoustid/chromaprint.git && \
cd ~/ffmpeg_sources/chromaprint && \
cmake --prefix=/usr/local -DCMAKE_BUILD_TYPE=Release -DBUILD_TOOLS=ON . && make -j4 && sudo make install
