
sorry for my bad english

this is an easy way of streaming on linux 


Bookworm RPI 2 3 and 4

INSTALL FFMPEG for RPI4 32 bit + 64bit with libfdk_aac  v4l2_request sand usw. 

+MPV

+ rtsp streaming 

+ ssh streaming

#########################

mpv.conf

gpu-dumb-mode=yes

opengl-glfinish=yes

gpu-context=x11egl

gpu-api=opengl

vo=gpu

hwdec=auto

hwdec-codecs=all

hwdec-image-format=drm_prime

gpu-hwdec-interop=drmprime-overlay

af=lavfi-crystalizer=1,lavfi-bass=gain=2,scaletempo2

#####################################################################



FDK-AAC

wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/fdk-aac_2.0.2.orig.tar.gz && tar -xf fdk-aac_2.0.2.orig.tar.gz  && cd fdk-aac-2.0.2/ && autoreconf -fiv && \
./configure  --enable-shared && \
make -j4 && \
sudo make install && sudo ldconfig


###################################################



sudo apt install cpuinfo libv4l-dev

cpu-info

####################################################

       IMPORTANT

nano /boot/config.txt

arm_64bit=1 for 64 bit

arm_64bit=0  for 32 bit

##############################################################################################

  

    Bookworm
    
--extra-libs=-latomic --cpu=cortex-a53 --arch=armv7l --disable-armv5te --disable-armv6t2   rpi 3b 

--extra-libs=-latomic --cpu=cortex-a72 --arch=arm64   rpi 4 64 bit

--extra-libs=-latomic --cpu=cortex-a72 --arch=armv7l --disable-armv5te --disable-armv6t2   rpi 4 32 bit
 







change the cpu in configure txt

64 bit FFMPEG

sudo apt build-dep ffmpeg

bookworm 64 aarch64 arm64

apt source ffmpeg 

./configure --prefix=/usr --extra-version=1+rpt4 --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --enable-gpl --disable-stripping --disable-mmal --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librist --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sand --enable-sdl2 --disable-sndio --enable-libjxl --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --libdir=/usr/lib/aarch64-linux-gnu --arch=arm64 --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-libplacebo --enable-librav1e --enable-shared --cpu=cortex-a7 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-nonfree --enable-libfdk-aac --disable-static --disable-cuda --disable-vaapi --disable-vdpau --enable-vout-drm --enable-vout-egl --enable-vulkan


make -j4

sudo make -j4 install




bookworm 32 armhf armv7l

git clone -b release/5.1/main https://github.com/jc-kynesim/rpi-ffmpeg.git

./configure --prefix=/usr --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --libdir=/usr/lib/arm-linux-gnueabihf/ --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --disable-mmal --enable-neon --enable-v4l2-request --enable-libudev --enable-sand --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libfdk-aac --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-epoxy --enable-libxcb --enable-libzimg --enable-vout-drm --enable-vout-egl --disable-static --enable-libsrt --extra-cflags=-I/usr/include/libdrm --enable-librabbitmq --cpu=cortex-a7 --arch=armv7l --disable-cuda --disable-vaapi --disable-vdpau --disable-vulkan --disable-armv5te --disable-armv6t2


make -j4

sudo make -j4 install

############################################################################


MPV



sudo apt build-dep mpv && apt source mpv

cd mpv...

dpkg-buildpackage -us -uc 

cd ..

sudo dpkg -i lib*mpv*.deb mpv*.deb


#############

or


meson build

meson configure build -Dprefix=/usr -Dlibmpv=true -Drpi=disabled -Drpi-mmal=disabled -Degl=enabled -Dwayland=enabled -Degl-wayland=enabled -Dsdl2=enabled -Dvaapi=disabled -Dvdpau=disabled -Dvulkan=enabled -Dlibplacebo=enabled -Dvdpau=disabled -

Dvaapi=disabled

meson compile -C build

sudo meson install -C build

#############################

SSH streaming

from any linux pc with ffmpeg and ssh installed 

#################### autologin to ssh must be enabled without password only with key auth  !!!!!!!!!!!!!

install kssh-askpass rsa key 


host =user@192.0.0.10

