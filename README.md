```bash
ffmpeg -init_hw_device vulkan=vk -i INPUT.mp4 \
-filter_hw_device vk -vf "hwupload,libplacebo=w=1280:h=720,hwdownload,format=yuv420p" \
-c:v h264_v4l2m2m -b:v 4M OUTPUT.mp4
```
```bash
ffmpeg -init_hw_device vulkan=vk:0 -v debug -f null -
```

```bash
ffmpeg -sources pulse
```

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
#########################################################

```bash
sudo nano /boot/firmware/cmdline.txt 
```
```bash
console=serial0,115200 console=tty1 root=PARTUUID=37b5fcd6-02 rootfstype=ext4 fsck.repair=yes rootwait  net.ifnames=0 isolcpus=3
```


isoliert 3 cpu for rpicam-vid isolcpus=3


```bash
sudo nano /etc/group
```
render:x:992:user
pipewire:x:105:user
pulse:x:106:user
rtkit:x:117:spook





######################################
# normal kernel 

```bash
sudo rm -r /etc/pipewire
rm -r .config/pipewire
rm -r .config/wireplumber
sudo mkdir /etc/pipewire
sudo mkdir /etc/pipewire/pipewire-pulse.conf.d
sudo mkdir /etc/pipewire/client.conf.d/
sudo mkdir /etc/pipewire/pipewire.conf.d/
sudo mkdir /etc/wireplumber
sudo mkdir /etc/wireplumber/wireplumber.conf.d/
```
```bash
sudo nano /etc/wireplumber/wireplumber.conf.d/50-alsa-s16le.conf
```

```bash
monitor.alsa.rules = [
  {
    matches = [
      {
        # Matcht alle Ausgänge
        node.name = "~alsa_output.*"
      },
      { 
        # Matcht alle Eingänge
        node.name = "~alsa_input.*"
      }
    ]
    actions = {
      update-props = {
        # Erzwingt S16LE für beide oben genannten Gruppen
        audio.format = "S16LE"
      }
    }
  }
]
```

```bash
sudo nano /etc/pipewire/pipewire.conf.d/10-low-latency.conf
```


```bash
context.properties = {
    default.clock.rate          = 48000
    default.clock.quantum       = 1024
    default.clock.min-quantum   = 1024
    default.clock.max-quantum   = 1024
    default.clock.allowed-rates = [ 44100 48000 88200 96000 ]
}

# Dies zwingt alle neuen Streams (inkl. rpicam-vid) auf S32LE
stream.properties = {
    audio.format = "S16LE"
    audio.rate   = 48000
}
```
# dont set it lower because audio comes to late 


```bash
sudo nano /etc/pipewire/client.conf.d/99-alsa-s16.conf
```

```bash
alsa.properties = {
    audio.format = "S16LE"
}
```
```bash
sudo nano /etc/pipewire/pipewire-pulse.conf.d/99-rpicam-s16.conf
```
```bash
pulse.rules = [
    {
        matches = [ { application.process.binary = "rpicam-vid" } ]
        actions = {
            update-props = {
                # Erzwungenes Format
                pulse.default.format = "S16LE"
                pulse.fix.format     = "S16LE"
                audio.format         = "S16LE"

                # Berechnung für 256 Samples:
                # 256 Samples * 2 Bytes (16-Bit) * 2 Kanäle (Stereo) = 1024 Bytes  meins fragsize   4096 bei quantum 1024
                pulse.attr.fragsize = "4096"

                # PipeWire Blockgröße
                node.force-quantum = 1024
            }
        }
    }
]
```

```bash
sudo nano /etc/enviroment
```

```bash
PIPEWIRE_LATENCY=1024/48000
```
```bash
nano .asoundrc
```


```bash
ctl.!default {
    type pipewire
}

pcm.!default {
    type plug
    slave {
        pcm "pwire"
        format S16_LE
        rate 48000
        period_size 256
        buffer_size 1024
    }
}

pcm.pwire {
    type pipewire
    mmap_emulation 1
}
```

# realtime change to this

```bash
sudo nano /etc/pipewire/pipewire.conf.d/10-realtime.conf
```

```bash
context.properties = {
    default.clock.rate          = 48000
    default.clock.quantum       = 256
    default.clock.min-quantum   = 256
    default.clock.max-quantum   = 256
}
```

```bash
sudo nano /etc/enviroment
```

```bash
PIPEWIRE_LATENCY=256/48000
```

```bash
pulse.rules = [
    {
        matches = [ { application.process.binary = "rpicam-vid" } ]
        actions = {
            update-props = {
                # Erzwungenes Format
                pulse.default.format = "S16LE"
                pulse.fix.format     = "S16LE"
                audio.format         = "S16LE"

                # Berechnung für 256 Samples:
                # 256 Samples * 2 Bytes (16-Bit) * 2 Kanäle (Stereo) = 1024 Bytes  meins fragsize   4096 bei quantum 1024
                pulse.attr.fragsize = "1024"

                # PipeWire Blockgröße
                node.force-quantum = 256
            }
        }
    }
]
```
#############################################


# also  very important

```bash
sudo nano /etc/security/limits.d/99-realtime.conf 
```

