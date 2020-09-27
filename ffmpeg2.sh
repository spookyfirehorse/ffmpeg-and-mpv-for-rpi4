mkdir -p ~/bin &&  \
mkdir -p ~/ffmpeg_sources &&  \
cd ~/ffmpeg_sources && git clone https://github.com/FFmpeg/FFmpeg.git && cd FFmpeg 
./configure --prefix=/usr/local --enable-gpl --enable-cuda --enable-cuda-nvcc --enable-cuda-llvm  --enable-vaapi \
--enable-nvdec --enable-cuvid --enable-nvenc --enable-ffnvcodec --enable-libnpp  --enable-nvenc --enable-ffnvcodec \
--enable-libnpp --enable-vapoursynth --disable-stripping --enable-libsoxr --enable-libpulse --enable-avresample --disable-filter=resample \
--enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca \
--enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi \
--enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt \
--enable-libopus --enable-libssh --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libspeex \
--enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack \
--enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --disable-doc --disable-htmlpages \
--disable-manpages --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-omx \
--enable-libdc1394 --enable-libdrm  --enable-chromaprint --enable-frei0r --enable-libx264 --enable-avisynth --enable-libsrt \
--enable-shared --enable-libfdk-aac --enable-nonfree --enable-liblensfun --enable-libopencore_amrnb --enable-version3 && \
make -j4 && sudo make install && make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/local/bin/ && ldconfig