ssh user@host v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=640,height=480  --set-ctrl=h264_level=8--set-ctrl=h264_profile=1 --set-ctrl=power_line_frequency=2  --set-ctrl=video_bitrate=20000000 --set-ctrl=h264_i_frame_period=15

working with distro ffmpeg

ssh user@host  ffmpeg -c:v h264_v4l2m2m -fflags +genpts+nobuffer+igndts+discardcorrupt -avioflag direct -flags +genpts+low_delay -hide_banner -strict experimental -f alsa -i plughw:CARD=Device,DEV=0  \
 -f v4l2  -input_format h264 -pix_fmt yuv420p -i /dev/video0  -c:v h264_v4l2m2m -pix_fmt yuv420p -b:v 1000k -c:a libopus -application lowdelay -b:a 32k  -ar 48000 -f s16le      -f mpegts  - | mpv  --profile=low-latency  --volume=50  -
 
 
 libfdk-aac is more compatible
 
 ssh user@host  ffmpeg -an -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer+genpts  -avioflags direct -flags low_delay   -hide_banner  -f alsa -thread_queue_size 256  -i plughw:CARD=S3,DEV=0  -f v4l2    -i /dev/video0  -c:v h264_v4l2m2m -pix_fmt yuv420p -b:v 1700k -c:a libopus -application lowdelay -b:a 64k  -ar 48000 -f s16le      -f mpegts  - | mpv  --profile=low-latency  --volume=30 -

######################################


 
rtsp streamig 

https://github.com/aler9/mediamtx/releases

64 bit

wget https://github.com/aler9/mediamtx/releases/download/v0.22.2/mediamtx_v0.22.2_linux_arm64v8.tar.gz

32 bit

wget https://github.com/aler9/mediamtx/releases/download/v0.22.2/mediamtx_v0.22.2_linux_armv7.tar.gz

tar -xf mediamtx_v0.22.2_linux_arm64v8.tar.gz

sudo mv mediamtx /usr/local/bin/

sudo mv mediamtx.yml /usr/local/etc/

#################################


sudo tee /etc/systemd/system/mediamtx.service >/dev/null << EOF
[Unit]
Wants=network.target
[Service]
ExecStart=/usr/local/bin/mediamtx /usr/local/etc/mediamtx.yml
[Install]
WantedBy=multi-user.target
EOF


########################################


sudo systemctl daemon-reload

sudo systemctl enable mediamtx

sudo systemctl start mediamtx

#########################

arecord -L

my audio mic = plughw:CARD=S3,DEV=0

video + audo opus

ffmpeg -hwaccel drm -hwaccel_output_format drm_prime -hide_banner -flags low_delay -strict experimental  \
  -f alsa  -i plughw:CARD=Device,DEV=0  -f v4l2 -input_format h264 -re  -i /dev/video0 -vcodec h264_v4l2m2m -b:v 1500k  -pix_fmt yuv420p    \
  -c:a libopus  -b:a 32k  -application lowdelay  \
  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream

without audio

ffmpeg -hwaccel drm -hwaccel_output_format drm_prime -hide_banner -flags low_delay -strict experimental  \
-f v4l2 -input_format h264 -re -i /dev/video0 -vcodec h264_v4l2m2m -b:v 1500k  -pix_fmt yuv420p -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream


set output rpi-camera to h264

v4l2-ctl -d /dev/video0  -p 25  --set-fmt-video=width=640,height=360,pixelformat=4  --set-ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0,h264_level=11,h264_profile=2,video_bitrate=10000000,h264_i_frame_period=25



Video + Audio libfdk_aac h264_v4l2m2m


ffmpeg -hwaccel drm -hwaccel_output_format drm_prime  -flags low_delay   -hide_banner    \
  -f alsa  -i plughw:CARD=Device,DEV=0  -f v4l2 -input_format h264   -f v4l2 -re -i /dev/video0  -vcodec h264_v4l2m2m -b:v 1500k  -acodec libfdk_aac    -b:a 64k      \
   -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream
 
  if needed
  