```bash
user  -  rtprio     99
user  -  memlock    unlimited
user  -  nice      -20
```

```bash
sudo nano /etc/group
```
```bash
sudo:x:27:spook
audio:x:29:spook
render:x:992:vnc,spook
_ssh:x:101:spook
spi:x:989:spook
i2c:x:987:spook
gpio:x:986:spook
pipewire:x:105:spook
pulse:x:106:spook
rtkit:x:117:spook
```

################################

```bash
systemctl --user enable --now pipewire pipewire.socket wireplumber pipewire-pulse
```
# for checking

```bash
nano .bashrc
```
```bash
on the end
```

```bash
alias alsamixer='alsamixer -c 0'
alias amixer='amixer -c 0'
# PipeWire Aliase
alias pw='pw-cli'
alias ptop='pw-top'
alias plink='pw-link -i'
alias pmon='pw-mon'
# Unterdrückt die kosmetischen Fehlermeldungen beim Start von pw-cli
alias pw-cli='pw-cli info 0'
```

```bash
pw-top
```

```bash
pw-cli
```
##################################################

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


    
```bash     
sudo apt update && sudo apt install -y \
build-essential pkg-config git \
libasound2-dev  libsdl2-dev \
libfdk-aac-dev libmp3lame-dev libopus-dev libx264-dev libdav1d-dev \
libdrm-dev libudev-dev libepoxy-dev libshaderc-dev \
libssl-dev libvulkan-dev libatomic1  vulkan-validationlayers  vulkan-tools  wayland-scanner++ wayland-utils  waylandpp-dev


sudo apt build-dep mpv ffmpeg
```




     git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git 

     git clone -b pios/bookworm https://github.com/RPi-Distro/ffmpeg.git

      git clone -b pios/trixie https://github.com/RPi-Distro/ffmpeg.git


     



# chromium line to start

```bash
chromium-browser --ozone-platform=wayland --enable-features=Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,SkiaGraphite --ignore-gpu-blocklist --enable-gpu-rasterization
```
# pi5 mit egl und vulkan disabled all libx264 all external stuff

