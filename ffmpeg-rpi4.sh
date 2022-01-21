sudo apt build-dep ffmpeg && mkdir ffmpeg_sources && cd ~/ffmpeg_sources &&  apt source ffmpeg && cd ~/ffmpeg_sources/ffmpeg-4.4.1 && \
./configure --prefix=/usr --extra-version=2+rpi1+b1 --toolchain=hardened --libdir=/usr/lib/arm-linux-gnueabihf \
--incdir=/usr/include/arm-linux-gnueabihf --arch=arm --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa \
--enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 \
--enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm \
--enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse \
--enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt \
--enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp \
--enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx \
--enable-openal --enable-opencl --enable-opengl --enable-sdl2 --extra-libs=-latomic --enable-pocketsphinx --enable-librsvg \
--enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared \
--enable-nonfree --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libpulse --enable-nonfree --enable-libfdk-aac \
--enable-libkvazaar --enable-libx265 --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages \
--enable-vulkan  --disable-vdpau --disable-vaapi --enable-libsvtav1 --extra-libs="-lpthread -lm -latomic" \
&& make -j4 && sudo make install && make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig
