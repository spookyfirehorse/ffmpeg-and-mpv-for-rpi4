
sorry for my bad english !!!



this is an easy way to streaming usb cameras, older models of rpi cameras, and rpi-cam  on rpi 

also dvdcopy with all subtitles and colorpalette for the subtitle 

also full harware support for mpv and vlc include libfdk-aac wich is default mp4 for compatiblity with all player

this very stable 


#################################################################################################

 # rt-kernel very simple


 https://forums.raspberrypi.com/viewtopic.php?t=381025

 ##download

   wget  https://forums.raspberrypi.com/download/file.php?id=74529
 

##   do not edit config.txt auto initramfs is enabled kernel load automatic
 

 
           sudo apt build-dep linux mpv ffmpeg -y 

           sudo ./build-kernel -b default -c 7 -j 6 -u -d        ### rpi5 rt-kernel

  
           sudo ./build-kernel -b default -c 6 -j 6 -u -d        ### rpi4 rt-kernel
           

           sudo ./build-kernel -b default -c 3 -j 6 -u -d        ### rpi4 armv7l-kernel no realtime

           
          sudo mkinitramfs -o "/boot/initrd.img-$(uname -r) $(uname -r)"



# for latest libfdk

      sudo apt install libfdk*
      
   if its faild   

    git clone  https://github.com/mstorsjo/fdk-aac && \
    cd fdk-aac && \
    autoreconf -fiv && \
    ./configure  --enable-shared && \
    make -j4 && \
    sudo make install && sudo ldconfig

   ## alternativ and quick 

    wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2t64_2.0.3-1_armhf.deb

    wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.3-1_armhf.deb


    wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.3-1_arm64.deb

    wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2t64_2.0.3-1_arm64.deb
    

###################################################



     sudo apt install cpuinfo 

    cpu-info 

    uname -a 
    
####################################################

## important select the kernel to boot and it is important for compiling

    nano /boot/firmware/config.txt

64bit
    
    arm_64bit=1 

32bit

    arm_64bit=0 

##############################################################################################


     sudo apt install libopenh264-dev
     
# for latest ffmpeg

     git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git 

     git clone -b pios/bookworm https://github.com/RPi-Distro/ffmpeg.git

      git clone -b pios/trixie https://github.com/RPi-Distro/ffmpeg.git


     
