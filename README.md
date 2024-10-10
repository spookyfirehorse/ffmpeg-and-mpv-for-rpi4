
sorry for my bad english

this is an easy way to streaming usb cameras, older models of rpi cameras, and rpi-cam  on rpi 

also dvdcopy with all subtitles and colorpalette for the subtitle 

also full harware support for mpv and vlc include libfdk-aac wich is default mp4 for compatiblity with all player

opus is realy good and you heave nothing to to and go to streaming with opus 

this very stable 




Bookworm RPI zero w  3 and 4 

NOT FOR RPI 5 the rpi5 have no v4l2m2m encoders

## INSTALL FFMPEG for RPI4 32 bit + 64bit with libfdk_aac  v4l2_request sand usw.


#########################



    
    nano .config/mpv/mpv.conf

## example for drm-prime wayland  rpi4

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


## example for drm-prime wayland  rpi5

        override-display-fps=60
        video-sync=display-resample

        osd-bar=no
        osc=no
        border=no
        cursor-autohide-fs-only=yes
        gpu-dumb-mode=yes
        opengl-glfinish=yes
        gpu-context=wayland
        gpu-api=opengl
        vo=gpu
        gpu-sw=yes
        drm-vrr-enabled=auto
        hwdec=drm   ##ordrm-copy

    


#####################################################################


#  first install all libarys with

         sudo apt build-dep ffmpeg mpv 


# FDK-AAC

    wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/fdk-aac_2.0.2.orig.tar.gz && tar -xf fdk-aac_2.0.2.orig.tar.gz  && cd fdk-aac-2.0.2/ && autoreconf -fiv && \
    ./configure  --enable-shared && \
    make -j4 && \
    sudo make install && sudo ldconfig

# for latest

    git clone  https://github.com/mstorsjo/fdk-aac && \
    cd fdk-aac && \
    autoreconf -fiv && \
    ./configure  --enable-shared && \
    make -j4 && \
    sudo make install && sudo ldconfig

###################################################



     sudo apt install cpuinfo 

    cpu-info

####################################################

    nano /boot/firmware/config.txt

64bit
    
    arm_64bit=1 

32bit

    arm_64bit=0 

##############################################################################################


bookworm 64 aarch64 arm64  --arch=arm64 --cpu=cortex-a72 --enable-neon --disable-armv6t2 --disable-armv6 --disable-armv5te 


# install ffmpeg rpi4


    git clone -b release/5.1/main https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --extra-version=0+rpt1+deb12u1 --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --enable-gpl --disable-stripping --disable-mmal --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librist --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sand --enable-sdl2 --disable-sndio --enable-libjxl --enable-v4l2-request --enable-libudev --enable-epoxy --libdir=/usr/lib/aarch64-linux-gnu --arch=arm64 --cpu=cortex-a72 --enable-neon --disable-armv6t2 --disable-armv6 --disable-armv5te --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --enable-chromaprint --enable-frei0r --disable-libx264 --enable-libplacebo --enable-vulkan --enable-librav1e --enable-shared --enable-nonfree --enable-libfdk-aac --disable-static --disable-nvdec --disable-nvenc --disable-cuvid --disable-cuda-llvm --disable-cuda-nvcc --disable-ffnvcodec --disable-vdpau --disable-vaapi --enable-thumb --enable-libopenh264 --enable-version3 --enable-libopencore-amrwb --enable-libopencore-amrnb --enable-thumb


    sudo make -j4 



# install ffmpeg rpi3

         git clone -b release/5.1/main https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --disable-mmal --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librist --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sand --enable-sdl2 --disable-sndio --enable-libjxl  --enable-v4l2-request --enable-libudev --enable-epoxy --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --disable-chromaprint --disable-frei0r --disable-libx264 --enable-libplacebo --enable-librav1e --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --cpu=cortex-a53  --arch=armv7 --disable-armv6t2 --disable-armv6 --disable-armv5te --enable-vfp --enable-neon  --enable-nonfree --enable-libfdk-aac --disable-nvdec --disable-nvenc --disable-cuvid --disable-cuda-llvm --disable-cuda-nvcc --disable-ffnvcodec --disable-vdpau --enable-libopenh264 --disable-vaapi --enable-version3 --enable-libopencore-amrwb --enable-libopencore-amrnb --disable-static && make -j4 && sudo make -j4 install  
         

        
#######################################################################################################

on this side  https://en.wikipedia.org/wiki/Raspberry_Pi   rpi specs  you can read rpi zero w has no vfp and neon support

