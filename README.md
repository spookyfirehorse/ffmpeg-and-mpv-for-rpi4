
sorry for my bad english !!!

first make a copy of your os

       XAUTHORITY=/home/spook/.Xauthority sudo dbus-launch piclone



#  build FFMPEG with libfdk_aac

#  20 min

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

   ### rpi3 armhf z2w

    wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2t64_2.0.3-1_armhf.deb

    wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.3-1_armhf.deb

    
    sudo dpkg -i libfdk*

####  rpi4 arm64

    wge t http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.3-1_arm64.deb

    wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2t64_2.0.3-1_arm64.deb


    sudo dpkg -i libfdk*
    

###################################################



     sudo apt install cpuinfo 

    cpu-info 

    uname -a 
    
####################################################

## set arch to boot and it is important for compiling

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

         sudo apt build-dep ffmpeg -y && git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git  && cd rpi-ffmpeg/ && ./configure  --prefix=/usr --extra-version=0+deb13u1+rpt2 --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --enable-gpl --disable-stripping --disable-libmfx --disable-mmal --disable-omx --enable-gnutls --enable-libaom --enable-libass --enable-libbs2b --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libharfbuzz --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libxml2 --enable-libxvid --enable-libzimg --enable-openal --enable-opencl --enable-opengl --disable-sndio --disable-libvpl --libdir=/usr/lib/aarch64-linux-gnu  --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-vout-drm --enable-chromaprint --enable-frei0r --enable-ladspa --enable-libbluray --enable-libcaca --enable-libdvdnav --enable-libdvdread --enable-libjack --enable-libpulse --enable-librabbitmq --enable-librist --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libzmq --enable-libzvbi --enable-lv2 --enable-sand --enable-sdl2 --enable-libplacebo --enable-librav1e --enable-pocketsphinx --enable-librsvg --enable-libjxl --enable-shared --enable-nonfree --enable-libfdk-aac --enable-vulkan --enable-libopenh264 --disable-cuda --disable-vaapi --disable-vdpau --disable-cuda-nvcc --disable-static --disable-cuvid --disable-cuda-llvm --disable-ffnvcodec --enable-libx264 --enable-libx265 --disable-vaapi --disable-vdpau --disable-doc --disable-htmlpages  --disable-manpages --disable-podpages --disable-txtpages --arch=arm64 --cpu=cortex-a76 && make -j4 && sudo make install

     

 ##  rpi4 64 bit aarch64

              sudo apt build-dep ffmpeg -y  &&  git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git  && cd rpi-ffmpeg/  && ./configure --prefix=/usr --extra-version=0+deb13u1+rpt2 --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --enable-gpl --disable-stripping --disable-libmfx --disable-mmal --disable-omx --enable-gnutls --enable-libaom --enable-libass --enable-libbs2b --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libharfbuzz --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp  --enable-libxml2 --enable-libxvid --enable-libzimg --enable-openal --enable-opencl --enable-opengl --disable-sndio --disable-libvpl --libdir=/usr/lib/aarch64-linux-gnu  --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-vout-drm --enable-chromaprint --enable-frei0r --enable-ladspa --enable-libbluray --enable-libcaca --enable-libdvdnav --enable-libdvdread --enable-libjack --enable-libpulse --enable-librabbitmq --enable-librist --enable-libsrt --enable-libssh --enable-libsvtav1  --enable-libzmq --enable-libzvbi --enable-lv2 --enable-sand --enable-sdl2 --enable-libplacebo --enable-librav1e --enable-pocketsphinx --enable-librsvg --enable-libjxl --enable-shared --enable-nonfree --enable-libfdk-aac --enable-libopenh264 --disable-static --disable-nvdec --disable-nvenc --disable-cuvid --disable-cuda-llvm --disable-cuda-nvcc --disable-ffnvcodec --disable-static --disable-vaapi --disable-vdpau --enable-vulkan --enable-libx264 --enable-libx265 --disable-vaapi --disable-vdpau --disable-doc --disable-htmlpages  --disable-manpages --disable-podpages --disable-txtpages --cpu=cortex-a72 --arch=arm64 && make -j4 && sudo make install 

 

   ## rpi3 ,  zero2w , 32 bit  armv7 
   
    sudo apt build-dep ffmpeg -y &&  git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git  && cd rpi-ffmpeg/  && ./configure --extra-version=0+deb13u1+rpt2 --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --disable-libmfx --disable-mmal --disable-omx --enable-gnutls --enable-libaom --enable-libass --enable-libbs2b --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libharfbuzz --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-openal --enable-opencl --enable-opengl --disable-sndio --disable-libvpl --enable-neon --enable-v4l2-request --enable-libudev --enable-epoxy --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-vout-drm --enable-chromaprint --enable-frei0r --enable-ladspa --enable-libbluray --enable-libcaca --enable-libdvdnav --enable-libdvdread --enable-libjack --enable-libpulse --enable-librabbitmq --enable-librist --enable-libsrt --enable-libssh --enable-libsvtav1  --enable-libzmq --enable-libzvbi --enable-lv2 --enable-sand --enable-sdl2 --enable-libplacebo --enable-librav1e --enable-pocketsphinx --enable-librsvg --enable-libjxl --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf --enable-nonfree --enable-libfdk-aac --enable-libopenh264  --disable-static --disable-nvdec --disable-nvenc --disable-cuvid --disable-cuda-llvm --disable-cuda-nvcc --disable-ffnvcodec --disable-vdpau --disable-vaapi  --enable-libx264 --enable-libx265 --disable-doc --disable-htmlpages  --disable-manpages --disable-podpages --disable-txtpages --cpu=cortex-a53 --arch=armv7 && make -j4 && sudo make install

 