##   pi 5 64 bit

         sudo apt build-dep ffmpeg && apt source ffmpeg  && cd ffmpeg-7.1.2/ && ./configure  --prefix=/usr --extra-version=0+deb13u1+rpt2 --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --enable-gpl --disable-stripping --disable-libmfx --disable-mmal --disable-omx --enable-gnutls --enable-libaom --enable-libass --enable-libbs2b --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libharfbuzz --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libxml2 --enable-libxvid --enable-libzimg --enable-openal --enable-opencl --enable-opengl --disable-sndio --disable-libvpl --libdir=/usr/lib/aarch64-linux-gnu  --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-vout-drm --enable-chromaprint --enable-frei0r --enable-ladspa --enable-libbluray --enable-libcaca --enable-libdvdnav --enable-libdvdread --enable-libjack --enable-libpulse --enable-librabbitmq --enable-librist --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libzmq --enable-libzvbi --enable-lv2 --enable-sand --enable-sdl2 --enable-libplacebo --enable-librav1e --enable-pocketsphinx --enable-librsvg --enable-libjxl --enable-shared --enable-nonfree --enable-libfdk-aac --enable-vulkan --enable-libopenh264 --disable-cuda --disable-vaapi --disable-vdpau --disable-cuda-nvcc --disable-static --disable-cuvid --disable-cuda-llvm --disable-ffnvcodec --disable-libx264 --disable-libx265 --disable-vaapi --disable-vdpau --disable-doc --disable-htmlpages  --disable-manpages --disable-podpages --disable-txtpages --arch=arm64 --cpu=cortex-a76 && make -j4 && sudo make install

     

 ##  rpi4 64 bit aarch64

              sudo apt build-dep ffmpeg && apt source ffmpeg  && cd ffmpeg-7.1.2/ && ./configure --prefix=/usr --extra-version=0+deb13u1+rpt2 --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --enable-gpl --disable-stripping --disable-libmfx --disable-mmal --disable-omx --enable-gnutls --enable-libaom --enable-libass --enable-libbs2b --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libharfbuzz --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp  --enable-libxml2 --enable-libxvid --enable-libzimg --enable-openal --enable-opencl --enable-opengl --disable-sndio --disable-libvpl --libdir=/usr/lib/aarch64-linux-gnu  --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-vout-drm --enable-chromaprint --enable-frei0r --enable-ladspa --enable-libbluray --enable-libcaca --enable-libdvdnav --enable-libdvdread --enable-libjack --enable-libpulse --enable-librabbitmq --enable-librist --enable-libsrt --enable-libssh --enable-libsvtav1  --enable-libzmq --enable-libzvbi --enable-lv2 --enable-sand --enable-sdl2 --enable-libplacebo --enable-librav1e --enable-pocketsphinx --enable-librsvg --enable-libjxl --enable-shared --enable-nonfree --enable-libfdk-aac --enable-libopenh264 --disable-static --disable-nvdec --disable-nvenc --disable-cuvid --disable-cuda-llvm --disable-cuda-nvcc --disable-ffnvcodec --disable-static --disable-vaapi --disable-vdpau --enable-vulkan --disable-libx264 --disable-libx265 --disable-vaapi --disable-vdpau --disable-doc --disable-htmlpages  --disable-manpages --disable-podpages --disable-txtpages --cpu=cortex-a72 --arch=arm64 && make -j4 && sudo make install 

 

   ## rpi3 ,  zero2w , 32 bit  armv7 
   
    sudo apt build-dep ffmpeg && apt source ffmpeg  && cd ffmpeg-7.1.2/ && ./configure --extra-version=0+deb13u1+rpt2 --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --disable-libmfx --disable-mmal --disable-omx --enable-gnutls --enable-libaom --enable-libass --enable-libbs2b --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libharfbuzz --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-openal --enable-opencl --enable-opengl --disable-sndio --disable-libvpl --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-vout-drm --enable-chromaprint --enable-frei0r --enable-ladspa --enable-libbluray --enable-libcaca --enable-libdvdnav --enable-libdvdread --enable-libjack --enable-libpulse --enable-librabbitmq --enable-librist --enable-libsrt --enable-libssh --enable-libsvtav1  --enable-libzmq --enable-libzvbi --enable-lv2 --enable-sand --enable-sdl2 --enable-libplacebo --enable-librav1e --enable-pocketsphinx --enable-librsvg --enable-libjxl --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf --enable-nonfree --enable-libfdk-aac --enable-libopenh264  --disable-static --disable-nvdec --disable-nvenc --disable-cuvid --disable-cuda-llvm --disable-cuda-nvcc --disable-ffnvcodec --disable-vdpau --disable-vaapi  --disable-libx264 --disable-libx265 --disable-doc --disable-htmlpages  --disable-manpages --disable-podpages --disable-txtpages --cpu=cortex-a53 --arch=armv7 && make -j4 && sudo make install

 #### rpi4 armv7l

      ./configure --prefix=/usr --extra-version=0+deb13u1+rpt2 --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --disable-libmfx --disable-mmal --disable-omx --enable-gnutls --enable-libaom --enable-libass --enable-libbs2b --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libharfbuzz --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-openal --enable-opencl --enable-opengl --disable-sndio --disable-libvpl --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-vout-drm --enable-chromaprint --enable-frei0r --enable-ladspa --enable-libbluray --enable-libcaca --enable-libdvdnav --enable-libdvdread --enable-libjack --enable-libpulse --enable-librabbitmq --enable-librist --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libx264 --enable-libzmq --enable-libzvbi --enable-lv2 --enable-sand --enable-sdl2 --enable-libplacebo --enable-librav1e --enable-pocketsphinx --enable-librsvg --enable-libjxl --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf  --disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-nonfree --enable-libfdk-aac --cpu=cortex-a72 --arch=armv7l
        


# MPV



       sudo apt build-dep mpv && apt source mpv

       cd mpv...version?
       dpkg-buildpackage -us -uc 

       cd ..
      sudo dpkg -i lib*mpv*.deb mpv*.deb