```bash
git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git ~/rpi-ffmpeg
cd ~/rpi-ffmpeg || exit

PKG_CONFIG_PATH="/usr/lib/aarch64-linux-gnu/pkgconfig" \
./configure --prefix=/usr \
 --libdir=/usr/lib/aarch64-linux-gnu \
 --incdir=/usr/include/aarch64-linux-gnu \
 --extra-version="ultra-pi5-ULTIMATE-VULKAN" \
 --arch=aarch64 --target-os=linux --cpu=cortex-a76 \
 --extra-cflags='-I/usr/include/libdrm -I/usr/include/gbm -I/usr/include/vulkan -mcpu=cortex-a76+crypto -O3 -pipe -ftree-vectorize -flto -Wno-stringop-overflow' \
 --extra-ldflags='-L/usr/lib/aarch64-linux-gnu -lgbm -ldrm -latomic -Wl,-O3 -Wl,-rpath,/usr/lib/aarch64-linux-gnu -Wl,--as-needed -flto' \
  --extra-libs='-Wl,--start-group -lshaderc_combined -lglslang -lMachineIndependent -lGenericCodeGen -lSPIRV -lSPIRV-Tools-opt -lSPIRV-Tools -Wl,--end-group -lplacebo -lvulkan -lgbm -ldrm -lepoxy -lEGL -lGLESv2 -lfftw3 -lgnutls -lxml2 -lfdk-aac -lmp3lame -lFLAC -lopus -lass -lsoxr -lz -lsrt -ldvdnav -lstdc++ -lpthread -lm -lrt -ldl' \
 --disable-everything --disable-hwaccels --enable-libdvdnav --enable-libdvdread \
 --enable-ffmpeg --enable-ffprobe --disable-ffplay --enable-shared --disable-static --disable-debug --enable-stripping --enable-hardcoded-tables --enable-pic --enable-pthreads --enable-gpl --enable-version3 --enable-nonfree --enable-lto --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale --enable-avdevice \
 --enable-libxml2 --enable-v4l2-m2m --enable-v4l2-request --enable-sand --enable-libdrm --enable-epoxy --enable-libudev --enable-vout-egl --enable-vout-drm --enable-opengl --enable-vulkan --enable-libshaderc --enable-libplacebo \
 --enable-hwaccel=hevc_v4l2request --enable-hwaccel=av1_vulkan --enable-hwaccel=h264_vulkan --enable-hwaccel=hevc_vulkan \
 --enable-libass --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libsrt --enable-libsoxr --enable-libfreetype --enable-libharfbuzz --enable-libfribidi --enable-ladspa --enable-lv2 --enable-librubberband --enable-alsa --disable-libpulse --enable-libjack --enable-network --enable-gnutls --enable-gcrypt --enable-asm --enable-inline-asm --enable-neon --enable-runtime-cpudetect \
 --enable-protocol='pipe,file,fd,tcp,udp,rtp,rtsp,http,https,tls,rtmp,rtmpt,rtmpe,rtmps,ffrtmpcrypt,hls,dash,libsrt,unix,cache,crypto,concat' \
 --enable-bsf='aac_adtstoasc,av1_frame_merge,av1_frame_split,av1_metadata,dca_core,extract_extradata,h264_metadata,h264_mp4toannexb,hevc_metadata,hevc_mp4toannexb,mjpeg2jpeg,mpeg2_metadata,mpeg4_unpack_bframes,null,opus_metadata,pcm_rechunk,truehd_core,vp9_metadata,vp9_superframe' \
 --enable-filter='firequalizer,realtime,latency,colorspace,colormatrix,colorlevels,scale_v4l2m2m,deinterlace_v4l2m2m,vulkan,vulkan_filter,libplacebo,hwmap,hwupload,hwdownload,scale_vulkan,flip_vulkan,hflip_vulkan,vflip_vulkan,transpose_vulkan,chromaber_vulkan,color_vulkan,gblur_vulkan,nlmeans_vulkan,overlay_vulkan,xfade_vulkan,bwdif_vulkan,scale,fps,setdar,settb,setpts,asettb,asetpts,concat,aresample,aformat,volume,loudnorm,equalizer,bass,treble,crystalizer,ladspa,lv2,rubberband,afifo,anull,asplit,amix,anequalizer,surround,stereowiden,overlay,drawtext,pad,pan,yadif,crop,null,aevalsrc,smptebars,testsrc,testsrc2' \
 --enable-decoder='wavpack,h264_vulkan,hevc_vulkan,wrapped_avframe,libfdk_aac,h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,mpeg1_v4l2m2m,mpeg2_v4l2m2m,mpeg4_v4l2m2m,vc1_v4l2m2m,vp8_v4l2m2m,vp9_v4l2m2m,hevc_v4l2request,h264,hevc,mpeg1video,mpeg2video,mpeg4,mjpeg,h263,h263p,opus,aac,ac3,eac3,mp3,mpegaudio,flac,vorbis,ass,srt,pcm_bluray,pcm_dvd,pcm_f16le,pcm_f24le,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_lxf,pcm_mulaw,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s64be,pcm_s64le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,h263dsp,mpegvideodec,qpeldsp,mov_text,dvdsub,dvbsub,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt' \
 --enable-encoder='h264_vulkan,hevc_vulkan,wrapped_avframe,libfdk_aac,h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,mpeg4_v4l2m2m,vp8_v4l2m2m,libmp3lame,wavpack,libopus,flac,ass,srt,pcm_bluray,pcm_dvd,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s64be,pcm_s64le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,mov_text,rawvideo' \
 --enable-demuxer='wavpack,aac,ac3,ac4,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,aiff,asf,asf_o,av1,avi,caf,concat,dash,dts,dtshd,dv,dvbsub,dvdvideo,eac3,flac,flv,h264,hevc,hls,image2,image2pipe,image_bmp_pipe,image_jpeg_pipe,image_png_pipe,image_webp_pipe,matroska,mjpeg,mov,mp3,mpegps,mpegts,mpegvideo,null,ogg,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,rawvideo,rm,rtp,rtsp,sdp,srt,truehd,vobsub,wav,webm_dash_manifest,yuv4mpegpipe' \
 --enable-muxer='wavpack,aac,ac3,adts,adx,aiff,amr,apng,asf,ass,av1,avi,caf,dash,dts,dv,dvd,eac3,f4v,flac,flv,g722,gif,h264,hevc,hls,image2,ismv,matroska,matroska_audio,mjpeg,mkvtimestamp_v2,mov,mp2,mp3,mp4,mpeg1system,mpeg1vcd,mpeg1video,mpeg2dvd,mpeg2svcd,mpeg2video,mpeg2vob,mpegts,mpjpeg,null,ogg,oma,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,psp,rawvideo,rtmp,rtmpt,rtp,rtp_mpegts,rtsp,sap,segment,smoothstreaming,spdif,srt,swf,tee,truehd,tta,vc1,wav,webm,webm_chunk,webm_dash_manifest,webp,webvtt,yuv4mpegpipe' \
 --enable-parser='dvd_nav,webp,vp8,vp9,vc1,aac_latm,aac,ac3,eac3,dca,mpegaudio,mp3,vorbis,opus,flac,h264,hevc,mpegvideo,mpeg4video,mjpeg,h263,mpeg1video,av1' \
 --enable-indev='v4l2,alsa,jack,kmsgrab,lavfi' \
 --enable-outdev='v4l2,alsa,opengl,vout_drm,vout_egl' \
 --enable-xlib --disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --disable-sdl2 --disable-sndio \
 --disable-amf --disable-vdpau --disable-vaapi --disable-cuda-llvm --disable-cuvid --disable-nvenc --disable-nvdec --disable-libnpp --disable-cuda \
 --disable-cuda-nvcc  --disable-cuda-sdk --disable-ffnvcodec  --disable-libx264 --disable-libx265 --disable-omx --disable-omx-rpi --disable-mmal \
 --disable-indev=pulse --disable-outdev=pulse && make -j2 && sudo make install

# Strippen für minimale Dateigröße
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavcode*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavdevic*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavfilte*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavforma*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavutil*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libpostpro*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libswresampl*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libswscale*

echo "Fertig! Installierte Größe:"
ls -l /usr/lib/aarch64-linux-gnu/libav* /usr/lib/aarch64-linux-gnu/libsw* /usr/lib/aarch64-linux-gnu/libpostproc* | awk '{sum += $5} END {print sum / 1024 / 1024 " MB"}'

```


