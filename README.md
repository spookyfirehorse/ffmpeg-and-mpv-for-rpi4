install mpv gpu output rpi + nvidia + intel

apt build-dep ffmpeg


sudo apt  install -y build-essential cmake libgtk2.0-dev pkg-config \
python-numpy python-dev   \
libtiff5-dev \
libjasper-dev libopencv-dev checkinstall pkg-config \
yasm libjasper-dev  \
 libswscale-dev libdc1394-22-dev \
libxine2 libgstreamer0.10-dev  libv4l-dev \
libgstreamer-plugins-base0.10-dev python-dev \
python-numpy libtbb-dev libqt4-dev libgtk2.0-dev \
libmp3lame-dev libopencore-amrnb-dev \
libopencore-amrwb-dev libtheora-dev libvorbis-dev \
libxvidcore-dev x264 v4l-utils  autoconf \
automake \
build-essential \
cmake \
git-core \
libass-dev \
libfreetype6-dev \
libsdl2-dev \
libtool \
libvdpau-dev \
libvorbis-dev \
libxcb1-dev libvpx-dev libpulse-dev libsoxr-dev  libopus-dev  libwebp-dev libxvidcore-dev libzvbi-dev \
libxcb-shm0-dev libfdk-aac-dev libfdk-aac1    libv4l-dev  \
libxcb-xfixes0-dev libvpx-dev libfdk-aac-dev libmp3lame-dev  libopencore-amrnb-dev  libopencore-amrwb-dev \
pkg-config \
texinfo libpulse-dev libomxil-bellagio-dev libssh-gcrypt-dev libssl-dev  \
wget zlib1g-dev nasm yasm libx264-dev libx265-dev libnuma-dev mercurial libnuma-dev libgles2-mesa-dev git devscripts equivs


cd ~/ffmpeg_sources && \
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg

RASPberry

PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-libaom \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus  \
  --enable-libvorbis --enable-libopencore_amrnb \
  --enable-libxvid --enable-sdl2 --enable-libopencore_amrwb \
  --enable-libx264 --enable-pthreads --enable-openssl   \
  --enable-nonfree --disable-debug  \
  --enable-libsoxr  --enable-version3 --enable-libx265 \
  --enable-libvpx --disable-doc --disable-htmlpages \
  --enable-libpulse --enable-libssh  --disable-manpages --disable-podpages  --enable-avisynth \
  --enable-opengl --enable-libzvbi --enable-avfilter   --enable-filters \
  --enable-mmal --enable-omx --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal  --enable-encoder=h264_omx \
  --enable-runtime-cpudetect --enable-libwebp  --enable-swresample \
   --enable-libjack --enable-shared --enable-zlib --disable-static 
   
PATH="$HOME/bin:$PATH" make -j 4 
   
   make install 
   
   cp bin/ff* /usr/local/bin/
   
   
   NVIDIA
   
   apt install nvidia-driver cuda-toolkit
   
   
   cd ~/ffmpeg_sources && \
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include"  \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="$HOME/bin" \
  	--enable-gpl \
	--enable-avisynth \
	--enable-ladspa \
	--enable-libass \
	--enable-libbluray \
	--enable-libbs2b \
	--enable-libcaca \
	--enable-libcdio \
	--enable-libflite \
	--enable-libfontconfig \
	--enable-libfreetype \
	--enable-libfribidi \
	--enable-libgme \
	--enable-libgsm \
	--enable-libmp3lame \
	--enable-libmysofa \
	--enable-libopenjpeg \
	--enable-libopenmpt \
	--enable-libopus \
	--enable-libpulse \
	--enable-librubberband \
	--enable-libshine \
	--enable-libsnappy \
	--enable-libsoxr \
	--enable-libspeex \
	--enable-libssh \
	--enable-libtheora \
	--enable-libtwolame \
	--enable-libvorbis \
	--enable-libvpx  --enable-zlib --enable-xlib --enable-libxcb \
	--enable-libwavpack --enable-runtime-cpudetect \
	--enable-libwebp --disable-doc   --enable-vdpau --enable-openssl \
	--enable-libx265 --enable-version3 --disable-stripping \
	--enable-libxml2 --enable-libx264 --enable-libaom  \
	--enable-libxvid --enable-libfdk-aac --enable-avfilter --enable-filters  --enable-pthreads  \
	--enable-libzvbi --enable-nonfree  --enable-libvidstab \
	--enable-omx --enable-cuda --enable-cuvid --enable-nvenc --enable-ffnvcodec --enable-libnpp \
	--enable-openal --enable-chromaprint --enable-cuda-nvcc --enable-libvo_amrwbenc   \
	 --enable-swresample   --enable-shared --disable-static --enable-cuda-llvm     --enable-vdpau --enable-vaapi --enable-librubberband
  
   
   PATH="$HOME/bin:$PATH" make -j 4 
   
   make install 
   
   cp bin/ff* /usr/local/bin/
   
   
   
   INTEL
   
   install intel driver 
   
   
    cd ~/ffmpeg_sources && \
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include"  \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="$HOME/bin" \
  	--enable-gpl \
	--enable-avisynth \
	--enable-ladspa \
	--enable-libass \
	--enable-libbluray \
	--enable-libbs2b \
	--enable-libcaca \
	--enable-libcdio \
	--enable-libflite \
	--enable-libfontconfig \
	--enable-libfreetype \
	--enable-libfribidi \
	--enable-libgme \
	--enable-libgsm \
	--enable-libmp3lame \
	--enable-libmysofa \
	--enable-libopenjpeg \
	--enable-libopenmpt \
	--enable-libopus \
	--enable-libpulse \
	--enable-librubberband \
	--enable-libshine \
	--enable-libsnappy \
	--enable-libsoxr \
	--enable-libspeex \
	--enable-libssh \
	--enable-libtheora \
	--enable-libtwolame \
	--enable-libvorbis \
	--enable-libvpx  --enable-zlib --enable-xlib --enable-libxcb \
	--enable-libwavpack --enable-runtime-cpudetect \
	--enable-libwebp --disable-doc   --enable-vdpau --enable-openssl \
	--enable-libx265 --enable-version3 --disable-stripping \
	--enable-libxml2 --enable-libx264 --enable-libaom  \
	--enable-libxvid --enable-libfdk-aac --enable-avfilter --enable-filters  --enable-pthreads  \
	--enable-libzvbi --enable-nonfree  --enable-libvidstab \
	--enable-omx  \
	--enable-openal --enable-chromaprint --enable-cuda-nvcc  --enable-libvo_amrwbenc   \
	 --enable-swresample   --enable-shared --disable-static    --enable-vdpau --enable-vaapi --enable-librubberband
   
      PATH="$HOME/bin:$PATH" make -j 4 

   make install 
   
   sudo cp bin/ff* /usr/local/bin/
   
   
   
   Install MPV 
   
                                     
   RASPI
   
   apt build-dep mpv
   
   apt purge libav*-dev
   
   remove all libav*-dev annyway
   
   wget https://github.com/mpv-player/mpv/archive/v0.30.0.zip