in the original config from raspberrypi  apt install ffmpeg  = neon enabled which  is not correct also thumb is not supported 


rpi zero w  --cpu=arm1176jzf-s --arch=arm --disable-armv6t2 --enable-armv6 --disable-armv5te --disable-vfp --disable-neon

# original pi zero w

        --prefix=/usr --extra-version=0+rpt1+deb12u1 --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --disable-mmal --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librist --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sand --enable-sdl2 --disable-sndio --enable-libjxl --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-libplacebo --enable-librav1e --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf --cpu=arm1176jzf-s --arch=arm


# disable neon and vfp my config

                git clone -b release/5.1/main https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --disable-mmal --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librist --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sand --enable-sdl2 --disable-sndio --enable-libjxl --disable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --disable-chromaprint --disable-frei0r --disable-libx264 --enable-libplacebo --enable-vulkan --enable-librav1e --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf --cpu=arm1176jzf-s --arch=arm  --disable-armv5te --disable-vfp --disable-neon --disable-thumb --enable-nonfree --enable-libfdk-aac --disable-nvdec --disable-nvenc --disable-cuvid --disable-cuda-llvm --disable-cuda-nvcc --disable-ffnvcodec --disable-vdpau --enable-libopenh264 --disable-vaapi --enable-version3 --enable-libopencore-amrwb --enable-libopencore-amrnb --disable-static && make -j4 && sudo make -j4 install

##################################################################################################################################################################################################


# 32 bit only with openh264 and omx-rpi userland

# install userland omx-rpi

    git clone https://github.com/raspberrypi/userland.git
    cd userland
    ./buildme

and opnh264 desingned for slow  moving pictures for  voip + omx-rpi

        sudo apt install libopenh264-dev

original sources from https://github.com/jc-kynesim/rpi-ffmpeg.git

many thanks to jc-kynesim


# rpi 3 or 32bit  rpi 4

    git clone -b release/5.1/main https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --disable-mmal --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librist --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sand --enable-sdl2 --disable-sndio --enable-libjxl  --enable-v4l2-request --enable-libudev --enable-epoxy --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-vout-drm --enable-libiec61883 --disable-chromaprint --disable-frei0r --disable-libx264 --enable-libplacebo --enable-librav1e --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --cpu=cortex-a53 --arch=arm  --disable-armv6t2 --disable-armv6 --disable-armv5te  --enable-neon --enable-vfp  --disable-cuda --disable-vaapi --disable-vdpau --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-nonfree --enable-libfdk-aac --enable-vout-drm --enable-vout-egl --disable-static --enable-vulkan --disable-static --enable-libopenh264 --enable-omx --enable-omx-rpi --extra-cflags=-I/opt/vc/include --extra-ldflags=-L/opt/vc/lib --enable-thumb  --enable-version3 --enable-libopencore-amrwb  --enable-libopencore-amrnb   && make -j4 && sudo make -j4 install


############################################################################

# MPV



       sudo apt build-dep mpv && apt source mpv

       cd mpv...
       dpkg-buildpackage -us -uc 

       cd ..
      sudo dpkg -i lib*mpv*.deb mpv*.deb


compile


        meson setup build

        meson configure build -Dprefix=/usr -Dlibmpv=true -Ddvdnav=enabled -Dsdl2=enabled -Dzimg=enabled -Drpi=disabled -Drpi-mmal=disabled -Degl=enabled -Dwayland=enabled -Degl-wayland=enabled         -Dvaapi=disabled -Dvdpau=disabled -Dvulkan=enabled  -Dcuda-hwaccel=disabled -Dcuda-interop=disabled -Dzlib=enabled 

        sudo meson install -C build

#################################


# Mplayer

            apt source mplayer && cd mplayer-1.4+ds1/ && ./configure  --enable-faad --enable-gui --enable-dvdnav --disable-ffmpeg_a  --disable-vdpau  && make -j4 && sudo make install



##############################################
 
# rtsp streamig 

      https://github.com/aler9/mediamtx/releases

64 bit armv8

    wget https://github.com/bluenviron/mediamtx/releases/download/v1.8.1/mediamtx_v1.8.1_linux_arm64v8.tar.gz
armv7

      wget  https://github.com/bluenviron/mediamtx/releases/download/v1.8.1/mediamtx_v1.8.1_linux_armv7.tar.gz

armv6

        wget https://github.com/bluenviron/mediamtx/releases/download/v1.8.1/mediamtx_v1.8.1_linux_armv6.tar.gz

unzip

      tar -xf mediamtx_v1.8.1_linux_arm64v8.tar.gz

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

