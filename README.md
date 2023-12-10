
sorry for my bad english

this is an easy way of streaming on linux 


Bookworm RPI 2 3 and 4

INSTALL FFMPEG for RPI4 32 bit + 64bit with libfdk_aac  v4l2_request sand usw. 

+MPV

+ rtsp streaming 


#########################

    sudo apt build-dep ffmpeg mpv 
    
    nano .config/npv/mpv.conf

exampele for drm-prime wayland x11egl for x11 session

    gpu-dumb-mode=yes
    opengl-glfinish=yes
    #gpu-context=x11egl
    gpu-context=wayland
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

for latest

    git clone  https://github.com/mstorsjo/fdk-aac && \
    cd fdk-aac && \
    autoreconf -fiv && \
    ./configure  --enable-shared && \
    make -j4 && \
    sudo make install && sudo ldconfig

###################################################



     sudo apt install cpuinfo libv4l-dev

    cpu-info

####################################################

    nano /boot/firmware/config.txt

64bit
    
    arm_64bit=1 

32bit

    arm_64bit=0 

##############################################################################################


bookworm 64 aarch64 arm64

    git clone -b release/5.1/main https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --enable-gpl --disable-stripping --disable-mmal --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray    --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librist --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sand --enable-sdl2 --disable-sndio --enable-libjxl --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --libdir=/usr/lib/aarch64-linux-gnu --arch=arm64 --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-libplacebo --enable-librav1e --enable-shared  --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-nonfree --enable-libfdk-aac --disable-static --disable-cuda --disable-vaapi --disable-vdpau --enable-vout-drm --enable-vout-egl --enable-vulkan && make -j4 && sudo make -j4 install




bookworm 32 armhf armv7l pi2+3

         git clone -b release/5.1/main https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --libdir=/usr/lib/arm-linux-gnueabihf/ --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --disable-mmal --enable-neon --enable-v4l2-request --enable-libudev --enable-sand --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libfdk-aac --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-epoxy --enable-libxcb --enable-libzimg --enable-vout-drm --enable-vout-egl --disable-static --enable-libsrt --extra-cflags=-I/usr/include/libdrm --enable-librabbitmq --cpu=cortex-a53 --arch=armv7 --disable-cuda --disable-vaapi --disable-vdpau --disable-vulkan --disable-armv5te --disable-armv6t2  && make -j4 && sudo make -j4 install

        


rpi zero w

        git clone -b release/5.1/main https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --disable-mmal --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librist --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sand --enable-sdl2 --disable-sndio --enable-libjxl --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-libplacebo --enable-librav1e --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf --cpu=arm1176jzf-s --arch=arm --enable-nonfree --enable-libfdk-aac  && make -j4 && sudo make -j4 install


omx-rpi  rpi zero w +2 +3 +4 only 32 bit


    git clone https://github.com/raspberrypi/userland.git
    cd userland
    ./buildme

this is for rpi3 and compile ffmpeg 

    git clone -b release/5.1/main https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --disable-mmal --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librist --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sand --enable-sdl2 --disable-sndio --enable-libjxl --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-libplacebo --enable-librav1e --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --cpu=cortex-a53 --arch=armv7 --disable-armv5te --disable-armv6t2 --disable-cuda --disable-vaapi --disable-vdpau --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-nonfree --enable-libfdk-aac --enable-vout-drm --enable-vout-egl --disable-static --enable-vulkan --disable-static --enable-libopenh264 --enable-omx --enable-omx-rpi --extra-cflags=-I/opt/vc/include --extra-ldflags=-L/opt/vc/lib && make -j4 && sudo make -j4 install


############################################################################

MPV



       sudo apt build-dep mpv && apt source mpv

       cd mpv...
       dpkg-buildpackage -us -uc 

       cd ..
      sudo dpkg -i lib*mpv*.deb mpv*.deb


or


        meson setup  build  && meson configure build -Dprefix=/usr -Dlibmpv=true -Drpi=disabled -Drpi-mmal=disabled -Degl=enabled -Dwayland=enabled -Degl-wayland=enabled -Dsdl2=enabled -Dvaapi=disabled -Dvdpau=disabled -Dvulkan=enabled -Dlibplacebo=enabled -Dvdpau=disabled -Dvaapi=disabled && meson compile -C build && sudo meson install -C build

######################################


rtsp-streaming libcamera camera autodedect

         rpicam-vid --autofocus-mode continuous  --inline 1  --brightness 0.1 --contrast 1.0 --sharpness 1.0  --level 4.1 --framerate 60  --width 640 --height 360   -t 0 -n  --codec libav --libav-format mpegts  --libav-video-codec h264_v4l2m2m  -o - | ffmpeg -fflags  +nobuffer+igndts+discardcorrupt -flags low_delay -avioflags direct   -hwaccel drm -hwaccel_output_format drm_prime    -hide_banner  -f alsa -thread_queue_size 8   -i plughw:0  -r 60    -i -  -c:v h264_v4l2m2m  -b:v 1000k    -r 25 -c:a libopus  -ar 16000  -b:a 32k  -application lowdelay  -async 1  -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream


experimental  and libfdk 

       rpicam-vid  --autofocus-mode continuous  --inline 1  --brightness 0.1 --contrast 1.0 --sharpness 1.0  --level 4.1 --framerate 60  --width 640 --height 360   -t 0 -n  --codec libav --libav-format mpegts  --libav-video-codec h264_v4l2m2m  -o - | ffmpeg -async 1 -fflags  +nobuffer+igndts+genpts -flags low_delay -avioflags direct   -hwaccel drm -hwaccel_output_format drm_prime -hide_banner  -f alsa -thread_queue_size 16 -i plughw:0  -r 60 -i -  -c:v h264_v4l2m2m  -b:v 1000k  -r 30   -acodec libfdk_aac -profile:a aac_he_v2   -ar 16000      -b:a 32k   -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream

