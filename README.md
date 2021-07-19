Only 3 3b+ and 4 cortexa8




mkdir -p ~/ffmpeg_sources && \
cd ~/ffmpeg_sources && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure  --disable-shared && \
make -j4 && \
sudo make install && sudo ldconfig





Compile FFmpeg


sudo apt build-dep ffmpeg && sudo apt install libv4l-dev && mkdir -p ffmpeg_sources && \
cd ~/ffmpeg_sources &&  git clone https://github.com/FFmpeg/FFmpeg.git && cd FFmpeg && \
./configure --prefix=/usr/local --enable-gpl --enable-nonfree --extra-libs="-lpthread -lm -latomic" --toolchain=hardened --enable-libvpx  \
--enable-vaapi --disable-stripping --libdir=/usr/local/lib/arm-linux-gnueabihf --incdir=/usr/local/include/arm-linux-gnueabihf \
--enable-libsoxr --enable-libpulse --enable-gnutls --enable-ladspa --enable-libass --enable-libbluray --enable-libbs2b  --enable-libcdio \
--enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack \
--enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libssh --enable-librsvg  --enable-libshine \
--enable-libsnappy --enable-libspeex --enable-libopus  --enable-libtheora --enable-libtwolame --enable-libvorbis  --enable-libwebp \ 
--enable-libxml2 --enable-libxvid --enable-libzmq --disable-doc --disable-htmlpages --disable-manpages --enable-libzvbi --enable-lv2 \
--enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-omx --enable-libdc1394 --enable-libdrm --enable-frei0r --enable-libx264   \
--enable-libsrt --enable-shared --enable-libfdk-aac --cpu=cortex-a8  --enable-libx265 --enable-libx264 \
 --enable-lv2 --enable-libwebp --enable-libvpx --enable-libv4l2 --enable-libspeex   \
--enable-librubberband --enable-libaom  --enable-pthreads --enable-v4l2-m2m --arch=arm \
--enable-libsnappy --enable-mmal --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx \
&& make -j4 && sudo make install && make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig

###########################

MPV
cd ~/ffmpeg_sources && git clone https://github.com/mpv-player/mpv.git && \
cd ~/ffmpeg_sources/mpv && \
./bootstrap.py && \
export PKG_CONFIG_PATH=/opt/vc/lib/pkgconfig && ./waf configure --enable-rpi --enable-rpi-mmal  --enable-egl-drm --enable-gl-x11 \
--enable-egl --enable-sdl2 --enable-ffmpeg-strict-abi  --enable-egl-x11  && 
./waf -j4 && sudo  ./waf install 

examples for streaming

ssh only key identification

video + audio

ssh user@host  ffmpeg -vsync 0  -fflags nobuffer  -hide_banner -threads 4 -strict -2  \
 -f alsa -ar 48000 -ac 1  -i hw:CARD=Device,DEV=0 \
 -f v4l2 -r 5 -i /dev/video0 -c:v h264_omx -profile:v high -level 4 -pix_fmt yuv420p -b:v 1M  \
 -c:a libfdk_aac -profile:a aac_he  -b:a 64k   -movflags +faststart \
 -f  matroska  - |  mpv --cache=no   --profile=low-latency --volume=70  -

only -video


ssh user@host  ffmpeg -vsync 0  -fflags nobuffer  -hide_banner -threads 4 -strict -2  \
 -f v4l2 -r 5 -i /dev/video0 -c:v h264_omx -profile:v high -level 4 -pix_fmt yuv420p -b:v 1M \
 -f  matroska  - |  mpv --cache=no   --profile=low-latency --volume=70  -

-r framerate
-ac audio channels
arecord -L for audio card 