# pi4 mit egl und vulkan no external

```bash
git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git ~/rpi-ffmpeg
cd ~/rpi-ffmpeg 
PKG_CONFIG_PATH="/usr/lib/aarch64-linux-gnu/pkgconfig" \
./configure --prefix=/usr \
 --libdir=/usr/lib/aarch64-linux-gnu \
 --incdir=/usr/include/aarch64-linux-gnu \
 --extra-version="ultra-pi4-ULTIMATE-VULKAN" \
 --arch=aarch64 --target-os=linux --cpu=cortex-a72 \
 --extra-cflags='-I/usr/include/libdrm -I/usr/include/gbm -I/usr/include/vulkan -mcpu=cortex-a72+crypto -O3 -pipe -ftree-vectorize -flto -Wno-stringop-overflow' \
 --extra-ldflags='-L/usr/lib/aarch64-linux-gnu -lgbm -ldrm -latomic -Wl,-O3 -Wl,-rpath,/usr/lib/aarch64-linux-gnu -Wl,--as-needed -flto' \
 --extra-libs='-Wl,--start-group -lshaderc_combined -lglslang -lMachineIndependent -lGenericCodeGen -lSPIRV -lSPIRV-Tools-opt -lSPIRV-Tools -Wl,--end-group -lplacebo -lvulkan -lgbm -ldrm -lepoxy -lEGL -lGLESv2 -lfftw3 -lgnutls -lxml2 -lfdk-aac -lmp3lame -lFLAC -lopus -lass -lsoxr -lz -lsrt -ldvdnav -lstdc++ -lpthread -lm -lrt -ldl' \
 --disable-everything --disable-hwaccels --enable-libdvdnav --enable-libdvdread \
 --enable-ffmpeg --enable-ffprobe --disable-ffplay --enable-shared --disable-static --disable-debug --enable-stripping --enable-hardcoded-tables --enable-pic --enable-pthreads --enable-gpl --enable-version3 --enable-nonfree --enable-lto --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale --enable-avdevice \
 --enable-libxml2 --enable-v4l2-m2m --enable-v4l2-request --enable-sand --enable-libdrm --enable-epoxy --enable-libudev --enable-vout-egl --enable-vout-drm --enable-opengl --enable-vulkan --enable-libshaderc --enable-libplacebo \
 --enable-hwaccel=hevc_v4l2request --enable-hwaccel=av1_vulkan --enable-hwaccel=h264_vulkan --enable-hwaccel=hevc_vulkan \
 --enable-libass --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libsrt --enable-libsoxr --enable-libfreetype --enable-libharfbuzz --enable-libfribidi --enable-ladspa --enable-lv2 --enable-librubberband --enable-alsa --disable-libpulse --enable-libjack --enable-network --enable-gnutls --enable-gcrypt --enable-asm --enable-inline-asm --enable-neon --enable-runtime-cpudetect \
 --enable-protocol='pipe,file,fd,tcp,udp,rtp,rtsp,http,https,tls,rtmp,rtmpt,rtmpe,rtmps,ffrtmpcrypt,hls,dash,libsrt,unix,cache,crypto,concat' \
 --enable-bsf='aac_adtstoasc,av1_frame_merge,av1_frame_split,av1_metadata,dca_core,extract_extradata,h264_metadata,h264_mp4toannexb,hevc_metadata,hevc_mp4toannexb,mjpeg2jpeg,mpeg2_metadata,mpeg4_unpack_bframes,null,opus_metadata,pcm_rechunk,truehd_core,vp9_metadata,vp9_superframe' \
 --enable-filter='firequalizer,realtime,latency,colorspace,colormatrix,colorlevels,scale_v4l2m2m,deinterlace_v4l2m2m,vulkan,vulkan_filter,libplacebo,hwmap,hwupload,hwdownload,scale_vulkan,flip_vulkan,hflip_vulkan,vflip_vulkan,transpose_vulkan,chromaber_vulkan,color_vulkan,gblur_vulkan,nlmeans_vulkan,overlay_vulkan,xfade_vulkan,bwdif_vulkan,scale,fps,setdar,settb,setpts,asettb,asetpts,concat,aresample,aformat,volume,loudnorm,equalizer,bass,treble,crystalizer,ladspa,lv2,rubberband,afifo,anull,asplit,amix,anequalizer,surround,stereowiden,overlay,drawtext,pad,pan,yadif,crop,null,aevalsrc,smptebars,testsrc,testsrc2' \
 --enable-decoder='wavpack,h264_vulkan,hevc_vulkan,wrapped_avframe,libfdk_aac,h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,mpeg1_v4l2m2m,mpeg2_v4l2m2m,mpeg4_v4l2m2m,vc1_v4l2m2m,vp8_v4l2m2m,vp9_v4l2m2m,hevc_v4l2request,h264,hevc,mpeg1video,mpeg2video,mpeg4,mjpeg,h263,h263p,opus,aac,ac3,eac3,mp3,mpegaudio,flac,vorbis,ass,srt,pcm_bluray,pcm_dvd,pcm_f16le,pcm_f24le,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_lxf,pcm_mulaw,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s64be,pcm_s64le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,h263dsp,mpegvideodec,qpeldsp,mov_text,dvdsub,dvbsub,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt' \
 --enable-encoder='h264_vulkan,hevc_vulkan,wrapped_avframe,libfdk_aac,h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,mpeg4_v4l2m2m,vp8_v4l2m2m,libmp3lame,wavpack,libopus,flac,ass,srt,pcm_bluray,pcm_dvd,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s64be,pcm_s64le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,mov_text,rawvideo' \
 --enable-demuxer='wavpack,aac,ac3,ac4,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,aiff,asf,asf_o,av1,avi,caf,concat,dash,dts,dtshd,dv,dvbsub,dvdvideo,eac3,flac,flv,h264,hevc,hls,image2,image2pipe,image_bmp_pipe,image_jpeg_pipe,image_png_pipe,image_webp_pipe,matroska,mjpeg,mov,mp3,mpegps,mpegts,mpegvideo,null,ogg,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,rawvideo,rm,rtp,rtsp,sdp,srt,truehd,vobsub,wav,webm_dash_manifest,yuv4mpegpipe' \
 --enable-muxer='wavpack,aac,ac3,adts,adx,aiff,amr,apng,asf,ass,av1,avi,caf,dash,dts,dv,dvd,eac3,f4v,flac,flv,g722,gif,h264,hevc,hls,image2,ismv,matroska,matroska_audio,mjpeg,mkvtimestamp_v2,mov,mp2,mp3,mp4,mpeg1system,mpeg1vcd,mpeg1video,mpeg2dvd,mpeg2svcd,mpeg2video,mpeg2vob,mpegts,mpjpeg,null,ogg,oma,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,psp,rawvideo,rtmp,rtmpt,rtp,rtp_mpegts,rtsp,sap,segment,smoothstreaming,spdif,srt,swf,tee,truehd,tta,vc1,wav,webm,webm_chunk,webm_dash_manifest,webp,webvtt,yuv4mpegpipe' \
 --enable-parser='dvd_nav,webp,vp8,vp9,vc1,aac_latm,aac,ac3,eac3,dca,mpegaudio,mp3,vorbis,opus,flac,h264,hevc,mpegvideo,mpeg4video,mjpeg,h263,mpeg1video,av1' \
 --enable-indev='v4l2,alsa,jack,kmsgrab,lavfi' \
 --enable-outdev='v4l2,alsa,opengl,vout_drm,vout_egl' \
 --enable-xlib --disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --disable-sdl2 --disable-sndio \
 --disable-amf --disable-vdpau --disable-vaapi --disable-cuda-llvm --disable-cuvid --disable-nvenc --disable-nvdec --disable-libnpp --disable-cuda \
 --disable-cuda-nvcc  --disable-cuda-sdk --disable-ffnvcodec  --disable-libx264 --disable-libx265 --disable-omx --disable-omx-rpi --disable-mmal \
 --disable-indev=pulse --disable-outdev=pulse && make -j2 && sudo make install



# Strippen für minimale Dateigröße
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavcode*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavdevic*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavfilte*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavforma*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavutil*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libpostpro*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libswresampl*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libswscale*

echo "Fertig! Installierte Größe:"
ls -l /usr/lib/aarch64-linux-gnu/libav* /usr/lib/aarch64-linux-gnu/libsw* /usr/lib/aarch64-linux-gnu/libpostproc* | awk '{sum += $5} END {print sum / 1024 / 1024 " MB"}'
EOF

chmod +x bin/build-ffmpeg-final-rpi-4.sh
```



