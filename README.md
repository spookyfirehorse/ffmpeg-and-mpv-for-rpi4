
sorry for my bad english !!!

first make a copy of your trixie os

```bash
```
```bash
XAUTHORITY=/home/spook/.Xauthority sudo dbus-launch piclone
```
most of comands for all rpi but sure for trixie

#  build FFMPEG with libfdk_aac

#  20 min

# for latest libfdk

      sudo apt install libfdk*
      
   if its faild
   
```bash
git clone  https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure  --enable-shared && \
make -j4 && \
sudo make install && sudo ldconfig
```

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

```bash
git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg/ && \
./configure --prefix=/usr --extra-version=0+deb13u1+rpt2 --toolchain=hardened \
--incdir=/usr/include/aarch64-linux-gnu --libdir=/usr/lib/aarch64-linux-gnu \
--enable-gpl --enable-nonfree --enable-shared --disable-static \
--arch=aarch64 --cpu=cortex-a76 --extra-cflags="-mcpu=cortex-a76 -mtune=cortex-a76" --extra-ldflags="-latomic" --enable-neon \
--enable-gnutls --enable-libxml2 --enable-libudev --enable-v4l2-m2m --enable-sand --enable-v4l2-request \
--enable-libx264 --enable-libx265 --enable-libopus --enable-libfdk-aac --enable-libmp3lame \
--enable-libvorbis --enable-libvpx --enable-libdav1d --enable-libaom --enable-libwebp --enable-libzimg \
--enable-libass --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libharfbuzz \
--enable-libpulse --enable-libjack --enable-libssh --enable-libsrt --enable-libzmq \
--enable-opengl --enable-vulkan --enable-epoxy --enable-libdrm  --enable-vout-drm  --enable-sdl2 \
--disable-v4l2-request --disable-mmal --disable-omx --disable-libmfx --disable-libvpl \
--disable-libbluray --disable-libmysofa --disable-libcaca --disable-pocketsphinx --disable-libjxl \
--disable-chromaprint --disable-libdvdnav --disable-libdvdread --disable-libcodec2 --disable-libgsm --disable-libgme --disable-libopenmpt \
--disable-cuda --disable-cuvid --disable-nvenc --disable-nvdec --disable-ffnvcodec --disable-vaapi --disable-vdpau \
--disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --disable-vfp --disable-thumb --enable-hardcoded-tables  && \
make -j$(nproc) && sudo make install
```


```bash

```
            
        
   # #     pi4 new

```bash
sudo apt build-dep ffmpeg -y && git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg/ && \
./configure --prefix=/usr --extra-version=0+deb13u1+rpt2 \
--toolchain=hardened --enable-gpl --enable-nonfree \
--enable-shared --disable-static --incdir=/usr/include/aarch64-linux-gnu --libdir=/usr/lib/aarch64-linux-gnu \
--disable-doc --disable-debug --disable-stripping \
--arch=aarch64 --cpu=cortex-a72 --extra-cflags="-mcpu=cortex-a72 -mtune=cortex-a72" --extra-ldflags="-latomic" \
--enable-neon --disable-vfp --disable-thumb --enable-epoxy --enable-v4l2-request \
--enable-libssh --enable-gnutls --enable-network \
--enable-v4l2-m2m --disable-v4l2-request --enable-libdrm --enable-libudev \
--enable-libx264 --enable-libx265 --enable-libvpx --enable-libdav1d \
--enable-libopus --enable-libfdk-aac --enable-libmp3lame --enable-libvorbis \
--enable-libpulse --enable-libxml2  \
--enable-libass --enable-libfreetype --enable-libfontconfig \
--enable-libwebp --enable-libzimg \
--enable-opengl --enable-sand --enable-vout-drm \
--disable-vaapi --disable-vdpau --disable-vulkan \
--disable-cuda --disable-cuvid --disable-nvenc --disable-nvdec --disable-ffnvcodec \
--disable-appkit --disable-avfoundation --disable-coreimage --disable-audiotoolbox \
--disable-videotoolbox --disable-amf --disable-d3d11va --disable-dxva2 \
--disable-mediafoundation --disable-libmfx --disable-libvpl --disable-libnpp \
--disable-mmal --disable-omx --disable-vfp --disable-thumb \
--disable-libcaca --disable-libbluray --disable-libmysofa --disable-pocketsphinx --disable-libjxl --enable-hardcoded-tables   && \
make -j$(nproc) && \
sudo make install
```

