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
6 houre runntime half second sync dif

nice -n -11  rpicam-vid  --low-latency 1  -b 1000000 --autofocus-mode manual --autofocus-range normal --autofocus-window  0.25,0.25,0.5,0.5   --denoise cdn>
  --codec libav --libav-format flv  --brightness 0.1 --contrast 1.0 \
  --profile=high --hdr=off --libav-video-codec h264_v4l2m2m   --sharpness   1.0  --level 4.2 --framerate 24  --width 1280 --height 720 \
  --audio-device=alsa_input.usb-Creative_Technology_Ltd_Sound_Blaster_Play__3_00229929-00.analog-stereo --av-sync=0 \
  --audio-codec aac  --audio-channels 2 --libav-audio 1 --audio-source pulse --audio-samplerate=48000  --audio-bitrate=96kbps  \
  -t 0  -n --inline -o  - | ffmpeg -r 24  -hide_banner -fflags nobuffer+genpts  -flags low_delay -hwaccel drm -hwaccel_output_format drm_prime -i -\
  -metadata title='Lucy'  -vcodec h264_v4l2m2m  -b:v 1M -num_output_buffers 32 -num_capture_buffers 16  -acodec aac -profile:a aac_low \
  -b:a 32k -threads $(nproc) -fps_mode:v cfr   -filter:v  fps=fps=film:round=near:start_time=30  \
   -f rtsp -rtsp_transport udp  rtsp://localhost:8554/mystream


######################################################


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
ovcopts=profile=high
ovcopts=level=4.2
ovcopts=b=1M
oac=libfdk_aac
oacopts=b=64k
cache=no
framedrop=decoder+vo
demuxer-lavf-o-add=fflags=+nobuffer+genpts,flags=low_delay
#,use_wallclock_as_timestamp=1
of=rtsp
volume=100
rtsp-transport=udp
oset-metadata=title="Lucy",comment="stream"
audio-format=s16
audio-samplerate=48000
vo-null-fps=23.976
#vo-null-fps=25
#demuxer-lavf-hacks=yes
hr-seek-framedrop=no
video-sync=audio
pulse-latency-hacks=yes
video-latency-hacks=yes
audio-demuxer=lavf
demuxer=lavf
#speed=1.001


