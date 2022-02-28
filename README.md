
INSTALL FFMPEG for RPI4 32 bit + 64bit with nonfree codecs v4l2_request sand usw. + mmal on 32 bit

+MPV




mkdir ffmpeg_sources

cd ffmpeg_sources

install dev files for mesa ffmpeg usw.


FFMPEG RPI  

sudo apt build-dep ffmpeg mpv mplayer mesa vlc libplacebo pulseeffects pulseaudio && sudo apt install libdrmlibx11-xcb-dev libxext-dev libxdamage-dev libxfixes-dev python3-mako libxcb-randr0-dev libxrandr-dev libxcb-xinerama0-dev libxinerama-dev libxcursor-dev libxcb-cursor-dev libxkbcommon-dev xutils-dev xutils-dev libpthread-stubs0-dev libpciaccess-dev libffi-dev x11proto-xext-dev libxcb1-dev libxcb-*dev libssl-dev libgnutls28-dev x11proto-dri2-dev x11proto-dri3-dev libx11-dev libxcb-glx0-dev libx11-xcb-dev libxext-dev libxdamage-dev libxfixes-dev libva-dev x11proto-randr-dev x11proto-present-dev libclc-dev libelf-dev mesa-utils libvulkan-dev libvulkan1 libassimp-dev libdrm-dev libxshmfence-dev libxxf86vm-dev libunwind-dev libwayland-dev wayland-protocols libwayland-egl-backend-dev valgrind libzstd-dev vulkan-tools git build-essential bison flex  meson cmake cmake-data libatomic-ops-dev

sudo pip3 install ninja

########################### 

edit xdg and change to openbox windowmanager mutter is running with to much cpu


sudo nano /etc/xdg/lxsession/LXDE-pi/desktop.conf

#window_manager=mutter

window_manager=openbox

######################################################

FDK-AAC

wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/fdk-aac_2.0.2.orig.tar.gz && tar -xf fdk-aac_2.0.2.orig.tar.gz  && cd fdk-aac-2.0.2/ && autoreconf -fiv && \
./configure  --enable-shared && \
make -j4 && \
sudo make install && sudo ldconfig

###################################################
good

git clone -b dev/4.3.1/drm_prime_1  https://github.com/jc-kynesim/rpi-ffmpeg.git
    
good 

git clone -b  4.3-libreelec-rpi  https://github.com/LibreELEC/FFmpeg.git


good 

git clone  https://github.com/andy-hayes/rpi-ffmpeg.git

64 bit FFMPEG


git clone https://github.com/andy-hayes/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr  --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --libdir=/usr/lib/aarch64-linux-gnu --cpu=cortex-a72 --arch=arm64 --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --disable-mmal --enable-neon --enable-v4l2-request --enable-libudev --enable-sand --libdir=/usr/lib/aarch64-linux-gnu  --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libfdk-aac --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-epoxy   --enable-libxcb --enable-libzimg  --enable-vout-drm --disable-vaapi --disable-vdpau   --enable-libv4l2 --enable-rpi --enable-vout-egl  --disable-static && make -j4 && sudo make -j4 install


########


32 bit FFMPEG

git clone https://github.com/andy-hayes/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --toolchain=hardened --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --incdir=/usr/include/arm-linux-gnueabihf --arch=arm --extra-libs='-lpthread -lm -latomic' --extra-cflags=-I/usr/include/libdrm --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libpulse --enable-nonfree --enable-libfdk-aac --enable-libx265 --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-vulkan --disable-vdpau --disable-vaapi --arch=arm --enable-mmal --enable-avresample --disable-filter=resample --enable-libwavpack --enable-libkvazaar --enable-libv4l2 --enable-sand --enable-vout-drm --enable-vout-egl --enable-v4l2-request --enable-libudev --enable-rpi --cpu=cortex-a72 --enable-neon --enable-v4l2-request --enable-libudev --enable-sand --enable-pocketsphinx --disable-static --enable-opencl  && make -j4 && sudo make -j4 install



#############################################
#####################################################

MPV

apt source mpv && cd mpv-0.32.0  && chmod 777 waf && ./waf configure --enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2 --enable-libmpv-shared --disable-libplacebo --disable-vulkan --disable-vaapi --disable-vdpau --enable-ffmpeg-strict-abi && ./waf -j4 && sudo .waf -j4 install


ZIMG optional

cd ~/ffmpeg_sources/ && git clone https://github.com/sekrit-twc/zimg.git &&  cd zimg  && ./autogen.sh  && ./configure --enable-x86simd  && make -j4  && sudo make install

CELLULOID mpv player with sidebar


apt source celluloid && cd celluloid* && meson build && cd build && ninja -j4 && sudo ninja install

############################




################################################

nano .config/mpv/mpv.conf

and put this in:


#####################################

opengl-glfinish=yes

framedrop=decoder+vo

gpu-context=x11egl

gpu-api=opengl

vo=gpu

hwdec=hevc-drm-copy

gpu-hwdec-interop=drmprime-drm

#hwdec=h264_mmal-mmal-copy

#h264_v4l2m2m-v4l2m2m-copy

hwdec-image-format=yuv420p

##better-sound

af=lavfi-crystalizer=1,lavfi-bass=gain=1

[omx]

hwdec=hevc-drm-copy

ovc=h264_v4l2m2m

hwdec-image-format=yuv420p

ovcopts-add=b=2M

oac=libfdk_aac

oacopts-add=b=128k

#audio-samplerate=44100

hls-bitrate=max

cache=yes

framedrop=decoder+vo

#demuxer-max-bytes=2000MiB

#demuxer-readahead-secs=300

#no-correct-pts

#fps=25

##########################
EXAMPLES

#########################################################

###  exampe convert movie

mpv test.avi --profile=omx --o=test.mp4


##################################################################


streaming over ssh example

ssh user@host from desktop computer

arecord -L   show the alsa device on the rpi

than on the desktop pc open a terminal change the alsa device and run

ssh pi@rpi ffmpeg -async 1  -fflags nobuffer  -hide_banner -threads auto -strict experimental  \
 -f alsa -thread_queue_size 1024  -ar 48000 -ac 1  -i hw:CARD=Device,DEV=0 \
 -f v4l2 -re  -input_format yuv420p  -i /dev/video0  -c:v  h264_v4l2m2m   -pix_fmt yuv420p   -b:v 1M \
 -c:a libopus -application lowdelay -b:a 32k  \
 -f  mpegts  - |  mpv --cache=no   --profile=low-latency --volume=30  -
 
 

in my case hw:CARD=Device,DEV=0 -ac 2 stand for stereo mic , -ac 1 mono 1 audio channel 

/dev/video0 the camera

############################
 
 mpv output webcam +audio mic

mpv av://v4l2:/dev/video0 --audio-file=av://alsa:hw:0 --profile=low-latency --untimed

###########################################

 convert avi to mp4
 
 
ffmpeg -hwaccel drm -i /media/moon/Filme/test.avi   -c:v h264_v4l2m2m -b:v 2M   -pix_fmt yuv420p -c:a libfdk_aac  -profile:a aac_he -b:a 64k  -f mp4  test.mp4


for file in "$1"; do ffmpeg -hwaccel drm -i "$file"  -c:v h264_v4l2m2m -b:v 1500k -pix_fmt yuv420p  -trellis 2 -cmp 2 -subcmp 2  -g 60  -c:a libfdk_aac  -b:a 96k -f mp4 "${file%.*}_1.mp4"; done

