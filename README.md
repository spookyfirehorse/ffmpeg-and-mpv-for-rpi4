
INSTALL FFMPEG for RPI4 32 bit + 64bit with nonfree codecs v4l2_request sand usw. + mmal on 32 bit

+MPV


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
######

sudo ln -s /usr/include/libdrm /usr/include/drm/

###################################################

best

git clone -b kodi/4.3.2-Matrix-19.2/clean_3 https://github.com/jc-kynesim/rpi-ffmpeg.git

good original libreelec

git clone -b  4.3-libreelec-rpi  https://github.com/LibreELEC/FFmpeg.git


64 bit FFMPEG


sudo apt build-dep ffmpeg


git clone -b kodi/4.3.2-Matrix-19.2/clean_3 https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr  --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --libdir=/usr/lib/aarch64-linux-gnu --cpu=cortex-a72 --arch=arm64 --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --disable-mmal --enable-neon --enable-v4l2-request --enable-libudev --enable-sand -linux-gnu  --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libfdk-aac --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-epoxy   --enable-libxcb --enable-libzimg  --enable-vout-drm --enable-libv4l2  --enable-vout-egl  --disable-static  --extra-cflags=-I/usr/include/libdrm && make -j4 && sudo make -j4 install

make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig



########


32 bit FFMPEG

git clone -b kodi/4.3.2-Matrix-19.2/clean_3 https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --toolchain=hardened --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --incdir=/usr/include/arm-linux-gnueabihf --arch=arm --extra-libs=-latomic --extra-cflags=-I/usr/include/libdrm --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libpulse --enable-nonfree --enable-libfdk-aac --enable-libx265 --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-vulkan --arch=arm --enable-mmal --enable-avresample --disable-filter=resample --enable-libwavpack  --enable-libv4l2 --enable-sand --enable-vout-drm --enable-vout-egl --enable-v4l2-request --enable-libudev --enable-rpi --cpu=cortex-a72 --enable-neon --enable-v4l2-request --enable-libudev --enable-sand --enable-pocketsphinx --disable-static --enable-opencl  && make -j4 && sudo make -j4 install

make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig

############################################################################

rpi zero 

apt source ffmpeg

cd ffmpeg-4.3.3

./configure --prefix=/usr --extra-version=0+rpt2+deb11u1 --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-mmal --enable-neon --enable-rpi --enable-v4l2-request --enable-libudev --enable-epoxy --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf --cpu=arm1176jzf-s --arch=arm --enable-nonfree --enable-libfdk-aac


#############################################
#####################################################

MPV

sudo apt build-dep mpv

apt source mpv && cd mpv-0.32.0  && chmod 777 waf && ./waf configure --enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2 --enable-libmpv-shared --enable-libplacebo --enable-vulkan --disable-vaapi --disable-vdpau --enable-ffmpeg-strict-abi && ./waf -j4 && sudo .waf -j4 install

##############################

CELLULOID mpv player with sidebar

sudo apt build-dep celluloid

apt source celluloid && cd celluloid* && meson build && cd build && ninja -j4 && sudo ninja install

############################

VLC

sudo apt build-dep vlc

git clone -b dev/3.0.16/drm_1 https://github.com/jc-kynesim/vlc.git && cd vlc && ./bootstrap  && autoreconf -fiv  && ./configure  --enable-mmal  --disable-vdpau --disable-fdkaac --enable-gles2 && make -j4 && sudo make -j4 install



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

hwdec=auto-copy

gpu-hwdec-interop=drmprime-drm

#hwdec=h264_mmal-mmal-copy

#h264_v4l2m2m-v4l2m2m-copy

#hwdec-image-format=yuv420p

##better-sound

af=lavfi-crystalizer=1,lavfi-bass=gain=1

[omx]

hwdec=auto-copy

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


###############################################


 convert avi to mp4
 
 
ffmpeg -hwaccel drm -i /media/moon/Filme/test.avi   -c:v h264_v4l2m2m -b:v 2M   -pix_fmt yuv420p -c:a libfdk_aac  -profile:a aac_he -b:a 64k  -f mp4  test.mp4


for file in "$1"; do ffmpeg -hwaccel drm -i "$file"  -c:v h264_v4l2m2m -b:v 1500k -pix_fmt yuv420p  -trellis 2 -cmp 2 -subcmp 2  -g 40  -c:a libfdk_aac  -b:a 96k -f mp4 "${file%.*}_1.mp4"; done

#################################################

xbmc

git clone -b leia_pi4 https://github.com/PIPplware/xbmc.git

git clone https://github.com/PIPplware/xbmc.git


