cd ~/ffmpeg_sources/ && git clone https://github.com/google/shaderc  && \
mkdir -p shaderc_build && cd shaderc && ./utils/git-sync-deps && cd ~/ffmpeg_sources/shaderc_build && \
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../shaderc && sudo ninja install