compile
        apt source mpv

        cd mpv

        meson setup build

        meson configure build -Dprefix=/usr -Dlibmpv=true -Ddvdnav=enabled -Dsdl2=enabled -Dzimg=enabled -Degl=enabled -Dwayland=enabled -Degl-wayland=enabled  -Dvaapi=disabled -Dvdpau=disabled    -Dvulkan=enabled  -Dcuda-interop=disabled -Dzlib=enabled -Ddrm=enabled -Ddmabuf-wayland=enabled -Dalsa=enabled -Dcuda-hwaccel=disabled -Dpipewire=enabled  -Ddmabuf-wayland=enabled -Dvaapi-x11=disabled  -Dvaapi-wayland=disabled -Dvaapi-drm=disabled -Dvapoursynth=enabled
        
        sudo meson install -C build

#########################

## example for drm-prime wayland  rpi4 rpi 3

     nano .config/mpv/mpv.conf

    gpu-dumb-mode=yes
    opengl-glfinish=yes
    #gpu-context=x11egl   ###x11
    gpu-context=wayland   ##wayland
    gpu-api=opengl
    vo=gpu
    hwdec=auto
    hwdec-codecs=all
    #hwdec-image-format=drm_prime
    #gpu-hwdec-interop=drmprime-overlay


## example for drm-prime wayland  rpi5

        #override-display-fps=60
        #video-sync=display-resample

        
        gpu-dumb-mode=yes
        opengl-glfinish=yes
        gpu-context=wayland
         #gpu-context=x11egl    ##x11
        gpu-api=opengl
        vo=gpu
        gpu-sw=yes
        drm-vrr-enabled=auto
        hwdec=drm   ##or drm-copy

    


#####################################################################


        

#################################


# Mplayer

          sudo apt build-dep mplayer &&  apt source mplayer && cd mplayer-1.5+svn38674/  && ./configure --prefix=/usr --enable-faad --enable-gui --enable-dvdnav --disable-ffmpeg_a  --disable-vdpau  && make -j4 && sudo make install



##############################################
 
# rtsp streamig

   sudo nano /etc/sysctl.d/98-rpi.conf

   net.core.rmem_default=1000000
   
   net.core.rmem_max=1000000

      https://github.com/aler9/mediamtx/releases

64 bit armv8

      wget https://github.com/bluenviron/mediamtx/releases/download/v1.15.4/mediamtx_v1.15.4_linux_arm64.tar.gz

armv7 32 bit

       wget  https://github.com/bluenviron/mediamtx/releases/download/v1.15.4/mediamtx_v1.15.4_linux_armv7.tar.gz
     


unzip

         tar -xf mediamtx_v1.15.4_linux_arm64v8.tar.gz

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
        
##########################################
        
         pactl list sources 

or
         
         pactl list | grep -A2 'Source #' | grep 'Name: '  ##bookworm

         pactl list sources short  ## trixie

         for alsa   arecord -L

# rtsp-streaming rpicam pulse pipewire


    rpicam-vid    -b 10000000  --autofocus-mode continuous  --denoise cdn_off \
    --codec libav --libav-format mpegts  --brightness 0.1 --contrast 1.0 \
    --sharpness   1.0  --level 4.1 --hdr=off  --profile=high  --framerate 30 --width 1536 --height 864 \
    --audio-device=alsa_input.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.mono-fallback   --audio-bitrate=96kbps \
    --audio-codec libopus  --audio-channels 1 --libav-audio 1 --audio-source pulse   -t 0  -n --inline -o  - | ffmpeg  -flags low_delay \
    -vcodec h264_v4l2m2m -i - -metadata title='MOON' -codec copy -threads $(nproc) \
    -f rtsp -rtsp_transport tcp  rtsp://"user:password"@"localhost:8554"/mystream   >/dev/null 2>&1