####  -itsoffset 1.00  and -map 1:0 -map 0:0  = audio video sync ? set -itsoffset 1.00 mining 1 second difference audio video

  
ffmpeg -hwaccel drm -hwaccel_output_format drm_prime  -flags low_delay   -hide_banner    \
  -f alsa  -i plughw:CARD=Device,DEV=0  -f v4l2 -input_format h264   -f v4l2 -itsoffset 1.00  -re -i /dev/video0  -vcodec h264_v4l2m2m -b:v 1500k  -acodec libfdk_aac    -b:a 64k   -map 1:0 -map 0:0   \
   -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream

look running stream

mpv rtsp://localhost:8554/mystream

 
  opus only audio
  
  ffmpeg -flags low_delay   -hide_banner    \
   -i plughw:CARD=Device,DEV=0  -c:a libopus -application lowdelay -b:a 64k   \
   -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream
  
  
  mpv rtsp://localhost:8554/mystream
 
 from 2nd computer
  
  mpv rtsp:/192.168.0.100:8554/mystream
  
  ########################################################################
  
  under construct but working
  
  
  streaming from android phone camera
  
  install adb 
  
  sudo apt install adb
  
  install ip-webcam from playstore https://play.google.com/store/apps/details?id=com.pas.webcam on your phone
  
  in this app you can chang port settings resolution and framerate
  
  conect android phone with usb cable not over network (network is to slow)
  
  i change fps to 15 on an very old s2 and resolution 320x240 but with a better phone no problems with higher resolutions
  
  also you can disable network on android  it is not need
  
  start adb 
  
  adb devices
  
  confirm on android the adb conction
  
  
  
  
  adb -d forward tcp:8080 tcp:8080
  
 ffmpeg  -hwaccel drm -hwaccel_output_format drm_prime   -flags low_delay   -hide_banner -rtsp_transport tcp  \
 -re  -i rtsp://127.0.0.1:8080/h264_pcm.sdp -c:v h264_v4l2m2m -pix_fmt yuv420p  -b:v 1500k   -c:a libfdk_aac -b:a 64k     -f rtsp -rtsp_transport    tcp  rtsp://localhost:8554/mystream2

create service autostart

mkdir bin

sudo nano /usr/local/bin/home-stream.sh

put this example in

changing settings for audio or different ports if needed

v4l2-ctl -d /dev/video0  -p 25  --set-fmt-video=width=640,height=360,pixelformat=4 \
--set ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0,h264_level=11,h264_profile=2,video_bitrate=10000000,h264_i_frame_period=25

ffmpeg -hwaccel drm -hwaccel_output_format drm_prime  -fflags +genpts+nobuffer -avioflags direct  -flags low_delay  -hide_banner  -strict experimental   \
  -f alsa   -i plughw:CARD=Device,DEV=0  -f v4l2 -input_format h264  -re -i /dev/video0 -c:v h264_v4l2m2m -b:v 1M  -pix_fmt yuv420p    \
  -c:a libopus  -b:a 32k  -application lowdelay  \
  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream

store it


nano .config/systemd/user/home-stream.service

put this in

[Unit]

Description=stream

Requires=multi-user.target

After=multi-user.target

[Service]

ExecStartPre=/bin/sleep 15

ExecStart=home-stream.sh

Restart=always

ExecStop=killall ffmpeg

#KillMode=process

[Install]

WantedBy=multi-user.target


store it strg +o 

systemctl --user enable home-stream.service

systemctl --user start home-stream.service

systemctl --user status home-stream.service


###############################################################################################


android camera in linphone chromium usw

its not working on rpi but on amd64 because libv4l2 and h264_v4l2m2m are the same devices

so only amd64 and i386

sudo apt install libv4l2loopback-dkms

sudo modprobe v4l2loopback video_nr=1 card_label="device number 1" exclusive_caps=1
v4l2loopback-ctl set-fps 15 /dev/video1

adb -d forward tcp:8080 tcp:8080

ffmpeg  -an -hwaccel auto -hide_banner  -fflags discardcorrupt -rtsp_transport tcp  -i rtsp://127.0.0.1:8080/h264_pcm.sdp    -c:v rawvideo -pix_fmt yuv420p   -f v4l2 /dev/video1

-an = audio no is important


apt install qv4l2

try it with qv4l2

cheers
 