## pi3 armhf new      

```bash
sudo apt build-dep ffmpeg -y && git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg/ && \
./configure --prefix=/usr --extra-version=0+deb13u1+rpt2 --toolchain=hardened --enable-gpl --enable-nonfree --enable-shared \
--disable-static --disable-doc --disable-debug --disable-stripping --enable-epoxy --enable-neon --enable-libssh --enable-v4l2-m2m --enable-v4l2-request \
--disable-v4l2-request --enable-libdrm --enable-libudev --enable-libx264 --enable-libx265 --enable-libvpx --enable-libdav1d --enable-libopus \
--enable-libfdk-aac --enable-libmp3lame --enable-libssh --enable-libvorbis --enable-libpulse --enable-libxml2 --enable-gnutls --enable-libass --enable-libfreetype \
--enable-libfontconfig --enable-libwebp --enable-libzimg --enable-opengl --enable-sand --enable-vout-drm  --enable-network --enable-hardcoded-tables \
--disable-vaapi --disable-vdpau --disable-cuda --disable-cuvid --disable-nvenc --disable-nvdec --disable-ffnvcodec --disable-libcaca \
--disable-libbluray --disable-libmysofa --disable-pocketsphinx --disable-libjxl --disable-doc --disable-htmlpages  --disable-manpages \
--disable-podpages --disable-txtpages --disable-vaapi --disable-vdpau --disable-cuda --disable-cuvid --disable-nvenc --disable-nvdec \
--disable-ffnvcodec --disable-libcaca --disable-libbluray --disable-libmysofa --disable-pocketsphinx --disable-libjxl --disable-appkit \
--disable-avfoundation --disable-coreimage --disable-audiotoolbox --disable-videotoolbox --disable-amf --disable-d3d11va --disable-dxva2 \
--disable-mediafoundation --disable-vulkan --disable-libmfx --disable-libvpl --libdir=/usr/lib/arm-linux-gnueabihf --incdir=/usr/include/arm-linux-gnueabihf \
--disable-libnpp --disable-mmal --disable-omx --enable-vfp --enable-thumb --arch=armhf --cpu=cortex-a53 --disable-armv5te --disable-armv6 --disable-armv6t2 \
--extra-cflags="-mcpu=cortex-a53 -mtune=cortex-a53" --extra-ldflags="-latomic" && make -j$(nproc) && sudo make install
```
         


# MPV
```bash
sudo apt build-dep mpv -y && \
apt source mpv && \
cd mpv-* && \
dpkg-buildpackage -us -uc && \
cd .. && \
sudo dpkg -i lib*mpv*.deb mpv*.deb
```

```bash
apt source mpv
cd mpv
meson setup build
meson setup build \
--prefix=/usr \
--buildtype=release \
-Dlibmpv=true \
-Dwayland=enabled \
-Ddmabuf-wayland=enabled \
-Dpipewire=enabled \
-Dvulkan=enabled \
-Ddrm=enabled \
-Dgbm=enabled \
-Dvaapi=disabled \
-Dvdpau=disabled \
-Dcuda-hwaccel=disabled 
sudo meson install -C build
```

      
#########################

## example for drm-prime wayland all rpi

```bash
nano .config/mpv/mpv.conf
```

```bash
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
dither=no
scale=bilinear
 ```
    

#################################


# Mplayer

```bash
sudo apt build-dep mplayer &&  apt source mplayer && cd mplayer-1.5+svn38674/  && ./configure --prefix=/usr \
--enable-faad --enable-gui --enable-dvdnav --disable-ffmpeg_a  --disable-vdpau  && make -j4 && sudo make install
 ```


##############################################
 
# rtsp streamig

```bash
sudo nano /etc/sysctl.d/98-rpi.conf
```
```bash
net.core.rmem_default=1000000
net.core.rmem_max=1000000
```
```bash 
net.core.rmem_max=1000000
```

#  https://github.com/aler9/mediamtx/releases

64 bit armv8

```bash
 wget https://github.com/bluenviron/mediamtx/releases/download/v1.15.4/mediamtx_v1.15.4_linux_arm64.tar.gz
```
armv7 32 bit

```bash
 wget  https://github.com/bluenviron/mediamtx/releases/download/v1.15.4/mediamtx_v1.15.4_linux_armv7.tar.gz
```    