######################################

RTSP STREAMING WITH AUDIO FOR NEWER  RPI CAMERAS 

        sudo nano  /boot/firmware/config.txt

put this in

        camera_auto_detect=1 #on bookworm default
        #gpu_mem=256   #disable or delete not needed
        #start_x=1  #disable or delete
        

# rtsp-streaming rpicam

minimum resolution and 15 fps

        rpicam-vid  -b 700000 --autofocus-mode continuous  --denoise cdn_off    --brightness 0.1 --contrast 1.0 --sharpness 1.0  --level 4.2 --framerate 15 --width 640 --height 360   -t 0  -n  --inline -o  - |  \
       ffmpeg   -vcodec h264_v4l2m2m -avoid_negative_ts make_zero  -fflags +nobuffer+genpts+igndts  -avioflags direct -flags low_delay   -hide_banner \
      -f alsa  -i plughw:0   -r 15    -i -  -metadata title='DEVIL'  -c:v copy  -c:a libopus -application lowdelay -b:a 64k  -ar 48000 -f s16le   -fpsmax 15  -threads 4   \
      -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream

 imx219@10 camera works with minimal uplod speed over internet ! higher fps  are possible with more upload speed

        v4l2-ctl -v width=1640,height=1232,pixelformat=pRAA
        rpicam-vid  -b 1000000 --autofocus-mode continuous  --denoise cdn_off \
  --codec libav --libav-format mpegts  --brightness 0.1 --contrast 1.0 \
  --sharpness   1.0  --level 4.2 --framerate 30 --width 1536 --height 864 \
  --audio-device=plughw:CARD=Device,DEV=0   --audio-bitrate=96kbps \
  --audio-codec aac --audio-channels 1 --libav-audio 1 --audio-source alsa \
  -t 0  -n --inline -o  - | ffmpeg -fflags \
  +genpts+nobuffer+igndts+discardcorrupt -flags low_delay \
  -hwaccel drm -hwaccel_output_format drm_prime -i - -vcodec copy \
  -c:a libfdk_aac -b:a 64k  -ar 48000 -f s16le \
  -f rtsp -rtsp_transport tcp  rtsp://"user:passwort"@"localhost:8554"/mystream
       
##############################################

# USB CAMERAS 

#######################################


set  15 fps with and height always before 

        v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=1280,height=720 --set-ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0


in this examples audio device =  plughw:0  this is the first audio device ! best streaming !! no audio video delay very stable

      ffmpeg  -vcodec h264_v4l2m2m -avoid_negative_ts make_zero  -fflags +nobuffer+genpts+igndts  -avioflags direct -flags low_delay   -hide_banner  -f alsa  -i plughw:0  -f v4l2 -re  -input_format yuv420p  -i /dev/video0  -c:v h264_v4l2m2m -pix_fmt yuv420p -b:v 1700k  -fpsmax 15 -c:a libopus -application lowdelay -b:a 64k  -ar 48000 -f s16le  -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream

libfdkaac

     ffmpeg  -vcodec h264_v4l2m2m -avoid_negative_ts make_zero  -fflags +nobuffer+genpts+igndts  -avioflags direct -flags low_delay   -hide_banner  -f alsa  -i plughw:CARD=Device,DEV=0   -f v4l2 -re  -input_format yuv420p  -i /dev/video0 -metadata title="SUN"  -c:v h264_v4l2m2m -pix_fmt yuv420p -b:v 1700k -fpsmax 15 -g 25  -c:a  libfdk_aac -eld_sbr 1  -ar 44100 -b:a 32k  -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream


# inputformat h264 and copy output hwaccel drm

       v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=1280,height=720 --set-ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0,h264_level=12,h264_profile=4

       ffmpeg  -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer+genpts+igndts  -avioflags direct -flags low_delay   -hide_banner  -f alsa  -i plughw:0  -f v4l2 -re  -input_format h264  -i /dev/video0  -c:v copy  -fpsmax 15 -c:a libopus -application lowdelay -b:a 64k  -ar 48000 -f s16le  -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream



# without audio

            v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=1280,height=720 --set-ctrl=brightness=57,contrast=-11
           ffmpeg  -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer+genpts+igndts   -strict experimental    -avioflags direct -flags low_delay  -hide_banner 
    -f v4l2 -input_format yuv420p -re -i /dev/video0 -vcodec h264_v4l2m2m -b:v 1500k  -pix_fmt yuv420p -fpsmax 15 -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream



# Video + Audio libfdk_aac h264_v4l2m2m

