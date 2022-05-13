Bullseye


INSTALL FFMPEG for RPI4 32 bit + 64bit with libfdk_aac  v4l2_request sand usw. + mmal on 32 bit

+MPV

+ rtsp streaming 

+ ssh streaming
+ 
############################################

FDK-AAC

wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/fdk-aac_2.0.2.orig.tar.gz && tar -xf fdk-aac_2.0.2.orig.tar.gz  && cd fdk-aac-2.0.2/ && autoreconf -fiv && \
./configure  --enable-shared && \
make -j4 && \
sudo make install && sudo ldconfig


###################################################

64 bit FFMPEG

sudo apt build-dep ffmpeg

apt source ffmpeg && cd ffmpeg-4.3.4  && ./configure --prefix=/usr  --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --libdir=/usr/lib/aarch64-linux-gnu --cpu=cortex-a72 --arch=arm64 --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --disable-mmal --enable-neon --enable-v4l2-request --enable-libudev --enable-sand   --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libfdk-aac --enable-version3 --enable-libopencore-amrnb --enable-libopencore-amrwb --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-epoxy   --enable-libxcb --enable-libzimg --enable-liblensfun --enable-neon --enable-vout-drm --enable-libv4l2  --enable-vout-egl  --disable-static --enable-libsrt  --extra-cflags=-I/usr/include/drm --enable-libwebp --enable-libzimg && make -j4 && sudo make -j4 install

make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig



########

32 bit FFMPEG

apt source ffmpeg && cd ffmpeg-4.3.4  && ./configure --prefix=/usr --extra-version=0+deb11u1+rpt1 --toolchain=hardened --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-nonfree --enable-libfdk-aac --enable-vout-egl --enable-vulkan --disable-mmal --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-sand --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --disable-static --enable-liblensfun --enable-version3 --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenh264 --enable-librabbitmq --arch=armhf --disable-rpi --cpu=cortex-a72 --extra-cflags=-I/usr/include/drm --enable-libzimg  && make -j4 && sudo make -j4 install

make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig

############################################################################

rpi zero 

apt source ffmpeg && cd ffmpeg-4.3.4  && --prefix=/usr --extra-version=0+deb11u1+rpt1 --toolchain=hardened --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-nonfree --enable-libfdk-aac --enable-vout-egl --enable-vulkan --disable-mmal --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-sand --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --disable-static --enable-liblensfun --enable-version3 --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenh264 --enable-librabbitmq  --disable-rpi --extra-cflags=-I/usr/include/drm --enable-libzimg --cpu=arm1176jzf-s --arch=arm && make -j4 && sudo make -j4 install

--arch=armv6t2 maybe not tested
#############################################
#####################################################

MPV

sudo apt build-dep mpv

apt source mpv && cd mpv-0.32.0  && chmod 777 waf && ./waf configure --enable-egl-drm --enable-gl-x11 --enable-dvdnav --enable-egl --enable-sdl2 --enable-libmpv-shared --enable-libplacebo --enable-vulkan --disable-vaapi --disable-vdpau --enable-ffmpeg-strict-abi && ./waf -j4 && sudo .waf -j4 install

##############################

CELLULOID mpv player with sidebar

sudo apt build-dep celluloid

apt source celluloid && cd celluloid* && meson build && cd build && ninja -j4 && sudo ninja install

############################

VLC

sudo apt build-dep vlc

git clone -b dev/3.0.16/drm_1 https://github.com/jc-kynesim/vlc.git && cd vlc && ./bootstrap  && autoreconf -fiv  && ./configure  --enable-mmal  --disable-vdpau --disable-fdkaac --enable-gles2 && make -j4 && sudo make -j4 install

#########################################################
from any linux pc with ffmpeg and ssh installed 

autologin to ssh must be enabled

host =pi@raspi

ssh user@host v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=640,height=480  --set-ctrl=h264_level=8--set-ctrl=h264_profile=1 --set-ctrl=power_line_frequency=2  --set-ctrl=video_bitrate=20000000

ssh user@host  ffmpeg -c:v h264_v4l2m2m  -fflags nobuffer -flags  low_delay  -avioflags direct -fflags rtbufsize -fflags discardcorrupt -fflags igndts -fflags nofillin -hide_banner  -fflags genpts -strict experimental -async 1  -f alsa   -i plughw:CARD=Device,DEV=0  \
 -f v4l2 -re -input_format h264    -pix_fmt yuv420p   -i /dev/video0  -c:v h264_v4l2m2m -pix_fmt yuv420p -b:v 1000k -c:a libopus -application lowdelay -b:a 32k  -ar 48000 -f s16le      -f mpegts  - | mpv  --profile=low-latency  --volume=50  -
 
 
######################################


 
rtsp streamig 

https://github.com/aler9/rtsp-simple-server/releases

64 bit

wget https://github.com/aler9/rtsp-simple-server/releases/download/v0.18.3/rtsp-simple-server_v0.18.3_linux_arm64v8.tar.gz

32 bit

wget https://github.com/aler9/rtsp-simple-server/releases/download/v0.18.3/rtsp-simple-server_v0.18.3_linux_armv7.tar.gz

tar -xf rtsp'********



cd rtsp-simple-server

install rtsp-simple server github

sudo mv rtsp-simple-server /usr/local/bin/

sudo mv rtsp-simple-server.yml /usr/local/etc/

Create the service:

sudo tee /etc/systemd/system/rtsp-simple-server.service >/dev/null << EOF
[Unit]
Wants=network.target
[Service]
ExecStart=/usr/local/bin/rtsp-simple-server /usr/local/etc/rtsp-simple-server.yml
[Install]
WantedBy=multi-user.target
EOF

Enable and start the service:

sudo systemctl enable rtsp-simple-server

sudo systemctl start rtsp-simple-server



v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=640,height=480  --set-ctrl=exposure_dynamic_framerate=0 --set-ctrl=h264_level=11  --set-ctrl=h264_profile=4  --set-ctrl=video_bitrate=2000000



arecord -L show mic device

my audio mic = plughw:CARD=S3,DEV=0


ffmpeg  -fflags nobuffer -vcodec h264_v4l2m2m  -hide_banner   -f alsa   -i plughw:CARD=S3,DEV=0  -f v4l2 -re  -i /dev/video0   \
 -c:v  h264_v4l2m2m  -pix_fmt yuv420p  -b:v 1000k  \
 -c:a libopus -application lowdelay -b:a 32k   -movflags +faststart    -f rtsp rtsp://localhost:8554/mystream