unzip

```bash
tar -xf mediamtx_v1.15.4_linux_arm64v8.tar.gz

move it to

```bash
sudo mv mediamtx /usr/local/bin/
sudo mv mediamtx.yml /usr/local/etc/
```

this create mediamtx.service

```bash
sudo tee /etc/systemd/system/mediamtx.service >/dev/null << EOF
[Unit]
Wants=network.target
[Service]
ExecStart=/usr/local/bin/mediamtx /usr/local/etc/mediamtx.yml
[Install]
WantedBy=multi-user.target
EOF
```    
and reload

```bash
sudo systemctl daemon-reload && sudo systemctl enable mediamtx && sudo systemctl start mediamtx
```


upgrade

```bash
sudo mediamtx --upgrade
```

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

##  rpi 3  and pi z2w  trixie audio default usb mikrofon u-green  24 h stable

```bash
nice -n -11 rpicam-vid \
-b 1000000 --denoise cdn_off --awb indoor \
--codec libav --libav-format mpegts --profile main \
--framerate 25 --width 1280 --height 720 \
--inline -t 0 -n -o - | \
ffmpeg -f mpegts -fflags +genpts+nobuffer+flush_packets -i - \
-f pulse -wallclock 1 -i default \
-c:v copy \
-c:a libopus -application lowdelay -ac 1 -vbr off -b:a 64k -frame_duration 5 \
-metadata title='lucy' \
-f rtsp -rtsp_transport tcp -muxdelay 0 -rtpflags latm -tcp_nodelay 1 \
-flags +low_delay -avioflags direct \
rtsp://lucy:8557"/mystream
```

         
         
       
               mpv rtsp://"user:passwd"@"receiverip:8554"/mystream
               
               mpv rtsp://receiverip:8554/mystream

       


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
       demuxer-lavf-o-add=fflags=+nobuffer+genpts
       stream-buffer-size=4k
       vd-lavc-threads=1
       fullscreen=yes
       ytdl=no
       hr-seek=no
       demuxer=lavf
       chache=no
       gpu-dumb-mode=yes
       frames=1000000
       demuxer-readahead-secs=0

      


         mpv --profile=cam rtsp://ip:8554

########################### 


the winner


## realtime on the end of this file


   # tcp h264  for all rpi low latenz

   
                nice -n -11 stdbuf -oL -eL taskset -c 2,3  rpicam-vid --verbose 0  \
              --denoise cdn_off -t 0 --width 1280 --height 720 --framerate 25 \
              --autofocus-mode manual --autofocus-range normal \
              --autofocus-window 0.25,0.25,0.5,0.5 \
              --libav-video-codec h264_v4l2m2m --libav-format h264 --codec libav --inline \
              --awb indoor --profile baseline --intra 25 -b 1500000 -n -o - 2>/dev/null  | \
              nice -n -11 taskset -c 0,1  ffmpeg -y -hwaccel drm -hwaccel_device /dev/dri/renderD128  \
              -fflags +genpts+igndts+nobuffer+flush_packets -loglevel warning  \
              -use_wallclock_as_timestamps 1 \
              -thread_queue_size 512 -f h264 -r 25 -i - \
              -thread_queue_size 512 -f pulse -fragment_size 1024 -isync 0 -i default \
              -c:v copy -metadata title='kali'  \
              -c:a libopus -application lowdelay -ac 1 -vbr off -b:a 64k -frame_duration 5  -compression_level 0  \
              -map 0:v:0 -map 1:a:0 \
              -f rtsp -rtsp_transport udp  -muxdelay 0 -flags +low_delay -avioflags direct -pkt_size 1316  \
              rtsp://"user:pwd"@"localhost:8554"/mystream




           

 h264 short udp

           nice -n -11 rpicam-vid -t 0 --width 1280 --height 720 --intra 25--framerate 25 --codec h264 --inline --flush -n -o - | \
           ffmpeg -y -use_wallclock_as_timestamps 1 \
          -fflags +genpts+nobuffer \
           -f h264 -i - \
           -f pulse -isync 0 -i default \
          -c:v h264_v4l2m2m -b:v 1500k -maxrate 1500k -bufsize 3000k -g 50 \
          -c:a libfdk_aac -b:a 128k -ac 1 \
          -af "aresample=async=1000:min_hard_comp=0.01" \
          -map 0:v:0 -map 1:a:0 \
          -fps_mode cfr \
          -f rtsp -rtsp_transport udp \
          -muxdelay 0 -flags low_delay -avioflags direct -pkt_size 1316 \
          rtsp://"user:passwd"@"localhost:8557"/mystream

best cpu best streaming favorit pi 4 and 5

              nice -n -11 stdbuf -oL -eL taskset -c 2,3  rpicam-vid --verbose 0  \
              --denoise cdn_off -t 0 --width 1280 --height 720 --framerate 25 \
              --autofocus-mode manual --autofocus-range normal \
              --autofocus-window 0.25,0.25,0.5,0.5 \
              --libav-video-codec h264_v4l2m2m --libav-format h264 --codec libav --inline \
              --awb indoor --profile baseline --intra 25 -b 1500000 -n -o - 2>/dev/null  | \
              nice -n -11 taskset -c 0,1  ffmpeg -y -hwaccel drm -hwaccel_device /dev/dri/renderD128  \
              -fflags +genpts+igndts+nobuffer+flush_packets -loglevel warning  \
              -use_wallclock_as_timestamps 1 \
              -thread_queue_size 512 -f h264 -r 25 -i - \
              -thread_queue_size 512 -f pulse -fragment_size 1024 -isync 0 -i default \
              -c:v copy -metadata title='kali'  \
              -c:a libopus -application lowdelay -ac 1 -vbr off -b:a 64k -frame_duration 5  -compression_level 0  \
              -map 0:v:0 -map 1:a:0 \
              -f rtsp -rtsp_transport udp  -muxdelay 0 -flags +low_delay -avioflags direct -pkt_size 1316  \
              rtsp://"spooky:password"@"localhost:8554"/mystream
 

# rtmp 

              nice -n -11 stdbuf -oL -eL rpicam-vid --denoise cdn_off -t 0 --width 1280 --height 720 --framerate 24 \
              --libav-video-codec h264_v4l2m2m --libav-format flv --codec libav --inline \
              --autofocus-mode manual --autofocus-range normal --autofocus-window 0.25,0.25,0.5,0.5 \
              --awb indoor --profile baseline --hdr off --intra 25 --level 4.1 -b 1000000 \
              --flush -n -o - | \
              nice -n -11 ffmpeg -y \
              -use_wallclock_as_timestamps 1 \
              -fflags +genpts+nobuffer+flush_packets \
              -thread_queue_size 1024 \
              -c:v h264_v4l2m2m -num_output_buffers 4 -f flv -i - \
              -thread_queue_size 1024 -f pulse -fragment_size 512 -isync 0 -i default \
              -map 0:v:0 -map 1:a:0 \
              -c:v h264_v4l2m2m -num_capture_buffers 8 -num_output_buffers 4 \
              -b:v 1000k -maxrate 1000k -bufsize 500k -g 25 -bf 0 -fps_mode cfr \
              -c:a libfdk_aac -b:a 128k -ac 1 -afterburner 0  \
              -f rtsp -rtsp_transport tcp -tcp_nodelay 1 -rtsp_flags prefer_tcp \
              -muxdelay 0 -max_interleave_delta 1 -flags +low_delay -avioflags direct -pkt_size 1316 \
              rtmp://localhost:1935/live?"user=spooky&pass=password"

              mpv  --profile=cam rtmp://localhost:1935/live?"user=spooky&pass=password"
         

### rec 


       nano .config/mpv/mpv.conf


       [convert]

       hwaccel=auto
       #vf-add = scale=480:-2
       ovc = libx264
       ovcopts-add = preset=medium
       ovcopts-add = tune=fastdecode
       ovcopts-add = b=1M
       ovcopts-add = maxrate=1M,minrate=1M
       ovcopts-add = bufsize=1M
       ovcopts-add = rc_init_occupancy=900k
       ovcopts-add = refs=2
       ovcopts-add = profile=baseline
       profile=enc-a-aac
       of=matroska
       framedrop=decoder
       #demuxer-lavf-o-add=fflags=+nobuffer+genpts
       container-fps-override=25
       no-correct-pts
       untimed


       mpv rtsp://"user:pwd"@"ip:8554"/mystream  --profile=convert --o=`date +%Y-%m-%d-%H-%M`.mkv


#######################################################################################################################################



 
         
 
                                            vapoursynth


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
 rtsp://"user:password"@"localhost:8554"/mystream

      
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

you find the IFO file in the dvd foler

direct above the biggest files and copy that file to your home folder blablabla.IFO


-probesize 5400M -analyzeduration 5410M  analyse the vob for audiotracks and subtitle  this takes a long time maybe 10  or 15 minutes there is no output to this time let it run

-ifo_palette example.IFO -scodec dvdsub dvbsub


        #!/bin/bash
       for file in "$1"; do   ffmpeg  +genpts+igndts+discardcorrupt -ifo_palette example.IFO -y \
       -probesize 2400M -analyzeduration 2410M -hwaccel drm -hwaccel_output_format drm_prime -fix_sub_duration \
      -canvas_size  720x576  -i "$file"  -ss 00:00:05 -metadata title="$file" \
      -map 0:v -scodec dvdsub   -map 0:s?    \
     -c:v h264_v4l2m2m  -b:v 5M  -pix_fmt yuv420p  -num_capture_buffers 512   -num_output_buffers 64 -bufsize 5M --minrate 5M  -maxrate 5M  -aspect 16:9 -map 0:v? \
      -c:a libopus -b:a 128k -map 0:a? -af volume=1.5   -movflags +faststart  -af volume=1.5 -avoid_negative_ts 1   -max_interleave_delta 0  -f mp4  "${file%.*}.mp4"; done

# only  subtitles you want with all audio and video

        ffmpeg  -y -probesize 2400M -analyzeduration 2410M -hwaccel drm -hwaccel_output_format drm_prime   -i /media/sun/Filme/Neu/the-dead-dont-die.mkv   -map 0:v? -scodec copy \
        -map 0:s:1 -map 0:s:2  -c:v copy   -c:a copy     -b:a 128k -map 0:a?  -y    /media/dat/test.mkv

# without color palette -scodec copy
     
         ffmpeg  +genpts+igndts+discardcorrupt -y -probesize 2400M -analyzeduration 2410M -hwaccel drm -hwaccel_output_format drm_prime -fix_sub_duration \
        -i example.vob  -ss 00:00:05  \
        -map 0:v -scodec copy  -map 0:s -c:v h264_v4l2m2m  -b:v 5M -maxrate 5M -minrate 5M -bufsize 5M -pix_fmt yuv420p -num_capture_buffers 512 -num_output_buffers 64  -aspect 16:9 \
        -c:a libopus     -b:a 128k -map 0:a?   -af volume=1.5   -movflags +faststart   -f mp4  example.mp4


# without subtitle


        ffmpeg  +genpts+igndts+discardcorrupt -y  -hwaccel drm -hwaccel_output_format drm_prime -probesize 400M -analyzeduration 410M -fix_sub_duration \
        -i output.vob  -ss 00:00:05  \
        -map 0:v?   -c:v h264_v4l2m2m  -b:v 5M -maxrate 5M -minrate 5M -bufsize 5M  -pix_fmt yuv420p -num_capture_buffers 512 -num_output_buffers 64  -aspect 16:9 \
        -c:a libopus     -b:a 128k -map 0:a? -af volume=1.5   -movflags +faststart   -f mp4  example.mp4

# separate video

            ffmpeg -y   -fflags +genpts+igndts -ifo_palette default.IFO \
           -probesize 1400M -analyzeduration 1410M -hwaccel drm -hwaccel_output_format drm_prime -i output.vob -map 0:v? \
           -c:v h264_v4l2m2m  -b:v 5M -maxrate 5M -minrate 5M -bufsize 5M  -pix_fmt yuv420p  -num_capture_buffers 512 \
           -num_output_buffers 64 -an -sn  -f mp4  only-lovers-audio+sub.mp4

# separate  audio + subtitle

        ffmpeg  -probesize 1400M -analyzeduration 1410M -fflags +genpts+igndts -ifo_palette default.IFO -fix_sub_duration -canvas_size  720x576  \
        -i output.vob   -c:a libfdk_aac -b:a 128k    -map 0:a? -scodec dvdsub    -map 0:s? -vn  -f mp4    test.mp4


# separate only audio 

            ffmpeg  -probesize 1400M -analyzeduration 1410M -fflags +igndts  -i output.vob   -c:a libfdk_aac -b:a 128k    -map 0:a?  -vn -sn  -f mp4    test.mp4

# muxing

         ffmpeg -fflags +genpts -i testv.mkv  -i test.mkv  -c:v copy -c:a copy -c:s copy  -map 0:v -map 1:a    -map 1:s  -f matroska output.mkv    


## realtime

```bash
wget -O build_kernel.zip  https://forums.raspberrypi.com/download/file.php?id=74529
```
              unzip  build_kernel.zip


              sudo ./build-kernel -b default --branch rpi-6.12.y -c 7 -j 6 -u -d  rpi 5


              sudo ./build-kernel -b default --branch rpi-6.18.y -c 6 -j 6 -u -d  rpi 4

              

              sudo nano /etc/environment

              PIPEWIRE_LATENCY=256/48000

              sudo nano /etc/security/limits.d/99-realtime.conf

              spook  -  rtprio     99
              spook  -  memlock    unlimited
              spook  -  nice      -20
              #*  -  rtprio     99
              #*  -  memlock    unlimited

#              
              
              sudo nano /boot/firmware/cmdline.txt
              
              isolcpus=3  ## 3te cpu only for ffmpeg

              
# example stable no realtime kernel

```bash
stdbuf -oL -eL chrt -f 50 taskset -c 0,1  rpicam-vid --verbose 0  \
--denoise cdn_off -t 0 --width 1280 --height 720 --framerate 25 \
--autofocus-mode manual --autofocus-range normal \
--autofocus-window 0.25,0.25,0.5,0.5 \
--libav-video-codec h264_v4l2m2m --libav-format h264 --codec libav --inline \
--awb indoor --profile baseline --intra 25 -b 1500000 -n -o - 2>/dev/null  | \
chrt -f 50 taskset -c 2,3  ffmpeg -y -loglevel warning  -hwaccel drm -hwaccel_device /dev/dri/renderD128  \
-fflags +genpts+igndts+nobuffer+flush_packets  \
-use_wallclock_as_timestamps 1  \
-thread_queue_size 128 -f h264 -r 25 -i - \
-thread_queue_size 256 -f pulse -fragment_size 512  -isync 0 -i default \
-c:v copy -metadata title='lucy'  \
-c:a libopus -application lowdelay -ac 1  -vbr off -b:a 64k -frame_duration 5  -compression_level 0  \
-map 0:v:0 -map 1:a:0 \
-f rtsp -rtsp_transport udp  -muxdelay 0 -flags +low_delay -avioflags direct -pkt_size 1316 rtsp://
``

