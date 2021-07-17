

Sorry for my bad english

compile all libfdk ffmpeg and mpv on raspian with cammera usb or intern 
and from another computer you put thisin a konsole
ssh must run with key identification
maybe you must change audio input

arecord -L gives you the name

ssh user@pc ffmpeg -vsync 0  -fflags nobuffer  -hide_banner -threads 4 -strict -2  \
 -f alsa   -ar 48000 -ac 1  -i hw:CARD=Device,DEV=0 \
 -f v4l2 -r 5  -i /dev/video0  -c:v h264_omx   -profile:v high -level 4   -pix_fmt yuv420p   -b:v 1M  -bf 0 -trellis 0  -g 60 \
 -c:a libfdk_aac -profile:a aac_he  -b:a 32k -movflags +faststart \
 -f  mpegts  - |  mpv --cache=no  --profile=low-latency --volume=50  -


or with libopus

libopus is sometimes better


ssh user@pc ffmpeg -vsync 0  -fflags nobuffer  -hide_banner -threads 4 -strict -2  \
 -f alsa   -ar 48000 -ac 1  -i hw:CARD=Device,DEV=0 \
 -f v4l2 -r 5  -i /dev/video0  -c:v h264_omx   -profile:v high -level 4   -pix_fmt yuv420p   -b:v 1M  -bf 0 -trellis 0  -g 60 \
 -c:a libopus  -b:a 32k -movflags +faststart \
 -f  mpegts  - |  mpv --cache=no  --profile=low-latency --volume=50  -



This scripts are multimedia scripts for rpi 4 3b+

you can install ffmpeg with all codecs mpv all codecs laspa equalizer and pulseeffects

all is running with hwaccel  and the cpu is cool 







                                          THE SIMPLE WAY 
                                          
#########################



mkdir -p ~/ffmpeg_sources && \
cd ~/ffmpeg_sources && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure  --disable-shared && \
make -j4 && \
sudo make install && sudo ldconfig





Compile FFmpeg


sudo apt build-dep ffmpeg && mkdir -p ffmpeg_sources && cd ~/ffmpeg_sources &&  git clone https://github.com/FFmpeg/FFmpeg.git && cd FFmpeg && \
./configure --prefix=/usr/local --enable-gpl --enable-nonfree --extra-libs="-lpthread -lm -latomic" --toolchain=hardened --enable-libvpx  \
--enable-vaapi --disable-stripping --libdir=/usr/local/lib/arm-linux-gnueabihf --incdir=/usr/local/include/arm-linux-gnueabihf \
--enable-libsoxr --enable-libpulse --enable-gnutls --enable-ladspa --enable-libass --enable-libbluray --enable-libbs2b  --enable-libcdio \
--enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack \
--enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libssh --enable-librsvg  --enable-libshine \
--enable-libsnappy --enable-libspeex --enable-libopus  --enable-libtheora --enable-libtwolame --enable-libvorbis  --enable-libwebp \
--enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --disable-doc --disable-htmlpages --disable-manpages --enable-libzvbi --enable-lv2 \
--enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-omx --enable-libdc1394 --enable-libdrm --enable-frei0r --enable-libx264   \
--enable-libsrt --enable-shared --enable-libfdk-aac  --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-version3  \
 --enable-lv2 --enable-libwebp --enable-libvpx --enable-libv4l2 --enable-libspeex   \
--enable-librubberband --enable-libaom  --enable-pthreads --enable-v4l2-m2m --arch=armhf  \
--enable-libsnappy --enable-mmal --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx \
&& make -j4 && sudo make install && make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig

###########################

Compile MPV

cd ~/ffmpeg_sources  && \
git clone https://github.com/mpv-player/mpv.git && \
cd ~/ffmpeg_sources/mpv && \
./bootstrap.py && \
export PKG_CONFIG_PATH=/opt/vc/lib/pkgconfig && ./waf configure --enable-rpi --enable-rpi-mmal  --enable-egl-drm --enable-gl-x11 \
--enable-egl --enable-sdl2 --enable-ffmpeg-strict-abi  --enable-xv --enable-zimg --enable-egl-x11 --enable-libplacebo --enable-vulkan && 
./waf -j4 && sudo  ./waf install

##########################

MPLAYER with gl 

cd ~/ffmpeg_sources/ && svn checkout svn://svn.mplayerhq.hu/mplayer/trunk mplayer && cd mplayer && \
./configure  --enable-faad --enable-gui   --disable-ffmpeg_a  --enable-ffmpeg_so  && make -j4 && sudo make install

###########################################

nano /home/pi/.mplayer/conf

##########################################

Write your default config options here!

ao = alsa

vo = gl

volume = 30

idx = yes

#format = s24le

user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Safari/605.1.15"

#af=lavcresample=44100

lirc=no

stop-xscreensaver=yes

cache-min=60

cache=4096

#cache-seek-min=30

framedrop=yes

autoq=100

#vf=hqdn3d,pp=de

#forceidx=yes

zoom=yes

#channels=4

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



