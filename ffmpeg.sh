sudo apt purge -y libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev  ffmpeg mpv   && \
mkdir -p ~/bin &&  \
cd ~/ffmpeg_sources && wget https://ffmpeg.org/releases/ffmpeg-4.3.1.tar.bz2 && tar xjvf ffmpeg-4.3.1.tar.bz2 && cd ffmpeg-4.3.1 && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" \
./configure --prefix="$HOME/ffmpeg_build" --pkg-config-flags="--static" --extra-cflags="-I$HOME/ffmpeg_build/include" \
--extra-ldflags="-L$HOME/ffmpeg_build/lib" --extra-libs="-lpthread -lm" --bindir="$HOME/bin" \
--enable-gpl --enable-libaom --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libv4l2 \
--enable-libxvid --enable-sdl2 --enable-libx264 --enable-pthreads --enable-openssl --enable-nonfree --disable-debug --enable-libsoxr --enable-version3 \
--enable-libvpx --disable-doc --disable-htmlpages --enable-libpulse --enable-libssh --disable-manpages --disable-podpages --enable-opengl --enable-libzvbi \
--enable-avfilter --enable-filters --enable-mmal --enable-omx --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx  \
--enable-runtime-cpudetect --enable-libwebp --disable-avresample --enable-swresample --enable-x86asm --enable-libjack --enable-shared --disable-static \
--enable-librubberband --disable-vdpau --disable-vaapi --enable-gmp --enable-hardcoded-tables --disable-stripping && \
PATH="$HOME/bin:$PATH" make -j 4 && sudo make install && cd ~/bin && sudo cp ff* /usr/local/bin/ && \
export CPATH=~/ffmpeg_build/include && \
export LD_LIBRARY_PATH=~/ffmpeg_build/lib && \
export PKG_CONFIG_PATH=~/ffmpeg_build/lib/pkgconfig:/opt/vc/lib/pkgconfig 