# MPV



       sudo apt build-dep mpv && apt source mpv

       cd mpv...version?
       dpkg-buildpackage -us -uc 

       cd ..
      sudo dpkg -i lib*mpv*.deb mpv*.deb


# compile

        apt source mpv

        cd mpv

        meson setup build

        meson configure build -Dprefix=/usr -Dlibmpv=true -Ddvdnav=enabled -Dsdl2=enabled -Dzimg=enabled -Degl=enabled -Dwayland=enabled -Degl-wayland=enabled  -Dvaapi=disabled -Dvdpau=disabled         -Dvulkan=enabled  -Dcuda-interop=disabled -Dzlib=enabled -Ddrm=enabled -Ddmabuf-wayland=enabled -Dalsa=enabled -Dcuda-hwaccel=disabled -Dpipewire=enabled  -Ddmabuf-wayland=enabled -Dvaapi        -x11=disabled  -Dvaapi-wayland=disabled -Dvaapi-drm=disabled -Dvapoursynth=enabled
        
        sudo meson install -C build

#########################

## example for drm-prime wayland all rpi

     nano .config/mpv/mpv.conf

    gpu-dumb-mode=yes
    opengl-glfinish=yes
    #gpu-context=x11egl   ###x11
    gpu-context=wayland   ##wayland
    gpu-api=opengl
    vo=gpu
    hwdec=drm
    hwdec-codecs=hevc
    hwdec-image-format=drm_prime
    gpu-hwdec-interop=drmprime
    drm-vrr-enabled=auto
        

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

upgrade

    sudo mediamtx --upgrade

######################################

RTSP STREAMING WITH AUDIO FOR RPI CAMERAS 

        sudo nano  /boot/firmware/config.txt

put this in

        camera_auto_detect=1 #on bookworm default
        #gpu_mem=256   #disable or delete not needed
        #start_x=1  #disable or delete
        
##########################################

## very important

         sudo nano /etc/sysctl.d/98-rpi.conf

         net.core.rmem_default=1000000
   
         net.core.rmem_max=1000000

          sudo reboot

 ###############################################
## alsa or pulse or pipewire   mikrofon name 

         pactl list sources 

or
         
         pactl list | grep -A2 'Source #' | grep 'Name: '  ##bookworm

         pactl list sources short  ## trixie

         for alsa   arecord -L

#    realtime stream all under 0.5 second to the reciever


       sudo nano /boot/firmware/config.txt

       vc4.tv_norm=PAL   #which is 25 fps


       may you want to set to NTSC PAL60 for framerate=30

