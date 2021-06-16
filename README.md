

Sorry for my bad english

in some cases you must remove sudo in scripts

sudo ninja install dont work on debian 10, on ubuntu and buster no problem
ninja install - open a window with passwot on debian bullseye
sudo make install works fine on all distros

in ffmpeg.sh or mpv.sh you can change the options and remove or add some

apt build-dep ffmpeg mpv do not install all you must compile something you need or delete the option


This scripts are multimedia scripts for rpi 4 3b+

you can install ffmpeg with all codecs mpv all codecs laspa equalizer and pulseeffects

all is running with hwaccel  and the cpu is cool



sudo apt build-dep ffmpeg && mkdir ffmpeg_sources && cd ~/ffmpeg_sources &&  git clone https://github.com/FFmpeg/FFmpeg.git && cd FFmpeg && \
./configure --prefix=/usr/ --enable-gpl --enable-nonfree --extra-libs="-lpthread -lm -latomic" --toolchain=hardened --enable-libvpx  \
--enable-vaapi --disable-stripping --libdir=/usr/lib/arm-linux-gnueabihf --incdir=/usr/include/arm-linux-gnueabihf \
--enable-libsoxr --enable-libpulse --enable-gnutls --enable-ladspa --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio \
--enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack \
--enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libssh --enable-librsvg  --enable-libshine \
--enable-libsnappy --enable-libspeex --enable-libopus  --enable-libtheora --enable-libtwolame --enable-libvorbis  --enable-libwebp \
--enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --disable-doc --disable-htmlpages --disable-manpages --enable-libzvbi --enable-lv2 \
--enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-omx --enable-libdc1394 --enable-libdrm --enable-frei0r --enable-libx264  --enable-avisynth \
--enable-libsrt --enable-shared --enable-libfdk-aac  --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-version3  \
 --enable-libdav1d --enable-libsvtav1 --enable-lv2 --enable-libwebp --enable-libvpx --enable-libv4l2 --enable-libspeex   \
--enable-librubberband --enable-libaom   --enable-libkvazaar --enable-pthreads --enable-v4l2-m2m --arch=armhf  \
--enable-libsnappy --enable-mmal --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx \
&& make -j4 && sudo make install && make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig




cd ~/ffmpeg_sources  && \
git clone https://github.com/mpv-player/mpv.git && \
cd ~/ffmpeg_sources/mpv && \
./bootstrap.py && \
export PKG_CONFIG_PATH=/opt/vc/lib/pkgconfig && ./waf configure --enable-rpi --enable-rpi-mmal  --enable-egl-drm --enable-gl-x11 \
--enable-egl --enable-sdl2 --enable-ffmpeg-strict-abi --disable-libavdevice  --enable-xv --enable-zimg --enable-egl-x11 --enable-libmpv-shared --enable-libplacebo --enable-vulkan && 
./waf -j4 && sudo  ./waf install 


MPLAYER with gl on rpi no service in use like mpv --vo=gpu


cd ~/ffmpeg_sources  && wget http://www.mplayerhq.hu/MPlayer/releases/mplayer-export-snapshot.tar.bz2 && tar xf mplayer-export-snapshot.tar.bz2 && tar xf mplayer-export-snapshot.tar.bz2
tar xf mplayer-export-snapshot.tar.bz2
cd ~/ffmpeg_sources/mplayer-export-2016-10-02/
./configure   --enable-faad  --disable-ffmpeg_a && make -j4 && sudo make install


nano /home/pi/.mplayer/conf

##########################################
 Write your default config options here!
ao = alsa
vo = gl
volume = 30
idx = yes
format = s24le
user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Safari/605.1.15"
af=lavcresample=44100
lirc=no
stop-xscreensaver=yes
cache-min=60
cache=4096
#cache-seek-min=30
framedrop=yes
autoq=100
vf=hqdn3d,pp=de
#forceidx=yes
zoom=yes
channels=4
#srate=44100
volstep=2
lavdopts=threads=4


##############



mpv.conf
#######################################
#drm-connector=HDMI-A-1

#gpu-context=drm

#vo=drm

#gpu-context=displayvk

#gpu-api=vulkan

#vulkan-async-compute=yes

#vulkan-async-transfer=yes

#vulkan-queue-count=1

#profile=enc-a-aac



gpu-context=x11egl
gpu-api=opengl

#user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:49.0) Gecko/20100101 Firefox/49.0"

user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Safari/605.1.15"

#vo=x11

vo=sdl

#vo=gpu

#vo=xv

ao=pulse

volume=30

hwdec=h264_mmal-mmal-copy

#hwdec=h264_v4l2m2m-v4l2m2m-copy

hwdec-codecs=all

#hwdec-codec=h264_omx

#ytdl-raw-options=proxy=[socks5://127.0.0.1:8123]

ytdl-format=bestvideo[ext=mp4][width<=1920][height<=1080]+bestaudio[ext=m4a]/best[ext=mp4]/best

#fullscreen=yes

audio-display=no

cache=yes

#no-border

hls-bitrate=max

audio-samplerate=44100

af=lavfi-crystalizer=2,lavfi-bass=gain=3

#video-sync=display-resample

volume-max=100

audio-channels=stereo

framedrop=decoder+vo

keep-open=yes

#oac = libfdk_aac

#oacopts-add = b=128k

audio-device=pulse/ladspa_output.mbeq_1197.mbeq

audio-format=float

hr-seek-framedrop=no

force-seekable=yes

#x11-bypass-compositor=yes

index=recreate

demuxer-rawaudio-format=s24le

demuxer-rawaudio-rate=44100

hwdec-image-format=nv12

demuxer-max-bytes=2000MiB

demuxer-readahead-secs=300

#vf=hqdn3d,pp=de


[omx]

ovc=h264_v4l2m2m

ovcopts-add = b=2M

oac = libfdk_aac

oacopts-add = b=128k

user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Safari/605.1.15"

ytdl-format=bestvideo[ext=mp4][width<=1920][height<=1080]+bestaudio[ext=m4a]/best[ext=mp4]/best

audio-samplerate=44100

hls-bitrate=max

cache=yes

framedrop=decoder+vo

demuxer-max-bytes=2000MiB

demuxer-readahead-secs=300

###########################################
record any stream or file

mpv  file or stream  --o=test.mp4 --profile=omx