##  pulseaudio flv aac

      nice -n 19  rpicam-vid    -b 1000000 --autofocus-mode continuous  --denoise cdn_off \
      --codec libav --libav-format flv --libav-video-codec h264_v4l2m2m  --brightness 0.1 --contrast 1.0 \
      --profile=high --hdr=off    --sharpness   1.0  --level 4.1 --framerate 25  --width 1563 --height 864 \
      --audio-device=alsa_input.usb-Creative_Technology_Ltd_Sound_Blaster_Play__3_00229929-00.analog-stereo    --audio-bitrate=96kbps \
      --audio-codec aac  --audio-channels 2 --libav-audio 1 --audio-source pulse --av-sync=1000  \
      -t 0  -n --inline -o  - | ffmpeg  -fflags +nobuffer+genpts+discardcorrupt -flags low_delay+global_header  -vcodec h264_v4l2m2m -i - -metadata title='lucy' -codec copy  -threads $(nproc)  -rtsp_flags prefer_tcp \
      -f rtsp -rtsp_transport tcp  rtsp://localhost:8554"/mystream 

  ### drm alsa  libfdk
  
    nice -n 19  rpicam-vid    -b 1000000 --autofocus-mode continuous  --denoise cdn_off \
     --codec libav --libav-format flv --libav-video-codec h264_v4l2m2m --brightness 0.1 --contrast 1.0 \
     --profile=high --hdr=off    --sharpness   1.0  --level 4.1 --framerate 25  --width 1563 --height 864 \
     --audio-device=plughw:CARD=S3,DEV=0    --audio-bitrate=96kbps \
     --audio-codec libfdk_aac  --audio-channels 2 --libav-audio 1 --audio-source alsa --av-sync=1000  \
     -t 0  -n --inline -o  - | ffmpeg  -fflags +nobuffer+genpts+discardcorrupt -flags low_delay+global_header  -hwaccel drm -hwaccel_output_format drm_prime -i - -metadata title='lucy' -codec copy  -threads $(nproc)  -rtsp_flags prefer_tcp \
     -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream
  

  


## test rpi4  

      nice -n 19  rpicam-vid --low-latency 1  -b 1000000 --autofocus-mode manual --autofocus-range normal --autofocus-window  0.25,0.25,0.5,0.5  --denoise cdn_off \
      --codec=libav --libav-format=mpegts --libav-video-codec h264_v4l2m2m  --brightness 0.1 --contrast 1.0 \
      --profile=high --hdr=off    --sharpness   1.0  --level 4.2 --framerate 25  --width 1280 --height 720 \
      --audio-device=alsa_input.usb-Creative_Technology_Ltd_Sound_Blaster_Play__3_00229929-00.analog-stereo   --audio-bitrate=96kbps  \
      --audio-codec libopus  --audio-channels 2 --libav-audio 1 --audio-source pulse  \
      -t 0    --av-sync=0   -n  -o  - | ffmpeg  -fflags nobuffer   -flags low_delay+global_header   \
      -hwaccel drm -hwaccel_output_format drm_prime   -re   -i  -  -metadata title='lucy' -codec copy \
      -threads $(nproc)   -rtsp_flags prefer_tcp  -f rtsp -rtsp_transport tcp  rtsp://"localhost:8554"/mystream-sync
      
# MPV rpi 3  , zero2w 


       nice -n 19  rpicam-vid --low-latency 1  -b 1000000 --autofocus-mode manual --autofocus-range normal --autofocus-window  0.25,0.25,0.5,0.5  --denoise cdn_off \
      --codec=libav --libav-format=flv --libav-video-codec h264_v4l2m2m  --brightness 0.1 --contrast 1.0  \
      --profile=high --hdr=off    --sharpness   1.0  --level 4.2 --framerate 25  --width 1280 --height 720 \
      --audio-device=alsa_input.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.mono-fallback   --audio-bitrate=96kbps --audio-samplerate=48000   \
      --audio-codec aac  --audio-channels 1 --libav-audio 1 --audio-source pulse  \
      -t 0 --inline  -n  -o  -  | mpv -  --profile=stream -o rtsp://"localhost:8554"/mystream  
       
      nano .config/mpv/mpv.conf


     [stream]

    #hwdec=v4l2m2m-copy
    hwdec=drm
    hwdec-codecs=hevc
    hwdec-image-format=drm_prime
    gpu-hwdec-interop=drmprime
    hwdec-extra-frames=2
    ovc=h264_v4l2m2m
    ovcopts=b=1M
    oac=libfdk_aac
    oacopts=b=64k
    cache=no
    framedrop=decoder+vo
    audio-buffer=0.5
    vd-lavc-threads=1
     cache-pause=no
     demuxer-lavf-o-add=fflags=+nobuffer,flags=low_delay
     #,use_wallclock_as_timestamp=1
     of=rtsp
     volume=100
     rtsp-transport=udp
     #audio=no
     stream-buffer-size=4k
     #interpolation=no
     vd-lavc-threads=1
     #demuxer-lavf-analyzeduration=0.1
     #demuxer-lavf-probe-info=nostreams
     initial-audio-sync=yes
     oset-metadata=title="Devil",comment="stream"
     audio-format=s16
     audio-samplerate=48000
     #untimed=yes
     #correct-pts=no
     vo-null-fps=25
     demuxer-lavf-hacks=yes
     #container-fps-override=25
     hr-seek-framedrop=no
     video-sync=audio
     pulse-latency-hacks=yes
     gpu-dumb-mode=yes
     video-latency-hacks=yes
     audio-demuxer=lavf
     #speed=1.001
     #audio-delay=-1
     #display-fps-override=50
     #input-ipc-server=mpvpipe
     #audio-backward-batch=50 
     #autosync=100
     #tscale=oversample






       wget https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2024.9.1_all.deb

       sudo dpkg -i deb-multimedia-keyring_2024.9.1_all.deb

        sudo nano /etc/apt/sources.list.d/raspbian.sources

        
       Types: deb
       URIs: https://www.deb-multimedia.org
       Suites: unstable
       Components: main non-free
       Signed-By: /usr/share/keyrings/deb-multimedia-keyring.pgp
       Enabled: yes
       Architekture:arm64

       sudo apt update

       sudo apt install vapoursynth-dev

       
       
       