##  rpi 3  and pi z2w  trixie audio default usb mikrofon u-green

         nice -n -11  rpicam-vid    -b 1000000    --denoise cdn_off   --codec libav --libav-format mpegts  --low-latency 1   --profile=main --hdr=off \
        --level 4.1 --framerate 25  --width 1280 --height 720   --av-sync=0 --autofocus-mode manual --autofocus-range normal --autofocus-window  0.25,0.25,0.5,0.5 \
        --audio-codec libfdk_aac    --audio-channels 1 --libav-audio 1 --audio-source pulse  --awb indoor \
         -t 0    -n  -o  - | ffmpeg  -hide_banner -fflags genpts+nobuffer -flags low_delay -avioflags direct \
        -hwaccel drm -hwaccel_output_format drm_prime -re  -i -  -metadata title='devil' -c  copy  -mpegts_copyts 1  -map 0:0 -map 0:1   \
       -f rtsp -buffer_size 4k  -muxdelay 0.1  -rtpflags latm  -rtsp_transport udp    rtsp://localhost:8554/mystream


      nano .config/mpv/mpv.conf   on the end of file put this in

      [cam]

      #container-fps-override=25
      #no-correct-pts
      #untimed
      osc=no
      opengl-swapinterval=0
      profile=fast
      interpolation=no
      #rtsp-transport=tcp
      framedrop=decoder+vo
      no-resume-playback
      video-latency-hacks=yes
      pulse-latency-hacks=yes
      demuxer-lavf-o-add=fflags=+nobuffer+genpts,avioflags=direct
      stream-buffer-size=4k
      vd-lavc-threads=1
      fullscreen=yes


         mpv --profile=cam rtsp://ip:8554


on pi 3 container override untimed no-correct-pts not nessesary       demuxer-lavf-o-add=fflags=+nobuffer+genpts for pi4 and pi 3

###########################  


# pi 4 4h stable! mikrofon usb ugreen and may all usb devices

     # realtime section

      demuxer-lavf-o-add=fflags=+nobuffer,avioflags=direct  mpv.conf

      -avioflags=direct

      avioflags very agressive if you start the camera a lot of errors give them 5 seconds 


      

      -rtbufsize 2M before -i           #realtimebufer if needed
            
        nice -n -11  rpicam-vid  -b 1000000  --denoise cdn_off --codec libav --libav-format mpegts --profile=main --hdr=off \
        --level 4.1 --framerate 25  --width 1280 --height 720   --av-sync=700000  --autofocus-mode manual --autofocus-range normal   --autofocus-window  0.25,0.25,0.5,0.5 \
        --audio-codec libfdk_aac   --audio-channels 2 --libav-audio 1   --audio-source pulse  \
        --low-latency 1 -t 0 -n -o  - | ffmpeg  -hide_banner -fflags nobuffer -flags low_delay -avioflags direct \
        -hwaccel drm -hwaccel_output_format drm_prime -r 25   -rtbufsize 50k  \
        -i -  -metadata title='lucy'  -c copy   -f rtsp  -buffer_size 4k -rtpflags latm \
        -muxdelay 0.1   -rtsp_transport udp  rtsp://localhost:8554/mystream


      nano .config/mpv/mpv.conf

      

      [cam]

      container-fps-override=25
      no-correct-pts
      untimed
      # this 3 values can be disabled but better for realtime
      
      
      osc=no
      opengl-swapinterval=0
      profile=fast
      interpolation=no
      #rtsp-transport=tcp
      framedrop=decoder+vo
      no-resume-playback
      video-latency-hacks=yes
      pulse-latency-hacks=yes
      demuxer-lavf-o-add=fflags=+nobuffer,avioflags=direct
      stream-buffer-size=4k
      vd-lavc-threads=1
      fullscreen=yes


         mpv --profile=cam rtsp://ip:8554




   ### realtime o.1 sec to reciever pi 4


       nice -n -11  rpicam-vid  -b 1000000  --denoise cdn_off --codec libav --libav-format mpegts --profile=main \
       --hdr=off --level 4.1 --framerate 25  --width 1280 --height 720 -av-sync=700000 \
       --av-sync=20000  --autofocus-mode manual --autofocus-range normal   --autofocus-window  0.25,0.25,0.5,0.5  \
       --audio-codec libfdk_aac   --audio-channels 1 --libav-audio 1 \
       --audio-source pulse --inline  --low-latency 1 -t 0 -n -o  - | ffmpeg  -hide_banner -fflags nobuffer -flags low_delay -avioflags direct \
       -hwaccel drm -hwaccel_output_format drm_prime -re  -rtbufsize 5k   -i -  -metadata title='lucy'  -c copy -f rtsp  -buffer_size 4k -rtpflags latm \
       -muxdelay 0.1   -rtsp_transport udp  rtsp://localhost:8554/mystream  




         # output

         [h264 @ 0x5559d710b0] decode_slice_header error
         [h264 @ 0x5559d710b0] no frame!
         [h264 @ 0x5559d710b0] non-existing PPS 0 referenced
         Last message repeated 1 times
         [h264 @ 0x5559d710b0] decode_slice_header error
         [h264 @ 0x5559d710b0] no frame!
         Input #0, mpegts, from 'fd:':
          Duration: N/A, start: 0.256000, bitrate: N/A
         Program 1 
         Metadata:
         service_name    : Service01
         service_provider: FFmpeg
         Stream #0:0[0x100]: Video: h264 (Main) ([27][0][0][0] / 0x001B), yuv420p(progressive), 1280x720, 25 fps, 25 tbr, 90k tbn
         Stream #0:1[0x101]: Audio: aac (LC) ([15][0][0][0] / 0x000F), 48000 Hz, mono, fltp, 32 kb/s
         Stream mapping:
         Stream #0:0 -> #0:0 (copy)
         Stream #0:1 -> #0:1 (copy)

       runing


