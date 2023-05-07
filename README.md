Bullseye


INSTALL FFMPEG for RPI4 32 bit + 64bit with libfdk_aac  v4l2_request sand usw. 

+MPV

+ rtsp streaming 

+ ssh streaming
+ 
############################################
first of all change sources.list.d/

sudo nano /etc/apt/sources.list.d/raspi.list

deb http://archive.raspberrypi.org/debian/ bullseye main
# Uncomment line below then 'apt-get update' to enable 'apt-get source'
deb-src http://archive.raspberrypi.org/debian/ bullseye main
#####################################################################

FDK-AAC

wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/fdk-aac_2.0.2.orig.tar.gz && tar -xf fdk-aac_2.0.2.orig.tar.gz  && cd fdk-aac-2.0.2/ && autoreconf -fiv && \
./configure  --enable-shared && \
make -j4 && \
sudo make install && sudo ldconfig


###################################################

64 bit FFMPEG

sudo apt build-dep ffmpeg
git clone -b test/4.3.6/main https://github.com/jc-kynesim/rpi-ffmpeg.git

./configure --prefix=/usr  --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --libdir=/usr/lib/aarch64-linux-gnu --cpu=cortex-a72 --arch=arm64 --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --disable-mmal --enable-neon --enable-v4l2-request --enable-libudev --enable-sand   --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libfdk-aac --enable-version3 --enable-libopencore-amrnb --enable-libopencore-amrwb --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-epoxy   --enable-libxcb --enable-libzimg --enable-liblensfun --enable-neon --enable-vout-drm --enable-libv4l2  --enable-vout-egl  --disable-static --enable-libsrt  --extra-cflags=-I/usr/include/drm --enable-libwebp --enable-libzimg && make -j4 && sudo make -j4 install

make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig



########

32 bit FFMPEG

git clone -b test/4.3.6/main https://github.com/jc-kynesim/rpi-ffmpeg.git

./configure --prefix=/usr --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --incdir=/usr/include/arm-linux-gnueabihf --extra-cflags=-I/usr/include/libdrm --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libpulse --enable-nonfree --enable-libfdk-aac --enable-libx265 --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-vulkan --arch=armv7l --enable-mmal --enable-avresample --disable-filter=resample --enable-libwavpack --enable-libv4l2 --enable-sand --enable-vout-drm --enable-vout-egl --enable-v4l2-request --enable-libudev --enable-rpi --enable-neon --enable-v4l2-request --enable-sand --enable-pocketsphinx --disable-static --enable-opencl --enable-libsrt --enable-librabbitmq --enable-version3

make -j4

sudo make -j4 install

make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig

############################################################################

rpi zero 

git clone -b test/4.3.6/main https://github.com/jc-kynesim/rpi-ffmpeg.git

./configure --prefix=/usr --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --incdir=/usr/include/arm-linux-gnueabihf --extra-cflags=-I/usr/include/libdrm --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libpulse --enable-nonfree --enable-libfdk-aac --enable-libx265 --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-vulkan --arch=armv7l --enable-mmal --enable-avresample --disable-filter=resample --enable-libwavpack --enable-libv4l2 --enable-sand --enable-vout-drm --enable-vout-egl --enable-v4l2-request --enable-libudev --enable-rpi --enable-neon --enable-v4l2-request --enable-sand --enable-pocketsphinx --disable-static --enable-opencl --enable-libsrt --enable-librabbitmq --enable-version3 --cpu=arm1176jzf-s --arch=armv6t && make -j4 && sudo make -j4 install

#############################################
#####################################################

MPV

sudo apt build-dep mpv

apt source mpv && cd mpv-0.32.0  && chmod 777 waf && ./waf configure --prefix=/usr --libdir=/usr/lib/arm-linux-gnueabihf --confdir=/etc/mpv --zshdir=/usr/share/zsh/vendor-completions --enable-cdda --enable-dvdnav --enable-dvbin --enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2 --enable-libmpv-shared --enable-libplacebo --enable-vulkan
 --enable-ffmpeg-strict-abi && ./waf -j4 && sudo .waf -j4 install

git clone 

meson build
meson configure build -Dprefix=/usr -Dlibmpv=true -Drpi-mmal=enabled -Degl=enabled  
meson compile -C build
sudo meson install -C build

##############################

CELLULOID mpv player with sidebar

sudo apt build-dep celluloid

apt source celluloid && cd celluloid* && meson build && cd build && ninja -j4 && sudo ninja install


#########################################################
SSH streaming

from any linux pc with ffmpeg and ssh installed 

autologin to ssh must be enabled

host =pi@raspi

ssh user@host v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=640,height=480  --set-ctrl=h264_level=8--set-ctrl=h264_profile=1 --set-ctrl=power_line_frequency=2  --set-ctrl=video_bitrate=20000000 --set-ctrl=h264_i_frame_period=15