# pi3 mit egl no vulkan disable external

```bash


# minimal 6MB build size

cat << 'EOF' > bin/build-ffmpeg-final-rpi-3.sh
#!/bin/bash
# FFmpeg Build-Skript für RPi5 (Ultra-Minimal / Vulkan & V4L2)

# Alte Quellen entfernen
sudo rm -rf ~/rpi-ffmpeg

# Repository klonen
git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git ~/rpi-ffmpeg
cd ~/rpi-ffmpeg || exit

TMPDIR=/home/spook/tmp PKG_CONFIG_PATH="/usr/lib/arm-linux-gnueabihf/pkgconfig" \
./configure \
  --prefix=/usr \
  --libdir=/usr/lib/arm-linux-gnueabihf \
  --incdir=/usr/include/arm-linux-gnueabihf \
  --extra-version=ultra-pi3-armhf-jc-final-minimal \
  --arch=arm --target-os=linux --cpu=cortex-a53 \
  --fatal-warnings \
  --extra-cflags='-I/usr/include/libdrm -I/usr/include/gbm -mcpu=cortex-a53+crypto -O2 -pipe -ftree-vectorize -flto -Wno-stringop-overflow' \
  --extra-ldflags='-L/usr/lib/arm-linux-gnueabihf -lgbm -ldrm -latomic -Wl,-O2 -Wl,-rpath,/usr/lib/arm-linux-gnueabihf -Wl,--as-needed -flto -lstdc++' \
  --extra-libs='-L/usr/lib/arm-linux-gnueabihf -lpthread -Wl,-O2 -lm -lrt -ldl -lasound -lstdc++ -ljack -ldrm -lgbm -lgnutls -lgcrypt -lgpg-error -lxml2 -lfdk-aac -lFLAC -lopus -lass -lsoxr -lfreetype -lharfbuzz -lfribidi -lrubberband' \
  --disable-everything \
  --disable-hwaccels \
  --enable-ffmpeg --enable-ffprobe --disable-ffplay \
  --enable-shared --disable-static \
  --disable-debug --enable-stripping \
  --enable-hardcoded-tables --enable-pic --enable-pthreads \
  --enable-gpl --enable-version3 --enable-nonfree --enable-lto \
  --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale --enable-avdevice \
  --enable-libxml2 --enable-v4l2-m2m --enable-v4l2-request --enable-sand --enable-libdrm --enable-epoxy --enable-libudev \
  --enable-opengl --disable-vulkan --disable-libshaderc --disable-libplacebo \
  --enable-hwaccel=hevc_v4l2request \
  --enable-libass --enable-libfdk-aac --enable-libopus --enable-libsoxr --enable-libfreetype --enable-libharfbuzz --enable-libfribidi \
  --enable-ladspa --enable-lv2 --enable-librubberband --enable-alsa --disable-libpulse --enable-libjack \
  --enable-network --enable-gnutls --enable-gcrypt --enable-asm --enable-inline-asm --enable-neon --enable-runtime-cpudetect \
  --enable-protocol='pipe,file,fd,tcp,udp,rtp,rtsp,tls,rtmp,rtmpt,rtmpe,rtmps,ffrtmpcrypt,hls,dash,srt,unix,cache,crypto,concat' \
  --enable-bsf='mpeg2_metadata,hevc_metadata,h264_metadata,h264_mp4toannexb,hevc_mp4toannexb,mpeg4_unpack_bframes,aac_adtstoasc,opus_metadata,extract_extradata,null' \
  --enable-filter='firequalizer,realtime,latency,deinterlace_v4l2m2m,scale_v4l2m2m,format,scale,fps,setdar,settb,setpts,asettb,asetpts,concat,aresample,aformat,volume,loudnorm,equalizer,bass,treble,crystalizer,ladspa,lv2,rubberband,afade' \
  --enable-decoder='libfdk_aac,h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,mpeg1_v4l2m2m,mpeg2_v4l2m2m,mpeg4_v4l2m2m,hevc_v4l2request,opus,aac,ac3,eac3,mpegaudio,flac,vorbis,ass,srt,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo,adpcm_ms,adpcm_ima_wav' \
  --enable-encoder='h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,libfdk_aac,aac,libopus,flac,ass,srt,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo' \
  --enable-demuxer='id3v1,id3v2,matroska,matroska_audio,mpegts,mov,flac,wav,ogg,aac,avi,h264,hevc,rtsp,sdp,rtp,rtmp,hls,dash,mjpeg,image2,concat,rawvideo' \
  --enable-muxer='yuv4mpegpipe,adts,matroska,matroska_audio,mp4,mov,avi,flac,wav,opus,ogg,rtp,rtmp,rtsp,hls,dash,mpegts,image2,rawvideo,null,webm_dash_manifest' \
  --enable-parser='dca,ac3,eac3,h264,hevc,mjpeg,mpegvideo,mpeg4video,mpegaudio,aac,opus,flac,vorbis,h263' \
   --enable-indev='v4l2,alsa,jack,kmsgrab,lavfi' \
   --enable-outdev='v4l2,alsa,opengl,vout_drm,vout_egl' \
  --enable-xlib \
  --disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages \
  --disable-sdl2 --disable-sndio --disable-indev=pulse --disable-outdev=pulse,xv \
  --disable-amf --disable-vdpau --disable-vaapi --disable-cuda-llvm --disable-ffnvcodec --disable-cuvid --disable-nvenc --disable-nvdec --disable-libnpp --disable-cuda --disable-cuda-nvcc --disable-omx --disable-omx-rpi --disable-mmal

make -j2
sudo make install

# Strippen für minimale Dateigröße
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavcode*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavdevic*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavfilte*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavforma*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavutil*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libpostpro*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libswresampl*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libswscale*

echo "Fertig! Installierte Größe:"
ls -l /usr/lib/arm-linux-gnueabihf/libav* /usr/lib/arm-linux-gnueabihf/libsw* /usr/lib/arm-linux-gnueabihf/libpostproc* | awk '{sum += $5} END {print sum / 1024 / 1024 " MB"}'
EOF

chmod +x bin/build-ffmpeg-final-rpi-3.sh
```