# final udp libopus realtime kernel


```bash
stdbuf -oL -eL chrt -f 90 taskset -c 0,1 rpicam-vid --verbose 0 \
--denoise cdn_off -t 0 --width 1280 --height 720 --framerate 25 \
--autofocus-mode manual --autofocus-range normal \
--libav-video-codec h264_v4l2m2m --libav-format h264 --codec libav --inline \
--intra 25 -b 1500000 -n -o - 2>/dev/null | \
PULSE_LATENCY_MSEC=10 chrt -f 90 taskset -c 3 ffmpeg -y -loglevel warning \
-hwaccel drm -hwaccel_device /dev/dri/renderD128 \
-fflags +genpts+igndts+nobuffer+flush_packets -use_wallclock_as_timestamps 1 \
-thread_queue_size 32 -f h264 -r 25 -i - \
-thread_queue_size 32 -f pulse -fragment_size 480 -isync 0 -i default \
-c:v copy -c:a libopus -application lowdelay -ac 1 -vbr off -b:a 64k -frame_duration 5 \
-map 0:v:0 -map 1:a:0 \
-f rtsp -rtsp_transport udp -muxdelay 0 -flags +low_delay -avioflags direct -pkt_size 1316 \
rtsp://"user:pwd"@"localhost:8557"/mystream > /dev/null 2>&1
```