unzip  v0.30.0.zip

cd mpv

./waf configure     --enable-rpi --enable-rpi-mmal --disable-vaapi --disable-egl-drm  --enable-egl-x11

   
   ./waf -j4


sudo ./waf install
   
   
   nano .config/mpv/mpv.conf
   and put this in
#############################################   
audio-display=no
ao=pulse
ovc=h264_mmal
oac=libfdk_aac
volume=40
hwdec-codecs=mmal_copy
cache=no
no-border
#scale=ewa_lanczossharp
#cscale=ewa_lanczossharp
#interpolation
#tscale=oversample
#ytdl-format=bestvideo[ext=mp4][width<=1920][height<=1080]+bestaudio[ext=m4a]/best[ext=mp4]/best
#fullscreen=yes
audio-samplerate = 96000
af=crystalizer=2.5,bass=gain=7,rubberband,acompressor=level_in=0.25:threshold=0.11:ratio=4:makeup=5:release=5000
hls-bitrate=max
saturation=-15
#brightness=0
volume-max=100
#contrast=0
#panscan=1
#vf=hqdn3d
[omx]
ovc = h264_omx
oacopts-add = b=1700k
oac = libfdk_aac
oacopts-add = b=128k
audio-samplerate = 48000

[vpx]
profile-desc = "VP9 (libvpx)"
ovc = libvpx-vp9
ovcopts = speed=6,lag-in-frames=8,slices=2,threads=0,crf=18,qmin=0,qmax=36
audio-samplerate = 48000   


#########################


NVIDIA INTEL MPV



git clone https://github.com/mpv-player/mpv.git 


apt build-dep mpv

apt purge libav*-dev

./waf configure --enable-libmpv-shared
./waf -j4

sudo ./waf install

nano .config/mpv/mpv.conf
   and put this in for NVIDIA
   
   
audio-display=no
cache=no
video-sync=display-resample
ovc=hevc_nvenc
oac=libfdk_aac
volume=40
hwdec-codecs=nvdec-copy
ao=pulse
x11-bypass-compositor=yes
vf=hqdn3d
#vf=format=yuv420p,vapoursynth=~~/motioninterpolation.vpy:4:4
audio-samplerate = 96000
no-border
scale=ewa_lanczossharp
cscale=ewa_lanczossharp
interpolation
tscale=oversample
af=crystalizer=2.5,bass=gain=7,rubberband=pitch=quality,acompressor=level_in=0.25:threshold=0.11:ratio=4:makeup=5:release=9000
hls-bitrate=max
volume-max=100
ytdl-format=bestvideo[ext=mp4][width<=1920][height<=1080]+bestaudio[ext=m4a]/best[ext=mp4]/best
#af=firequalizer=gain=5
#af=superequalizer=1b=1


[nvenc]
ovc = h264_nvenc
oac = libfdk_aac
oacopts-add = b=128k
audio-samplerate = 48000
hls-bitrate=max


[libx]
ovc = libx264
ovcopts-add = b=1200
oac = libfdk_aac
oacopts-add = b=128k
audio-samplerate = 48000   