# most compatible with all players real mp4

        v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=1280,height=720 --set-ctrl=brightness=57,contrast=-11
          ffmpeg  -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer+genpts+igndts   -strict experimental    -avioflags direct -flags low_delay  -hide_banner -f alsa  -i plughw:0  -f  v4l2 -input_format yuv420p -f v4l2 -re -i /dev/video0  -vcodec h264_v4l2m2m -b:v 1M -fpsmax 15  -c:a libfdk_aac -profile:a aac_he -ar 44100  -b:a 32k -threads 4  -f rtsp - rtsp_transport tcp  rtsp://localhost:8554/mystream

look running stream

    mpv rtsp://localhost:8554/mystream

 
  # opus only audio


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
    
    ffmpeg  -threads 4  -hwaccel drm -hwaccel_output_format drm_prime  -strict experimental -flags low_delay -fflags +genpts+nobuffer  -hide_banner -rtsp_transport tcp  \
     -re -i rtsp://127.0.0.1:8080/h264_pcm.sdp -c:v h264_v4l2m2m  -pix_fmt yuv420p -b:v 1000k -fpsmax 15-c:a libopus  -b:a 64k  -application lowdelay  -ar 48000   -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream2


#Working libfdk aac_he
    
    ffmpeg  -threads 4 -hwaccel drm -hwaccel_output_format drm_prime -strict experimental -flags low_delay -fflags +genpts+nobuffer -hide_banner -rtsp_transport tcp -re -i rtsp://127.0.0.1:8080/h264_pcm.sdp -c:v         h264_v4l2m2m   -b:v 1000k -fpsmax 15 -c:a libfdk_aac -profile:a aac_he -ar 44100  -b:a 32k  -movflags +faststart  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream2


create service autostart


    sudo nano /usr/local/bin/home-stream.sh

put this example in ! you can change framrate -r 15 audiodevice bitrate usw


    v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=1280,height=720  --set-ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0
    ffmpeg -hwaccel drm -hwaccel_output_format drm_prime  -fflags +genpts+nobuffer -avioflags direct  -flags low_delay  -hide_banner  -strict experimental   \
      -f alsa   -i plughw:0  -f v4l2 -input_format yuv420p -re -i /dev/video0 -c:v h264_v4l2m2m -b:v 1M  -pix_fmt yuv420p  -fpsmax 15  \
      -c:a libopus  -b:a 32k  -application lowdelay   -ar 48000 \
      -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream

store it and run it


    nano .config/systemd/user/home-stream.service

put this in

    [Unit]
    Description=stream
    Requires=default.target
    After=multi-user.target
    [Service]
    ExecStartPre=/bin/sleep 15
    ExecStart=home-stream.sh
    Restart=always
    ExecStop=killall ffmpeg
    #KillMode=process
    [Install]
    WantedBy=default.target


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


###############################################################################################################################

 ##   dvdrendering vob to mp4 + all subtitles plus colorpalette 

### this is the only line that worked for encrypted dvds that worked for me

           
           lsdvd /dev/sr0   && ddrescue  -b 2048  /dev/sr0   of=output.iso

so now is the img save

           
       lsdvd /dev/sr0 

### look for longest track on the end of output
       

       
       
       mplayer dvd://3 -nocache -dvd-device  input.iso  -dumpstream -dumpfile output.vob
       mplayer dvd://3 -nocache -dvd-device /dev/sr0  -dumpstream -dumpfile output.vob
       mpv dvd://2 --cache=no  --stream-dump=output.vob 
       

       
       

   ### looking for audio and subtitle

       mencoder dvdnav://2 -nocache -dvd-device  /media/storage/only_lovers_left_alive.iso -o /dev/null | grep aid 
       mencoder dvd://2 -nocache -dvd-device  /media/storage/only_lovers_left_alive.iso -o /dev/null | grep sid 
       mencoder dvd://2 -ovc copy -oac copy -vobsubout "videoname" -vobsuboutindex 0 -sid 0 -nosound -o /dev/null -vf harddup
       
       mpv dvdnav:// --cache=no  --dvd-device=exampe.iso --stream-dump=output.vob
       mpv dvd://1 --cache=no  --dvd-device=exampe.iso --stream-dump=output.vob
       sudo lsdvd -t 3 -x  /dev/sr0

simply

        mpv dvdnav:// --cache=no --dvd-device=/dev/sr0  --stream-dump=output.vob 

only comand line no gui because the gpu runns full fps ca 100 

go raspi-config boot tu terminal autologin or let the rpi untouched no htop no other gui no terminal the cpu runns on ca 30 % no heating only the gpu runs full