```bash
stdbuf -oL -eL chrt -f 90 taskset -c 0,1  rpicam-vid --denoise cdn_off -t 0 --width 1280 --height 720 --framerate 25 \
--autofocus-mode manual --autofocus-range normal --autofocus-window 0.25,0.25,0.5,0.5 \
--libav-video-codec h264_v4l2m2m --libav-format h264 --codec libav --inline \
--awb indoor --profile high --level 4.0 --intra 25 -b 1500000 -n -o - | \
PULSE_LATENCY_MSEC=10 chrt -f 90 taskset -c 3 ffmpeg -y -fflags +genpts+igndts+nobuffer+flush_packets \
-use_wallclock_as_timestamps 1 \
-thread_queue_size 32 -f h264 -r 25 -i - \
-thread_queue_size 128 -f pulse -fragment_size 480 -isync 0 -i default \
-c:v copy -metadata title='lucy' \
-c:a libfdk_aac  -b:a 64k -ac 1 -vbr 0  -afterburner 1   \
-map 0:v:0 -map 1:a:0 \
-f rtsp -rtsp_transport udp -rtpflags latm   -muxdelay 0 -flags +low_delay -avioflags direct -pkt_size 1316 \
rtsp://"user:pwd"@"@"localhost:8554"/mystream
```

