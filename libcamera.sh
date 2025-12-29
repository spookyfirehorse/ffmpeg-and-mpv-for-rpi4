sudo apt build-dep libcamera rpicam-apps 

git clone https://github.com/raspberrypi/libcamera.git && \
cd libcamera && \
meson setup build --buildtype=release  -Dprefix=/usr  -Dpipelines=rpi/vc4,rpi/pisp -Dipas=rpi/vc4,rpi/pisp -Dv4l2=enabled -Dgstreamer=enabled -Dtest=false -Dlc-compliance=disabled -Dcam=disabled -Dqcam=disabled -Ddocumentation=disabled -Dpycamera=enabled &&\
sudo  ninja -C build install && \
git clone https://github.com/raspberrypi/rpicam-apps.git && cd rpicam-apps && \
meson setup build -Denable_libav=enabled  -Denable_drm=enabled -Denable_egl=enabled -Denable_qt=enabled -Denable_opencv=disabled -Denable_tflite=disabled -Denable_hailo=disabled -Dprefix=/usr && \
meson compile -C build && sudo meson install -C build



git clone https://github.com/PipeWire/pipewire.git
meson setup build
meson configure build -Dprefix=/usr
meson compile -C build
sudo meson install -C build                      


systemctl --user stop pipewire.service \
                      pipewire.socket \
                      wireplumber.service \
                      pipewire-pulse.service \
                      pipewire-pulse.socket



original

git clone https://github.com/raspberrypi/libcamera.git
cd libcamera
meson setup build --buildtype=release -Dprefix=/usr -Dpipelines=rpi/vc4,rpi/pisp -Dipas=rpi/vc4,rpi/pisp -Dv4l2=enabled -Dgstreamer=enabled -Dtest=false -Dlc-compliance=disabled -Dcam=disabled -Dqcam=disabled -Ddocumentation=disabled -Dpycamera=enabled
ninja -C build install

#######################
###  rpi 4 10 h test sync

 nice -n -11  rpicam-vid  --low-latency 1  -b 1000000 --autofocus-mode manual --autofocus-range normal --autofocus-window  0.25,0.25,0.5,0.5 \
 --denoise cdn_off   --codec libav --libav-format flv  --brightness 0.1 --contrast 1.0 --sharpness   1.0    --profile=high --hdr=off --libav-video-codec h264_v4l2m2m \
 --level 4.2 --framerate 24  --width 1536 --height 864   --audio-device=alsa_input.usb-Creative_Technology_Ltd_Sound_Blaster_Play__3_00229929-00.analog-stereo --av-sync=0  \
 --audio-codec libfdk_aac  --audio-channels 2 --libav-audio 1 --audio-source pulse --audio-samplerate=48000  --audio-bitrate=96kbps  \
 -t 0  -n --inline -o  - | ffmpeg   -hide_banner -fflags nobuffer+genpts  -flags low_delay -hwaccel drm -hwaccel_output_format drm_prime -i -  -metadata title='Lucy'  -vcodec h264_v4l2m2m \
 -b:v 1M -num_output_buffers 32 -num_capture_buffers 16  -acodec libfdk_aac libfdk_aac -eld_sbr 1  -vbr 0  -b:a 64k -threads $(nproc) -fps_mode:v cfr  -copytb 1   \
 -f rtsp -rtsp_transport udp


## rpi 3 10 h test sync

nice -n -11  rpicam-vid  --low-latency 1  -b 1000000    --denoise cdn_off   --codec libav --libav-format flv  --brightness 0.1 --contrast 1.0 --sharpness   1.0  \
--profile=high --hdr=off --libav-video-codec h264_v4l2m2m  --level 4.2 --framerate 24  --width 1536 --height 864 \
--audio-device==alsa_input.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.mono-fallback  --av-sync=0 \
--audio-codec libfdk_aac  --audio-channels 1 --libav-audio 1 --audio-source pulse --audio-samplerate=48000  --audio-bitrate=128kbps --libav-video-codec-opts bf=0 --intra 0    \
  -t 0  -n --inline -o  - | ffmpeg -r -r 23.97602398  -hide_banner -fflags nobuffer+genpts  -flags low_delay  \
  -hwaccel drm -hwaccel_output_format drm_prime -i -  -metadata title='kali'  -vcodec copy -copytb 1  -acodec libfdk_aac -eld_sbr 1  -vbr 0  -b:a 64k   \
   -f rtsp -rtsp_transport udp  


######################################################
test mpv