you find the IFO file ind the dvd foler

direct above the biggest files and copy that file to your home folder blablabla.IFO


-probesize 5400M -analyzeduration 5410M  analyse the vob for audiotracks and subtitle  this takes a long time maybe 10  or 15 minutes there is no output to this time let it run

-ifo_palette example.IFO -scodec dvdsub dvbsub


        #!/bin/bash
       for file in "$1"; do   ffmpeg  +genpts+igndts+discardcorrupt -ifo_palette example.IFO -y -probesize 2400M -analyzeduration 2410M -hwaccel drm -hwaccel_output_format drm_prime -fix_sub_duration \
      -canvas_size  720x576  -i "$file"  -ss 00:00:05 -metadata title="$file" \
      -map 0:v -scodec dvdsub   -map 0:s    \
     -c:v h264_v4l2m2m  -b:v 3M  -pix_fmt yuv420p  -num_capture_buffers 512   -num_output_buffers 64 -bufsize 5M   -maxrate 5M  -aspect 16:9 \
      -c:a libopus -b:a 128k -map 0:a -af volume=1.5   -movflags +faststart  -af volume=1.5 -avoid_negative_ts 1   -max_interleave_delta 0  -f mp4  "${file%.*}.mp4"; done

# seperate subtitles

        ffmpeg  -y -probesize 2400M -analyzeduration 2410M -hwaccel drm -hwaccel_output_format drm_prime   -i /media/sun/Filme/Neu/the-dead-dont-die.mkv   -map 0:v -scodec copy   -map 0:s:12 -map 0:s:11  -map 0:s:1  -map 0:s:2     -map 0:s:10   -c:v copy -bufsize 5M   -maxrate 5M   -c:a copy     -b:a 128k -map 0:a  -y    /media/dat/test.mkv

# without color palette -scodec copy
     
       ffmpeg  +genpts+igndts+discardcorrupt -y -probesize 2400M -analyzeduration 2410M -hwaccel drm -hwaccel_output_format drm_prime -fix_sub_duration \
        -i example.vob  -ss 00:00:05  \
      -map 0:v -scodec copy  -map 0:s -c:v h264_v4l2m2m  -b:v 3M  -pix_fmt yuv420p -num_capture_buffers 512   -num_output_buffers 64 -bufsize 5M   -maxrate 5M  -aspect 16:9 \
      -c:a libopus     -b:a 128k -map 0:a   -af volume=1.5   -movflags +faststart   -f mp4  example.mp4


# without subtitle


        ffmpeg  +genpts+igndts+discardcorrupt -y  -hwaccel drm -hwaccel_output_format drm_prime -probesize 400M -analyzeduration 410M -fix_sub_duration \
        -i output.vob  -ss 00:00:05  \
        -map 0:v   -c:v h264_v4l2m2m  -b:v 3M  -pix_fmt yuv420p -num_capture_buffers 512   -num_output_buffers 64 -bufsize 5M   -maxrate 5M  -aspect 16:9 \
        -c:a libopus     -b:a 128k -map 0:a -af volume=1.5   -movflags +faststart   -f mp4  example.mp4

# separate video

            ffmpeg -y   -fflags +genpts+igndts -ifo_palette default.IFO   -probesize 1400M -analyzeduration 1410M -hwaccel drm -hwaccel_output_format drm_prime -i output.vob -map 0:v  -c:v h264_v4l2m2m   -level 3.0 -b:v 5M -maxrate 6M   -pix_fmt yuv420p  -bufsize 5M  -num_capture_buffers 512   -num_output_buffers 64    -an -sn  -f mp4  only-lovers-audio+sub.mp4

# separate  audio + subtitle

        ffmpeg  -probesize 1400M -analyzeduration 1410M -fflags +genpts+igndts -ifo_palette default.IFO -fix_sub_duration -canvas_size  720x576    -i output.vob   -c:a libfdk_aac -b:a 128k    -map 0:a -scodec dvdsub    -map 0:s -vn  -f mp4    test.mp4


# separate only audio 

            ffmpeg  -probesize 1400M -analyzeduration 1410M -fflags +igndts  -i output.vob   -c:a libfdk_aac -b:a 128k    -map 0:a  -vn -sn  -f mp4    test.mp4

# muxing

         ffmpeg -fflags +genpts -i testv.mkv  -i test.mkv  -c:v copy -c:a copy -c:s copy  -map 0:v -map 1:a    -map 1:s  -f matroska output.mkv    

            
cheers
