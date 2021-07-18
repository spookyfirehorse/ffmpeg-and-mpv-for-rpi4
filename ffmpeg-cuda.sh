git clone https://github.com/FFmpeg/FFmpeg.git && cd FFmpeg && \
./configure --prefix=/usr/local --enable-gpl --enable-nonfree  --toolchain=hardened --enable-libvpx  \
--enable-cuda --enable-cuda-llvm --enable-vaapi --enable-nvdec --enable-cuvid --enable-nvenc --enable-ffnvcodec  --disable-stripping \
--enable-libsoxr --enable-libpulse --enable-gnutls --enable-ladspa --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio \
--enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack \
--enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libssh --enable-librsvg  --enable-libshine \
--enable-libsnappy --enable-libspeex --enable-libopus  --enable-libtheora --enable-libtwolame --enable-libvorbis  --enable-libwebp \
--enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --disable-doc --disable-htmlpages --disable-manpages --enable-libzvbi --enable-lv2 \
--enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-omx --enable-libdc1394 --enable-libdrm --enable-frei0r --enable-libx264  --enable-avisynth \
--enable-libsrt  --enable-libfdk-aac  --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-version3 \
--libdir=/usr/local/lib/x86_64-linux-gnu --incdir=/usr/local/include/x86_64-linux-gnu --enable-chromaprint \
--enable-liblensfun --enable-libdav1d --enable-lv2 --enable-libwebp --enable-libvpx --enable-libv4l2 --enable-libspeex   \
--enable-vapoursynth  --enable-librubberband --enable-libaom --enable-libmfx --enable-libsvtav1 --enable-libdav1d  --enable-libkvazaar --enable-pthreads \
--enable-libsnappy --enable-shared --enable-libnpp  --enable-v4l2-m2m --extra-cflags=-I/usr/local/cuda/include/ --extra-ldflags=-L/usr/local/cuda/lib64/  \
  && make -j4 && sudo make install && make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/local/bin/ && sudo ldconfig