# give the stream 60s to be stabilized then start recieving




# rtmp

# -av-sync=700000 sounblaster usb play 3 may all usb card on rpi 4 on rpi 3 -av-sync=0

       rpicam-vid -t 0  --width 1536 --height 864  --autofocus-mode manual   --framerate 24 --codec libav  \
       --audio-channels 2 --libav-audio 1 --audio-source pulse --audio-codec libfdk_aac --av-sync=700000  --hdr=off \
       --low-latency 1  --autofocus-window  0.25,0.25,0.5,0.5 -b 1000000   --libav-format flv --libav-audio   -n  -o rtmp://localhost:1935/live?"user=pi&pass=password"

--av-sync  audio is first and than the video  set the the time to little bit video first than audio and go back a little bit to sync 700000 = 0.7 sek


#######################################################################################################################################



 
         
 
###  vapoursynth


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

       ffmpeg ./configure --enable-vapoursynth
       
       
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

echo -n "user" | openssl dgst -binary -sha256 | openssl base64
echo -n "password" | openssl dgst -binary -sha256 | openssl base64

Then stored with the sha256: prefix:

authInternalUsers:
  - user: sha256:j1tsRqDEw9xvq/D7/9tMx6Jh/jMhk3UfjwIB2f1zgMo=
    pass: sha256:BdSWkrdV+ZxFBLUQQY7+7uv9RmiSVA8nrPmjGjJtZQQ=
    permissions:
      - action: publish
      - 
 rtsp://"user:password"@"localhost:8557"/mystream

      
##############################################

# USB CAMERAS 

# Video + Audio libfdk_aac h264_v4l2m2m

# most compatible with all players real mp4

        v4l2-ctl -d /dev/video0  -p 15  --set-fmt-video=width=1280,height=720 --set-ctrl=brightness=57,contrast=-11
          ffmpeg  -hwaccel drm -hwaccel_output_format drm_prime -fflags +nobuffer+discardcorrupt  \
          -strict experimental -flags low_delay  -hide_banner -f alsa  -i plughw:0 \
          -f  v4l2 -input_format yuv420p -f v4l2  -i /dev/video0  -vcodec h264_v4l2m2m -b:v 1M -fpsmax 15\
          -c:a libfdk_aac -profile:a aac_he -ar 44100  -b:a 32k -threads 4  -f rtsp - rtsp_transport tcp  rtsp://localhost:8554/mystream

look running stream

    mpv rtsp://localhost:8554/mystream


## create service autostart


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


###############################################################################################################################

 ##   dvdrendering vob to mp4 + all subtitles plus colorpalette 

### this is the only line that worked for encrypted dvds that worked for me
##  optional
           
           lsdvd /dev/sr0   && ddrescue  -b 2048  /dev/sr0   of=output.iso

so now is the img save

## lets beginn
           
       lsdvd /dev/sr0 

### look for longest track number on the end of output
       

       # only examples
       
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