ssh user@host  ffmpeg -c:v h264_v4l2m2m -fflags +genpts+nobuffer+igndts+discardcorrupt -hide_banner  -fflags genpts -strict experimental -async 1 -f alsa -i plughw:CARD=Device,DEV=0  \
 -f v4l2 -re -input_format h264    -pix_fmt yuv420p   -i /dev/video0  -c:v h264_v4l2m2m -pix_fmt yuv420p -b:v 1000k -c:a libopus -application lowdelay -b:a 32k  -ar 48000 -f s16le      -f mpegts  - | mpv  --profile=low-latency  --volume=50  -
 
 
######################################


 
rtsp streamig 

https://github.com/aler9/rtsp-simple-server/releases

64 bit

wget https://github.com/aler9/rtsp-simple-server/releases/download/v0.18.3/rtsp-simple-server_v0.18.3_linux_arm64v8.tar.gz

32 bit

wget https://github.com/aler9/rtsp-simple-server/releases/download/v0.18.3/rtsp-simple-server_v0.18.3_linux_armv7.tar.gz

tar -xf rtsp'********

sudo mv rtsp-simple-server /usr/local/bin/

sudo mv rtsp-simple-server.yml /usr/local/etc/

Create the service:

####
sudo tee /etc/systemd/system/rtsp-simple-server.service >/dev/null << EOF
[Unit]
Wants=network.target
[Service]
ExecStart=/usr/local/bin/rtsp-simple-server /usr/local/etc/rtsp-simple-server.yml
[Install]
WantedBy=multi-user.target
EOF
####

Enable and start the service:

sudo systemctl enable rtsp-simple-server

sudo systemctl start rtsp-simple-server


arecord -L show mic device

my audio mic = plughw:CARD=S3,DEV=0


v4l2-ctl -d /dev/video0  -p 25  --set-fmt-video=width=640,height=360,pixelformat=4  --set-ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0,h264_level=11,h264_profile=2,video_bitrate=10000000,h264_i_frame_period=25

basic +audo

ffmpeg -c:v h264_v4l2m2m  -fflags +nobuffer+igndts+discardcorrupt   -hide_banner  -strict experimental  \
  -f alsa  -i plughw:CARD=Device,DEV=0  -f v4l2 -input_format h264  -use_wallclock_as_timestamps 1  -i /dev/video0 -c:v copy  -pix_fmt yuv420p    \
  -c:a libopus  -b:a 32k  -application lowdelay  \
  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream

without audio
ffmpeg -c:v h264_v4l2m2m  -fflags +nobuffer+igndts+discardcorrupt   -hide_banner  -strict experimental  \
-f v4l2 -input_format h264  -i /dev/video0 -c:v copy  -pix_fmt yuv420p 
  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream


audio video sync you must try -map 0:0 -map 1:0 -itsoffset 1.0 

map only example one map is video and the second audio

itoffset 1 second

example

ffmpeg -strict experimental  -fflags +nobuffer+igndts+discardcorrupt   -hide_banner  -strict experimental  \
  -f alsa  -ac 1  -i hw:CARD=Device,DEV=0  -f v4l2 -input_format h264 -itsoffset 1.0 -use_wallclock_as_timestamps 1  -i /dev/video0 -c:v copy  -pix_fmt yuv420p    \
  -c:a libopus  -b:a 32k  -application lowdelay -map 0:0 -map 1:0 \
  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream
  
 h264_v4l2m2m working 
 
 
v4l2-ctl -d /dev/video0  -p 25  --set-fmt-video=width=640,height=360,pixelformat=4  --set-ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0,h264_level=11,h264_profile=2,video_bitrate=10000000,h264_i_frame_period=25
 
 
ffmpeg -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer   -use_wallclock_as_timestamps 1  -flags low_delay -probesize 32 -analyzeduration 0  -hide_banner    \
  -f alsa -thread_queue_size 256  -i plughw:CARD=Device,DEV=0  -f v4l2 -input_format h264  -itsoffset 1.00  -f v4l2  -i /dev/video0  -vcodec h264_v4l2m2m -b:v 1500k  -acodec libfdk_aac    -b:a 64k   -map 1:0 -map 0:0   \
   -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream
 
  opus audio
  
  
  
  ffmpeg -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer   -use_wallclock_as_timestamps 1  -flags low_delay -probesize 32 -analyzeduration 0  -hide_banner    \
  -f alsa -thread_queue_size 256  -i plughw:CARD=Device,DEV=0  -f v4l2 -input_format h264  -itsoffset 1.00  -f v4l2  -i /dev/video0  -c:v h264_v4l2m2m -pix_fmt yuv420p  -b:v 1000k   -c:a libopus -application lowdelay -b:a 64k   -map 1:0 -map 0:0   \
   -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream
  
  
  mpv rtsp://localhost:8554/mystream
  from 2nd computer
  mpv rtsp:/192.168.0.100:8554/mystream
  