# rpi 5 


```bash
git clone --depth 1 https://github.com/mpv-player/mpv.git
cd mpv 
meson setup build \
  --prefix=/usr \
  --buildtype=release \
  -Dc_args='-mcpu=cortex-a76+crypto -O3 -pipe -ftree-vectorize -flto -Wno-stringop-overflow' \
  -Dcpp_args='-mcpu=cortex-a76+crypto -O3 -pipe -ftree-vectorize -flto -Wno-stringop-overflow' \
  -Dc_link_args='-L/usr/lib/aarch64-linux-gnu -latomic -Wl,-O3,--as-needed -flto' \
  -Dcpp_link_args='-L/usr/lib/aarch64-linux-gnu -latomic -Wl,-O3,--as-needed -flto -lstdc++' \
   -Dwayland=enabled \
  -Ddmabuf-wayland=enabled \
  -Dvulkan=enabled \
  -Dshaderc=disabled \
  -Ddrm=enabled \
  -Dgbm=enabled \
  -Degl-wayland=enabled \
  -Degl-drm=enabled \
  -Dgl=enabled \
  -Dalsa=enabled \
  -Dpipewire=enabled \
  -Dpulse=disabled \
  -Dx11=disabled \
  -Dvaapi=disabled \
  -Dvdpau=disabled \
  -Dvdpau-gl-x11=disabled \
  -Damf=disabled \
  -Dandroid-media-ndk=disabled \
  -Dmacos-11-features=disabled \
  -Dmacos-touchbar=disabled \
  -Dswift-build=disabled \
  -Dwin32-smtc=disabled \
  -Dd3d11=disabled \
  -Ddirect3d=disabled \
  -Dsdl2-video=disabled \
  -Dsdl2-audio=disabled \
  -Dopenal=disabled \
  -Dmanpage-build=disabled \
  -Dhtml-build=disabled -Dlibmpv=true 

sudo meson install -C build
```