##############################################
 
rtsp streamig 

      https://github.com/aler9/mediamtx/releases

64 bit

    wget https://github.com/aler9/mediamtx/releases/download/v0.22.2/mediamtx_v0.22.2_linux_arm64v8.tar.gz

32 bit

      wget https://github.com/aler9/mediamtx/releases/download/v0.22.2/mediamtx_v0.22.2_linux_armv7.tar.gz

unzip

      tar -xf mediamtx_v0.22.2_linux_arm64v8.tar.gz

move it to

      sudo mv mediamtx /usr/local/bin/

      sudo mv mediamtx.yml /usr/local/etc/

this create mediamtx.service

    sudo tee /etc/systemd/system/mediamtx.service >/dev/null << EOF
    [Unit]
    Wants=network.target
    [Service]
    ExecStart=/usr/local/bin/mediamtx /usr/local/etc/mediamtx.yml
    [Install]
    WantedBy=multi-user.target
    EOF
    
and reload

    sudo systemctl daemon-reload

enable

    sudo systemctl enable mediamtx

start

    sudo systemctl start mediamtx

#########################

    nano /boot/firmware/config.txt

    #gpu_mem=256
    #start_x=1
    disable_camera_led=1


set  15 fps with and height

        v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=1280,height=720 --set-ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0


in this examples audio device =  plughw:0  

      ffmpeg  -async 1 -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer+genpts+igndts  -avioflags direct -flags low_delay   -hide_banner  -f alsa  -i plughw:0  -f v4l2 -re  -input_format yuv420p  -i /dev/video0  -c:v h264_v4l2m2m -pix_fmt yuv420p -b:v 1700k   -c:a libopus -application lowdelay -b:a 64k  -ar 48000 -f s16le  -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream



inputformat h264

       v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=1280,height=720 --set-ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0,h264_level=12,h264_profile=4

       ffmpeg  -async 1 -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer+genpts+igndts  -avioflags direct -flags low_delay   -hide_banner  -f alsa  -i plughw:0  -f v4l2 -re  -input_format h264  -i /dev/video0  -c:v copy   -c:a libopus -application lowdelay -b:a 64k  -ar 48000 -f s16le  -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream



without audio

           ffmpeg  -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer+genpts+igndts   -strict experimental    -avioflags direct -flags low_delay  -hide_banner 
    -f v4l2 -input_format yuv420p -re -i /dev/video0 -vcodec h264_v4l2m2m -b:v 1500k  -pix_fmt yuv420p -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream



Video + Audio libfdk_aac h264_v4l2m2m

most compatible with all players real mp4

    ffmpeg -async 1 -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer+genpts+igndts   -strict experimental    -avioflags direct -flags low_delay  -hide_banner      -f alsa  -i plughw:0  -f v4l2 -input_format     yuv420p    -f v4l2  -i /dev/video0  -vcodec h264_v4l2m2m -b:v 1M   -c:a libfdk_aac -profile:a aac_he -ar 44100  -b:a 32k  -movflags +faststart      -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream

look running stream

    mpv rtsp://localhost:8554/mystream

 
  opus only audio
  
           ffmpeg  -fflags +nobuffer+genpts+igndts   -strict experimental    -avioflags direct -flags low_delay  -hide_banner     \
          -i plughw:0  -c:a libopus -application lowdelay -b:a 64k  -ar 48000 \
         -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream
  
         mpv rtsp://localhost:8554/mystream
 
 from 2nd computer
  
          mpv rtsp:/ip:8554/mystream
  
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
  

#Working opus
    
    ffmpeg -async 1 -threads 4  -hwaccel drm -hwaccel_output_format drm_prime  -strict experimental -flags low_delay -fflags +genpts+nobuffer  -hide_banner -rtsp_transport tcp  \
     -re -i rtsp://127.0.0.1:8080/h264_pcm.sdp -c:v h264_v4l2m2m  -pix_fmt yuv420p -b:v 1000k -c:a libopus  -b:a 64k  -application lowdelay  -ar 48000   -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream2


#Working copy
    
        ffmpeg  -async 1  -threads 4  -hwaccel drm -hwaccel_output_format drm_prime   -strict experimental -flags low_delay -fflags +genpts+nobuffer+igndts -avioflags direct  -hide_banner -rtsp_transport tcp  \
     -re   -i rtsp://127.0.0.1:8080/h264_pcm.sdp -codec copy   -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream2

#Working libfdk aac_he
    
    ffmpeg -async 1 -threads 4 -hwaccel drm -hwaccel_output_format drm_prime -strict experimental -flags low_delay -fflags +genpts+nobuffer -hide_banner -rtsp_transport tcp -re -i rtsp://127.0.0.1:8080/h264_pcm.sdp -c:v         h264_v4l2m2m   -b:v 1000k -c:a libfdk_aac -profile:a aac_he -ar 44100  -b:a 32k  -movflags +faststart  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream2


create service autostart


    sudo nano /usr/local/bin/home-stream.sh

put this example in ! you can change framrate -r 15 audiodevice bitrate usw


    v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=1280,height=720  --set-ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0
    ffmpeg -async 1-hwaccel drm -hwaccel_output_format drm_prime  -fflags +genpts+nobuffer -avioflags direct  -flags low_delay  -hide_banner  -strict experimental   \
      -f alsa   -i plughw:0  -f v4l2 -input_format yuv420p -re -i /dev/video0 -c:v h264_v4l2m2m -b:v 1M  -pix_fmt yuv420p  -r 15  \
      -c:a libopus  -b:a 32k  -application lowdelay   -ar 48000 \
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
 