# edit mediamtx for password 

         sudo nano /usr/local/etc/mediamtx.yaml
one time for user one time for passwd

 echo -n "mypass" | argon2 saltItWithSalt -id -l 32 -e
Then stored with the argon2: prefix:

authInternalUsers:
  - user: argon2:$argon2id$v=19$m=4096,t=3,p=1$MTIzNDU2Nzg$OGGO0eCMN0ievb4YGSzvS/H+Vajx1pcbUmtLp2tRqRU
    pass: argon2:$argon2i$v=19$m=4096,t=3,p=1$MTIzNDU2Nzg$oct3kOiFywTdDdt19kT07hdvmsPTvt9zxAUho2DLqZw
    permissions:
      - action: publish
To use SHA256, the string must be hashed with SHA256 and encoded with base64:

echo -n "mypass" | openssl dgst -binary -sha256 | openssl base64
Then stored with the sha256: prefix:

authInternalUsers:
  - user: sha256:j1tsRqDEw9xvq/D7/9tMx6Jh/jMhk3UfjwIB2f1zgMo=
    pass: sha256:BdSWkrdV+ZxFBLUQQY7+7uv9RmiSVA8nrPmjGjJtZQQ=
    permissions:
      - action: publish
       
without password alsa

    rpicam-vid  --low-latency 1  -b 10000000  --autofocus-mode continuous  --denoise cdn_off \
    --codec libav --libav-format mpegts  --brightness 0.1 --contrast 1.0 \
    --sharpness   1.0  --level 4.1 --hdr=off  --profile=high  --framerate 30 --width 1536 --height 864 \
    --audio-device=plughw:CARD=Device,DEV=0   --audio-bitrate=96kbps \
    --audio-codec libopus  --audio-channels 1 --libav-audio 1 --audio-source alsa   -t 0  -n --inline -o  - | ffmpeg  -flags low_delay \
     -vcodec h264_v4l2m2m -i - -metadata title='MOON' -codec copy \
    -f rtsp -rtsp_transport tcp  rtsp://"localhost:8554"/mystream      

##############################################

# USB CAMERAS 

#######################################


set  15 fps with and height always before 

        v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=1280,height=720 --set-ctrl=brightness=57,contrast=-11,exposure_dynamic_framerate=0


in this examples audio device =  plughw:0  this is the first audio device ! best streaming !! no audio video delay very stable

      ffmpeg  -vcodec h264_v4l2m2m -avoid_negative_ts make_zero  -fflags +nobuffer+genpts+igndts -flags low_delay   -hide_banner  -f alsa  -i plughw:0  -f v4l2 -re  -input_format yuv420p  -i /dev/video0  -c:v h264_v4l2m2m -pix_fmt yuv420p -b:v 1700k  -fpsmax 15 -c:a libopus -application lowdelay -b:a 64k  -ar 48000 -f s16le  -threads 4  -f rtsp -rtsp_transport tcp  rtsp://localhost:8554/mystream

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

its not working on rpi but on amd64 because libv4l2 and h264_v4l2m2m are the same devices on rpi

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
