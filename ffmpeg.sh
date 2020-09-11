mkdir -p ~/bin &&  \
mkdir -p ~/ffmpeg_sources &&  \
cd ~/ffmpeg_sources && apt source ffmpeg && cd ffmpeg-4.1.6 && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" \
./configure --prefix="$HOME/ffmpeg_build" --pkg-config-flags="--static" --extra-cflags="-I$HOME/ffmpeg_build/include" \
--extra-ldflags="-L$HOME/ffmpeg_build/lib" --extra-libs="-lpthread -lm" --bindir="$HOME/bin" \
--enable-gpl --disable-stripping --enable-libsoxr --enable-libfdk-aac --enable-nonfree --enable-libpulse  --enable-avresample --disable-filter=resample  \
--enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite \
 --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg \
 --enable-libopenmpt --enable-libopus --enable-libssh --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy  --enable-libspeex --enable-libssh \
 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid \
 --enable-libzmq --disable-doc --disable-htmlpages --disable-manpages  --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opengl --enable-sdl2\
 --enable-mmal --enable-omx --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx  --enable-neon  --enable-libdc1394 --enable-libdrm --enable-libiec61883 \
 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-avisynth  --enable-static --incdir=~/ffmpeg_build/include/arm-linux-gnueabihf  --libdir=~/ffmpeg_build/lib/arm-linux-gnueabihf --cpu=arm1176jzf-s --arch=arm   && \
PATH="$HOME/bin:$PATH" make -j 4 && make install

#export CPATH=~/ffmpeg_build/include && \
#export LD_LIBRARY_PATH=~/ffmpeg_build/lib && \
##export PKG_CONFIG_PATH=~/ffmpeg_build/lib/pkgconfig:/opt/vc/lib/pkgconfig 
