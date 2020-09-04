sudo apt -y  install autoconf automake build-essential cmake doxygen git graphviz imagemagick libasound2-dev libass-dev libfreetype6-dev libgmp-dev  libmp3lame-dev libopus-dev librtmp-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-net-dev libsdl2-ttf-dev libsnappy-dev libsoxr-dev libssh-gcrypt-dev libssl-dev libtool libv4l-dev libva-dev libvorbis-dev libwebp-dev libx264-dev libxcb-shape0-dev libxcb-shm0-dev libxcb-xfixes0-dev libxcb1-dev libxml2-dev lzma-dev meson nasm pkg-config python3-dev python3-pip texinfo wget yasm zlib1g-dev youtube-dl libgtk2.0-dev pkg-config python-numpy python-dev libtiff5-dev libjasper-dev libopencv-dev checkinstall pkg-config yasm libjasper-dev  libdc1394-22-dev libxine2 libgstreamer0.10-dev  libv4l-dev libgstreamer-plugins-base0.10-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils  autoconf automake build-essential cmake git-core libass-dev libfreetype6-dev libsdl2-dev libtool libvdpau-dev libvorbis-dev libxcb1-dev libvpx-dev libpulse-dev libsoxr-dev  libopus-dev  libwebp-dev libxvidcore-dev libzvbi-dev libxcb-shm0-dev  libv4l-dev libxcb-xfixes0-dev libvpx-dev  libmp3lame-dev  pkg-config texinfo libpulse-dev libomxil-bellagio-dev libssh-gcrypt-dev libssl-dev wget zlib1g-dev nasm yasm libx264-dev   libnuma-dev libgles2-mesa-dev git devscripts equivs meson glslang* spirv-tool libplacebo*


mkdir ~/ffmpeg_sources && \
cd ~/ffmpeg_sources && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure  --disable-shared && \
make && \
sudo make install

sudo ldconfig




sudo apt build-dep ffmpeg

mkdir ~/bin

cd ~/ffmpeg_sources && wget https://ffmpeg.org/releases/ffmpeg-4.3.1.tar.bz2 && tar xjvf ffmpeg-4.3.1.tar.bz2 && cd ffmpeg-4.3.1

PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --pkg-config-flags="--static" --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" --extra-libs="-lpthread -lm" --bindir="$HOME/bin" --enable-gpl --enable-libaom --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libv4l2 --enable-libxvid --enable-sdl2 --enable-libx264 --enable-pthreads --enable-openssl --enable-nonfree --disable-debug --enable-libsoxr --enable-version3 --enable-libvpx --disable-doc --disable-htmlpages --enable-libpulse --enable-libssh --disable-manpages --disable-podpages --enable-opengl --enable-libzvbi --enable-avfilter --enable-filters --enable-mmal --enable-omx --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx --enable-runtime-cpudetect --enable-libwebp --disable-avresample --enable-swresample --enable-x86asm --enable-libjack --enable-shared --disable-static --enable-librubberband --disable-vdpau --disable-vaapi --enable-gmp --enable-hardcoded-tables --disable-stripping

PATH="$HOME/bin:$PATH" make -j 4

make install && cd ~/bin && sudo cp ff* /usr/local/bin/

sudo apt build-dep mpv

sudo apt purge libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev 

sudo apt-mark manual opencv* && sudo apt-mark manual lib* && sudo apt-mark manual *-dev


nano .bashrc
on the beginn of this file copy and past

###########################

export CPATH=~/ffmpeg_build/include

export LD_LIBRARY_PATH=~/ffmpeg_build/lib

export PKG_CONFIG_PATH=~/ffmpeg_build/lib/pkgconfig:/opt/vc/lib/pkgconfig

###########################################################################

close the terminal and open a new one 

important




cd ~/ffmpeg_sources



git clone https://github.com/mpv-player/mpv.git



cd mpv



./bootstrap.py



./waf configure --prefix=/usr/local --enable-rpi --enable-rpi-mmal --disable-vaapi --enable-egl-drm --enable-egl-x11 --disable-wayland --disable-wayland-protocols --disable-wayland-scanner --disable-gl-wayland --disable-android --disable-vdpau --disable-vulkan



./waf -j4



sudo ./waf install



mkdir ~/.config/mpv 

nano .config/mpv/mpv.conf

put this in and store


##########################################

gpu-context=rpi

gpu-api=opengl

vo=rpi

ao=pulse

#ovc=h264_mmal

#oac=libfdk_aac

volume=20

hwdec=h264_mmal-mmal-copy

hwdec-codecs=all

ytdl-format=bestvideo[ext=mp4][width<=1920][height<=1080]+bestaudio[ext=m4a]/best[ext=mp4]/best

fullscreen=yes

audio-display=no

cache=yes

no-border

hls-bitrate=max

audio-samplerate=48000

af=lavfi-crystalizer=1,lavfi-bass=gain=1

#video-sync=display-resample

volume-max=100

audio-channels=stereo




[omx]
ovc = h264_omx
oacopts-add = b=1700k
oac = libfdk_aac
oacopts-add = b=128k


[vpx]
profile-desc = "VP9 (libvpx)"
ovc = libvpx-vp9

##########################################################

sudo nano /boot/config.txt

###########

gpu_mem=128

#dtoverlay=vc4-kms-v3d

#dtoverlay=vc4-fkms-v3d

###############

disable al vd3 and gpu mem 128 


sudo reboot



mpv example.mp4



mpv /media/moon/filme/12.mp4

(+) Video --vid=1 (*) (h264 1288x720 23.976fps)

(+) Audio --aid=1 (*) (aac 2ch 44100Hz)

Using hardware decoding (mmal-copy).

AO: [pulse] 48000Hz stereo 2ch float

VO: [rpi] 1288x720 => 1288x720 yuv420p

AV: 00:01:05 / 02:09:24 (1%) A-V: 0.000 Dropped: 1 Cache: 706s/150MB



runtime cpu 15 %



enjoy



buy me a beer !



####################################################################################################

VLC

####################################################################################################







jetzt noch der vlc-git 4.0






sudo apt-get install libxcb-shm0-dev libxcb-xv0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-composite0-dev libx11-xcb-dev libqt5*-dev qt5*-dev libplacebo* xcb-xkb*-dev





sudo apt build-dep vlc



apt purge libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev



sudo apt-mark manual opencv* && sudo apt-mark manual lib* && sudo apt-mark manual *-dev




apt-mark hold libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev


git clone https://github.com/videolan/vlc.git



cd vlc && ./bootstrap

./configure  --enable-mmal --enable-omxil --enable-rpi-omxil --disable-libva --enable-fdkaac --enable-gles2 --disable-qt --disable-vdpau --disable-wayland --disable-wayland-protocols  --disable-wayland-scanner --disable-gl-wayland  --disable-qt



make -j4


sudo make install 


sudo ldconfig


cvlc   example.mp4