# rpi 4

```bash
git clone --depth 1 https://github.com/mpv-player/mpv.git
cd mpv 
meson setup build \
  --prefix=/usr \
  --buildtype=release \
  -Dc_args='-mcpu=cortex-a72+crypto -O3 -pipe -ftree-vectorize -flto -Wno-stringop-overflow' \
  -Dcpp_args='-mcpu=cortex-a72+crypto -O3 -pipe -ftree-vectorize -flto -Wno-stringop-overflow' \
  -Dc_link_args='-L/usr/lib/aarch64-linux-gnu -latomic -Wl,-O3,--as-needed -flto' \
  -Dcpp_link_args='-L/usr/lib/aarch64-linux-gnu -latomic -Wl,-O3,--as-needed -flto -lstdc++' \
   -Dwayland=enabled \
  -Ddmabuf-wayland=enabled \
  -Dvulkan=enabled \
  -Dshaderc=disabled \
  -Ddrm=enabled \
  -Dgbm=enabled \
  -Degl-wayland=enabled \
  -Degl-drm=enabled \
  -Dgl=enabled \
  -Dalsa=enabled \
  -Dpipewire=enabled \
  -Dpulse=disabled \
  -Dx11=disabled \
  -Dvaapi=disabled \
  -Dvdpau=disabled \
  -Dvdpau-gl-x11=disabled \
  -Damf=disabled \
  -Dandroid-media-ndk=disabled \
  -Dmacos-11-features=disabled \
  -Dmacos-touchbar=disabled \
  -Dswift-build=disabled \
  -Dwin32-smtc=disabled \
  -Dd3d11=disabled \
  -Ddirect3d=disabled \
  -Dsdl2-video=disabled \
  -Dsdl2-audio=disabled \
  -Dopenal=disabled \
  -Dmanpage-build=disabled \
  -Dhtml-build=disabled -Dlibmpv=true
```


# rpi 3

```bash
git clone --depth 1 https://github.com/mpv-player/mpv.git
cd mpv 
meson setup build \
  --prefix=/usr \
  --buildtype=release \
  -Dc_args='-mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -O2 -pipe -ftree-vectorize -fomit-frame-pointer -flto -Wno-stringop-overflow' \
  -Dcpp_args='-mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -O2 -pipe -ftree-vectorize -fomit-frame-pointer -flto -Wno-stringop-overflow' \
  -Dc_link_args='-L/usr/lib/arm-linux-gnueabihf -latomic -Wl,-O2,--as-needed -flto' \
  -Dcpp_link_args='-L/usr/lib/arm-linux-gnueabihf -latomic -Wl,-O2,--as-needed -flto -lstdc++' \
  -Dlibmpv=true \
  -Dwayland=enabled \
  -Ddmabuf-wayland=enabled \
  -Dpipewire=enabled \
  -Dalsa=enabled \
  -Dvulkan=enabled \
  -Dshaderc=disabled \
  -Ddrm=enabled \
  -Dgbm=enabled \
  -Degl-drm=enabled \
  -Degl-wayland=enabled \
  -Dgles2=enabled \
  -Drpi-mmal=disabled \
  -Dvaapi=disabled \
  -Dvdpau=disabled \
  -Dcuda-hwaccel=disabled \
  -Dmanpages=disabled
```
      
#########################

## example for drm-prime wayland all rpi

```bash
nano .config/mpv/mpv.conf
```

