
Video out gpu support for pi4

sudo nano /etc/apt/sources.list

change deb-src from bullseye to testing for ffmpeg 4.4 and mpv 0.34

deb-src http://raspbian.raspberrypi.org/raspbian/ testing main contrib non-free rpi

sudo apt update  

for ffmpeg 4.3 without update the sources.list take this config

./configure --prefix=/usr --extra-version=2+rpi1+b1 --toolchain=hardened --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --incdir=/usr/include/arm-linux-gnueabihf --arch=arm --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --extra-libs=-latomic --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libpulse --enable-nonfree --enable-libfdk-aac --enable-libx265 --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-vulkan --disable-vdpau --disable-vaapi  --enable-mmal --extra-libs="-lpthread -lm -latomic"


optional --enable-libopenh264

########################################################

install fdkaac


mkdir -p ~/ffmpeg_sources &&
cd ~/ffmpeg_sources &&
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac &&
cd fdk-aac &&
autoreconf -fiv &&
./configure --enable-shared &&
make -j4 &&
sudo make install && sudo ldconfig

#########################
install openh264 optional


git clone https://github.com/cisco/openh264.git && cd openh264 && make -j4  OS=linux ARCH=x86_64 && sudo make -j4 install 


#########################

install aomcodec

cd ~/ffmpeg_sources && git -C SVT-AV1 pull 2> /dev/null || git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git && \
mkdir -p SVT-AV1/build && cd SVT-AV1/build && cmake -G "Unix Makefiles"  -DCMAKE_BUILD_TYPE=Release -DBUILD_DEC=OFF -DBUILD_SHARED_LIBS=OFF .. && make -j4 && sudo make install

#############################################################

install ffmpeg 

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
--enable-vulkan  --disable-vdpau --disable-vaapi --enable-libsvtav1 --enable-mmal --extra-libs="-lpthread -lm -latomic" \
&& make -j4 && sudo make install && make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig

optional --enable-libopenh264

#############################################################

install mpv


sudo apt build-dep mpv && \ cd ffmpeg_sources &&  
cd ~/ffmpeg_sources && apt source mpv && cd ~/ffmpeg_sources/mpv-0.34.0 && chmod 777 waf && ./waf configure   --enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2    --enable-xv  --enable-egl-x11 --enable-libplacebo --enable-vulkan  --enable-zimg  --enable-libmpv-shared --enable-lua  && \
./waf -j4 && sudo  ./waf install

################################################

nano .config/mpv/mpv.conf

and put this in:


#####################################

opengl-glfinish=yes

framedrop=decoder+vo

gpu-context=x11egl

gpu-api=opengl

vo=gpu

hwdec=h264_mmal-mmal-copy

#h264_v4l2m2m-v4l2m2m

hwdec-image-format=yuv420p

##better-sound
af=lavfi-crystalizer=1,lavfi-bass=gain=1,scaletempo2
##################################################################


streaming over ssh example

ssh user@host from desktop computer

arecord -L   show the alsa device on the rpi

than on the desktop pc open a terminal change the alsa device and run

ssh pi@rpi ffmpeg -vsync 0  -fflags nobuffer  -hide_banner -threads auto -strict experimental  \
 -f alsa -thread_queue_size 1024  -ar 48000 -ac 1  -i hw:CARD=Device,DEV=0 \
 -f v4l2 -re  -input_format yuv420p  -i /dev/video0  -c:v  h264_v4l2m2m   -pix_fmt yuv420p   -b:v 1M  ->
 -c:a libopus -application lowdelay -b:a 32k  \
 -f  mpegts  - |  mpv --cache=no   --profile=low-latency --volume=50  -
 
 

in my case hw:CARD=Device,DEV=0 -ac 2 stand for stereo mic , -ac 1 mono 1 audio channel 

/dev/video0 the camera


 
 mpv output webcam +audio mic

mpv av://v4l2:/dev/video0 --audio-file=av://alsa:hw:0 --profile=low-latency --untimed