nice -n 19  rpicam-vid --low-latency 1  -b 1000000 --autofocus-mode manual --autofocus-range normal --autofocus-window  0.25,0.25,0.5,0.5   --denoise cdn_off \
 --codec=libav --libav-format=flv --libav-video-codec h264_v4l2m2m  --brightness 0.1 --contrast 1.0 \
 --profile=high --hdr=off    --sharpness   1.0  --level 4.2 --framerate 24  --width 1280 --height 720 \
 --audio-device=alsa_input.usb-Creative_Technology_Ltd_Sound_Blaster_Play__3_00229929-00.analog-stereo   --audio-bitrate=96kbps --audio-samplerate=48000   \
 --audio-codec libfdk_aac  --audio-channels 1 --libav-audio 1 --audio-source pulse  \
  -t 0  -n --inline  -o  - | mpv -  --profile=stream 



[stream]

hwdec=drm
hwdec-codecs=hevc
hwdec-image-format=drm_prime
gpu-hwdec-interop=drmprime
hwdec-extra-frames=2
ovc=h264_v4l2m2m
ovcopts=preset=profile:v=high,level=4.2
ovcopts=bf=0,b=1M,fps_mode:v=cfr
oac=libfdk_aac
oacopts=b=64k,has_b_frames=0,copytb=1,eld_v2=1
cache=no
framedrop=decoder+vo
demuxer-lavf-o-add=fflags=+nobuffer+genpts+discardcorrupt,flags=low_delay
#+igndts
#,use_wallclock_as_timestamp=1
of=rtsp
volume=100
rtsp-transport=udp
oset-metadata=title="Lucy",comment="stream"
audio-format=s16
audio-samplerate=48000
#vo-null-fps=24
hr-seek-framedrop=no
video-sync=audio
#pulse-latency-hacks=yes
#video-latency-hacks=yes
audio-demuxer=lavf
demuxer=lavf
#speed=1.001
#demuxer=mkv
stream-buffer-size=4k
pipewire-buffer=10


nice -n -11  rpicam-vid  --low-latency 1  -b 1000000 --autofocus-mode manual --autofocus-range normal --autofocus-window  0.25,0.25,0.5,0.5   --denoise cdn_off --libav-video-codec-opts bf=0 --intra 0  \
  --codec libav --libav-format flv  --brightness 0.1 --contrast 1.0 --sharpness   1.0    --profile=high --hdr=off --libav-video-codec h264_v4l2m2m   --level 4.2 --framerate 24  --width 1536 --height 864 \
  --audio-device=alsa_input.usb-Creative_Technology_Ltd_Sound_Blaster_Play__3_00229929-00.analog-stereo --av-sync=0  \
  --audio-codec libfdk_aac  --audio-channels 2 --libav-audio 1 --audio-source pulse --audio-samplerate=48000  --audio-bitrate=128kbps  \
  -t 0  -n --inline -o  - | ffmpeg   -hide_banner -fflags nobuffer+genpts  -flags low_delay \
  -hwaccel drm -hwaccel_output_format drm_prime -i -  -metadata title='Lucy'  -c:v  h264_v4l2m2m  -b:v 1500k  -filter:v  fps=fps=source_fps:round=near   -threads $(nproc) \
  -c:a  libfdk_aac -eld_sbr 1  -vbr 0  -b:a 64k  -threads $(nproc) -fps_mode:v cfr  \
   -f rtsp -rtsp_transport udp rtsp://localhost:8554"/mystream


# -filter:v  fps=fps=source_fps:round=near or -filter:v  fps=fps=film:round=near 

##  -af "rubberband=tempo=0.9999"

nice -n -11  rpicam-vid  --low-latency 1  -b 1000000 --autofocus-mode manual --autofocus-range normal --autofocus-window  0.25,0.25,0.5,0.5  \
--denoise cdn_off --libav-video-codec-opts bf=0 --intra 0    --codec libav --libav-format flv  --brightness 0.1 --contrast 1.0 --sharpness   1.0  \
--profile=high --hdr=off --libav-video-codec h264_v4l2m2m   --level 4.2 --framerate 24  --width 1536 --height 864  \
--audio-device=alsa_input.usb-Creative_Technology_Ltd_Sound_Blaster_Play__3_00229929-00.analog-stereo --av-sync=0 \
--audio-codec libfdk_aac  --audio-channels 2 --libav-audio 1 --audio-source pulse --audio-samplerate=48000  --audio-bitrate=128kbps \
-t 0  -n --inline -o  - | ffmpeg   -hide_banner -fflags nobuffer+genpts  -flags low_delay   -hwaccel drm -hwaccel_output_format drm_prime \
-i -  -metadata title='Lucy'  -c:v  h264_v4l2m2m  -b:v 1500k   -threads $(nproc) \
-c:a  libfdk_aac -eld_sbr 1  -vbr 0  -b:a 64k  -threads $(nproc) -fps_mode:v cfr   -af "rubberband=tempo=0.9999"  \
-f rtsp -rtsp_transport udp rtsp://localhost:8554"/mystream