```bash

#  opengl

gpu-context=wayland
gpu-api=opengl
opengl-glfinish=yes
vo=gpu

# vulkan  

#gpu-context=waylandvk
#gpu-api=vulkan
#vo=gpu-next
#wayland-configure-bounds=yes

hwdec=drm
hwdec-codecs=hevc
hwdec-image-format=drm_prime
gpu-hwdec-interop=drmprime
hwdec-extra-frames=2
glsl-shader="~~/shaders/FSR.glsl"
# Hochwertiges Upscaling für den Pi 5 (Cortex-A76)
#scale=ewa_lanczos
#cscale=mitchell  
framedrop=decoder+vo
keep-open=no
cache=no
volume=80
ao=pipewire
af=lavfi=[crystalizer=i=1,bass=g=3],scaletempo2
volume-max=150
audio-channels=stereo
#autofit=1910
no-border
no-border
autofit=50%x50%
background=none   #very important for vulkan fullscreen
#geometry=1920x1080+0+0
vulkan-swap-mode=fifo
swapchain-depth=3
#vulkan-async-compute=no
#vulkan-async-transfer=no
gpu-shader-cache=yes
wayland-app-id=mpv-fullscreen
alang=de,deu,ger,en,eng
slang=de,deu,ger,en,eng
sid=1
aid=1

 ```
    
# without x build ffmpeg ! pure wayland vulkan drm 
# hwaacel drm wayland

```bash
gpu-dumb-mode=no
opengl-glfinish=yes
gpu-context=waylandvk  
gpu-api=vulkan
vo=gpu-next
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

```bash
pactl list sources 
```
```bash
arecord -L
```

# for checking

```bash
pw-top
```

```bash
pw-cli
```
         

#    realtime stream all under 0.5 second to the reciever


       sudo nano /boot/firmware/config.txt

       vc4.tv_norm=PAL   #which is 25 fps


       may you want to set to NTSC PAL60 for framerate=30



       
```bash
nano .config/mpv/mpv.conf   on the end of file put this in
```

```bash
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
```

########################### 

# rtmp camera  spezial for rpi 4 !  no audio drifft ! works on all rpi ! cpu 30 % zero2w


     PIPEWIRE_LATENCY="1024/48000" change PULSE_LATENCY_MSEC=21

# imx708 all rpi 

    PIPEWIRE_LATENCY="1024/48000" 

```bash
PIPEWIRE_LATENCY="1024/48000"  stdbuf -o0 -e0 nice -n 11   taskset -c 3  rpicam-vid --flush   -b 1500000    --denoise cdn_off   --codec libav --libav-format mpegts \
--profile=main  --hdr=off --level 4.0 --framerate 25  --width 1536 --height 864   --av-sync=0 \
--autofocus-mode manual --autofocus-range normal --autofocus-window  0.25,0.25,0.5,0.5 \
--audio-codec libopus --audio-samplerate 48000 --shutter 20000 --tuning-file /usr/share/libcamera/ipa/rpi/vc4/imx708.json  \
--audio-channels 2 --libav-audio 1 --audio-source alsa --audio-device pipewire  --awb indoor -t 0 --intra 25  \
--inline  -n  -o  - | nice -n 10    taskset -c 2  ffmpeg   -loglevel warning  -hide_banner \
-fflags nobuffer+genpts+flush_packets  -isync 0  -copyts   \
-hwaccel drm -hwaccel_output_format drm_prime -fpsprobesize 0   -f mpegts  -i -  -metadata title='lucy' -c copy  \
-flags low_delay -avioflags direct -map 0:0 -map 0:1 -muxdelay 0.01  -f rtsp -buffer_size 512 \
-rtsp_flags filter_src   -tcp_nodelay 1  -rtsp_transport tcp -pkt_size 1316  rtsp://
```


### rec 

```bash
nano .config/mpv/mpv.conf
```
```bash

[convert]

#vf-add = scale=480:-2
ovc = libx264
ovcopts-add = preset=medium
ovcopts-add = tune=fastdecode
ovcopts-add = b=1M
ovcopts-add = maxrate=1M,minrate=1M,bufsize=1M
ovcopts-add = rc_init_occupancy=900k
ovcopts-add = refs=2
ovcopts-add = profile=main
profile=enc-a-aac
of=matroska
framedrop=decoder
#demuxer-lavf-o-add=fflags=+nobuffer+genpts
container-fps-override=25
no-correct-pts
untimed
```


```bash
mpv rtsp://"user:pwd"@"ip:8554"/mystream  --profile=convert --o=`date +%Y-%m-%d-%H-%M`.mkv
```

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

```bash
sudo nano /etc/group
```
```bash
sudo:x:27:spook
audio:x:29:spook
render:x:992:vnc,spook
_ssh:x:101:spook
spi:x:989:spook
i2c:x:987:spook
gpio:x:986:spook
pipewire:x:105:spook
pulse:x:106:spook
rtkit:x:117:spook
```




```bash              
sudo nano /boot/firmware/cmdline.txt
```

```bash              
isolcpus=3  ## 3te cpu only for ffmpeg
```            

              


                     
# cheers         
