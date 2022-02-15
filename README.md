sudo apt build-dep ffmpeg mpv mplayer mesa vlc libplacebo


sudo apt-get install libx11-xcb-dev libxext-dev libxdamage-dev libxfixes-dev

sudo apt-get install python3-mako libxcb-randr0-dev libxrandr-dev libxcb-xinerama0-dev libxinerama-dev libxcursor-dev

sudo apt-get install libxcb-cursor-dev libxkbcommon-dev xutils-dev xutils-dev libpthread-stubs0-dev libpciaccess-dev

sudo apt-get install libffi-dev x11proto-xext-dev libxcb1-dev libxcb-*dev libssl-dev libgnutls28-dev x11proto-dri2-dev

sudo apt-get install x11proto-dri3-dev libx11-dev libxcb-glx0-dev libx11-xcb-dev libxext-dev libxdamage-dev libxfixes-dev

sudo apt-get install libva-dev x11proto-randr-dev x11proto-present-dev libclc-dev libelf-dev mesa-utils libvulkan-dev libvulkan1 libassimp-dev

sudo apt-get install libdrm-dev libxshmfence-dev libxxf86vm-dev libunwind-dev libwayland-dev wayland-protocols libwayland-egl-backend-dev valgrind libzstd-dev vulkan-tools

sudo apt-get install git build-essential bison flex ninja-build



#
sudo apt purge meson -y

sudo pip3 install meson

sudo apt purge cmake -y

sudo pip3 install cmake

sudo pip3 install mako


git clone -b 21.3 https://gitlab.freedesktop.org/mesa/mesa.git
cd mesa

CFLAGS="-mcpu=cortex-a72 -mfpu=neon-fp-armv8" CXXFLAGS="-mcpu=cortex-a72 -mfpu=neon-fp-armv8" \
meson --prefix /usr -D platforms=x11 -D vulkan-drivers=broadcom -D dri-drivers= -D gallium-drivers=kmsro,v3d,vc4 -D buildtype=release build

ninja -C build -j4 && sudo ninja -C build install


SPIRV

cd ~/ffmpeg_sources/ && git clone https://github.com/KhronosGroup/SPIRV-Cross.git  && \
cd SPIRV-Cross   && \
./checkout_glslang_spirv_tools.sh && ./build_glslang_spirv_tools.sh  && \
cd ..  && \
mkdir cross  && \
cd cross  && \
cmake -j4 -DSPIRV_CROSS_SHARED=ON -DSPIRV_CROSS_STATIC=ON  -DSPIRV_CROSS_CLI=ON   ../SPIRV-Cross  && \
make -j4  && \
sudo make install

SHADERC

cd ~/ffmpeg_sources/ && git clone https://github.com/google/shaderc  && \
mkdir -p shaderc_build && cd shaderc && ./utils/git-sync-deps && cd ~/ffmpeg_sources/shaderc_build && \
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../shaderc && ninja install



PLACEBO

cd ~/ffmpeg_sources/ && git clone -b v2.72.2  https://github.com/haasn/libplacebo.git && \
cd ~/ffmpeg_sources/libplacebo && \ 
DIR=./build && DIR=./build && meson $DIR  && \
meson configure $DIR   -Dvulkan=enabled -Dshaderc=enabled  && \
ninja -C$DIR  && \
sudo ninja -Cbuild install



install fdkaac


mkdir -p ~/ffmpeg_sources &&
cd ~/ffmpeg_sources &&
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac &&
cd fdk-aac &&
autoreconf -fiv &&
./configure --enable-shared &&
make -j4 &&
sudo make install && sudo ldconfig


KVAZAAR

git clone https://github.com/ultravideo/kvazaar.git &&  cd kvazaar && \
./autogen.sh && \
./configure && \
make -j4 &&\
sudo make install






#########################
install openh264 optional


git clone https://github.com/cisco/openh264.git && cd openh264 && make -j4   && sudo make -j4 install 


#########################




Video out hevc-drm-copy gpu support for pi4


git clone https://github.com/Kwiboo/FFmpeg.git

cd FFmpeg

git checkout -b v4l2-request-hwaccel-rpi


./configure --prefix=/usr --toolchain=hardened --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-mmal --enable-neon  --enable-v4l2-request --enable-libudev  --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared  --enable-nonfree --enable-libfdk-aac --extra-cflags=-I/usr/include/libdrm  --enable-lv2 --enable-libkvazaar --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --eenable-libopenh264

make -j4

sudo make -j4 install

###################

install mpv


sudo apt build-dep mpv && \ cd ffmpeg_sources  && apt source mpv && cd ~/ffmpeg_sources/mpv-0.34.0 && chmod 777 waf && ./waf configure   --enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2    --enable-xv  --enable-egl-x11 --enable-libplacebo --enable-vulkan  --enable-zimg  --enable-libmpv-shared --enable-lua  && \
./waf -j4 && sudo  ./waf install

CELLULOID


apt source celluloid && cd celluloid* 
meson build && cd build && ninja -j4 && sudo ninja install





################################################

nano .config/mpv/mpv.conf

and put this in:


#####################################

opengl-glfinish=yes

framedrop=decoder+vo

gpu-context=x11egl

gpu-api=opengl

vo=gpu

#hwdec=hevc-drm-copy

hwdec=h264_mmal-mmal-copy

#h264_v4l2m2m-v4l2m2m

hwdec-image-format=yuv420p

##better-sound

af=lavfi-crystalizer=1,lavfi-bass=gain=1,scaletempo2


##################################################################

install aomcodec

cd ~/ffmpeg_sources && git -C SVT-AV1 pull 2> /dev/null || git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git && \
mkdir -p SVT-AV1/build && cd SVT-AV1/build && cmake -G "Unix Makefiles"  -DCMAKE_BUILD_TYPE=Release -DBUILD_DEC=OFF -DBUILD_SHARED_LIBS=OFF .. && make -j4 && sudo make install

#############################################################

install ffmpeg 4.4.1

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
--enable-vulkan  --disable-vdpau --enable-libsvtav1 --enable-mmal  \
&& make -j4 && sudo make install && make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig

optional --enable-libopenh264

#############################################################




streaming over ssh example

ssh user@host from desktop computer

arecord -L   show the alsa device on the rpi

than on the desktop pc open a terminal change the alsa device and run

ssh pi@rpi ffmpeg -async 1  -fflags nobuffer  -hide_banner -threads auto -strict experimental  \
 -f alsa -thread_queue_size 1024  -ar 48000 -ac 1  -i hw:CARD=Device,DEV=0 \
 -f v4l2 -re  -input_format yuv420p  -i /dev/video0  -c:v  h264_v4l2m2m   -pix_fmt yuv420p   -b:v 1M  ->
 -c:a libopus -application lowdelay -b:a 32k  \
 -f  mpegts  - |  mpv --cache=no   --profile=low-latency --volume=30  -
 
 

in my case hw:CARD=Device,DEV=0 -ac 2 stand for stereo mic , -ac 1 mono 1 audio channel 

/dev/video0 the camera

############################
 
 mpv output webcam +audio mic

mpv av://v4l2:/dev/video0 --audio-file=av://alsa:hw:0 --profile=low-latency --untimed