udp libfdk

```bash
stdbuf -oL -eL chrt -f 90 taskset -c 0,1  rpicam-vid --denoise cdn_off -t 0 --width 1280 --height 720 --framerate 25 \
--autofocus-mode manual --autofocus-range normal --autofocus-window 0.25,0.25,0.5,0.5 \
--libav-video-codec h264_v4l2m2m --libav-format h264 --codec libav --inline \
--awb indoor --profile high --level 4.0 --intra 25 -b 1500000 -n -o - | \
PULSE_LATENCY_MSEC=10 chrt -f 90 taskset -c 3 ffmpeg -y -fflags +genpts+igndts+nobuffer+flush_packets -loglevel warning -hwaccel drm \
-hwaccel_device /dev/dri/renderD128 \
-use_wallclock_as_timestamps 1 \
-thread_queue_size 16 -f h264 -r 25 -i - \
-thread_queue_size 32 -f pulse -fragment_size 480 -isync 0 -i default \
-c:v copy -metadata title='lucy' \  
-c:a libfdk_aac  -b:a 64k -ac 1 -vbr 0  -afterburner 1 \
-map 0:v:0 -map 1:a:0 \
-f rtsp -rtsp_transport udp -rtpflags latm   -muxdelay 0 -flags +low_delay -avioflags direct -pkt_size 1316 \
rtsp://localhost:8554/mystream

tcp libopus

```bash
stdbuf -oL -eL chrt -f 90 taskset -c 0,1 rpicam-vid --flush --low-latency --verbose 0 \
--denoise cdn_off -t 0 --width 1280 --height 720 --framerate 25 \
--autofocus-mode manual --autofocus-range normal \
--autofocus-window 0.25,0.25,0.5,0.5 \
--libav-video-codec h264_v4l2m2m --libav-format h264 --codec libav --inline \
--awb indoor --profile high --level 4.1 --intra 25 -b 1500000 -n -o - 2>/dev/null | \
PULSE_LATENCY_MSEC=10 chrt -f 90 taskset -c 3 ffmpeg -y -loglevel warning -hwaccel drm \
-hwaccel_device /dev/dri/renderD128 \  
-fflags +genpts+igndts+nobuffer+flush_packets \
-use_wallclock_as_timestamps 1 \
-thread_queue_size 16 -f h264 -r 25 -i - \
-thread_queue_size 16 -f pulse -fragment_size 480 -isync 0 -i default \
-c:v copy -metadata title='lucy' \
-c:a libopus -application lowdelay -ac 1 -vbr off -b:a 64k -frame_duration 5 -compression_level 0 \
-map 0:v:0 -map 1:a:0 \
-f rtsp -rtsp_transport tcp -rtsp_flags filter_src -muxdelay 0 -flags +low_delay -avioflags direct -pkt_size 1316 \
rtsp://localhost:8554/mystream
```
rpi 3 and  rpi zero2W
```bash
nice -n -11 rpicam-vid -b 1000000 --denoise cdn_off --codec libav --libav-format mpegts --low-latency 1 --profile=high --hdr=off \
--level 4.1 --framerate 25 --width 1280 --height 720 --av-sync=0 --autofocus-mode manual --autofocus-range normal --autofocus-window 0.25,0.25,0.5,0.5 \
--audio-codec libopus --audio-channels 1 --libav-audio 1 --audio-source pulse --awb indoor \
-t 0 -n -o - | ffmpeg -hide_banner -fflags genpts+nobuffer -flags low_delay \
-hwaccel drm -hwaccel_output_format drm_prime -re -i - -metadata title='devil' -c copy -mpegts_copyts 1 -map 0:0 -map 0:1 \
-f rtsp -buffer_size 4k -muxdelay 0.1  -rtsp_transport udp rtsp://localhost:8554/mystream
```


                     
# cheers         
