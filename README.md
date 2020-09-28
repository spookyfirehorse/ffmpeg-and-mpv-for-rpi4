hi everybody !!!

sorry for my bad english

compilations guide for:
ALL Raspberrys and ubuntu rpi

its very easy !!!

you can play movies without overheating

CPU runtime 15 %

you can stream cammera output and audio over ssh

ssh only automatic login work

ssh user@host ffmpeg -fflags nobuffer  -hide_banner -y   -f alsa  -ac 1 -i hw:CARD=Device,DEV=0      -f v4l2  -re -i /dev/video0    -c:v h264_omx -profile:v high  -level 4  -pix_fmt yuv420p -g 45 -bf 2 -trellis 2 -cmp 2 -subcmp 2  -b:v 1200k  -c:a libfdk_aac  -profile:a aac_he -b:a 128k -movflags +faststart    -f  mpegts  - | mpv --profile=low-latency   -

you can find your alsa device by  aplay -L  and rename hw:CARD

encode and decode movies and music

convert movies and music in other formats

x11grab for recording desktop

ffmpeg  -hide_banner -f pulse -ac 2 -i default -f x11grab -framerate 25 -video_size 1920x1080 -i :0.0+0,0 -c:v h264_omx  -pix_fmt yuv420p  -b:v 1200k -c:a libfdk_aac -b:a 128k  -ar 48000   testvideo.mp4

download a movie 

ffmpeg -i http://url -c:v copy -c:a copy output.mp4

########################################   INSTALL  STEP BY STEP #################################################################

sudo apt build-dep ffmpeg mpv vlc mesa llvm mplayer

sudo apt install llvm-spirv llvm-dev llvm libglw1-mesa libglw1-mesa-dev cmake meson build-essential yasm git libass-dev python3-pip python3-dev cython3 autoconf libtool libmagick++-dev  libbiococoa-dev libglvnd-dev  libgles2-mesa libegl1-mesa libd3dadapter9-mesa-dev libd3dadapter9-mesa xscreensaver-gl-extra libqt5gstreamer-dev libgstreamermm-1.0-dev libgstreamer1.0-dev  libgstreamer-plugins-base1.0-dev && \
sudo apt purge libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev libavutil-dev && \
mkdir -p ~/bin &&  \
mkdir -p ~/ffmpeg_sources

##########################################################################
FDKAAC

mkdir -p ~/ffmpeg_sources && \
cd ~/ffmpeg_sources && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure  --disable-shared && \
make -j4 && \
sudo make install && sudo ldconfig

#####################################################################

sudo apt install zlib1g-dev libcunit1-dev libcunit1-dev  && \
cd ~/ffmpeg_sources && git clone https://github.com/hoene/libmysofa.git && cd libmysofa/build  && \
cmake -DCMAKE_BUILD_TYPE=Debug .. && sudo make install && sudo ldconfig

###########################################

cd ~/ffmpeg_sources && git clone https://github.com/AviSynth/AviSynthPlus.git && \
cd ~/ffmpeg_sources/AviSynthPlus && /
mkdir avisynth-build && cd avisynth-build && \ 
cmake ../ -DHEADERS_ONLY:bool=on  && \
sudo make install  && sudo ldconfig

##################################################
SHADERC

git clone https://github.com/google/shaderc build
cd build
./utils/git-sync-deps && cmake -GNinja -DCMAKE_BUILD_TYPE=Release

sudo ninja install
##############################################

LIBPLACEBO

sudo apt install  gslang-dev spirv-tools && \
cd ~/ffmpeg_sources && \ 
git clone https://github.com/haasn/libplacebo.git && \
cd ~/ffmpeg_sources/libplacebo && /cd v	
DIR=./build && \
meson $DIR  && \
meson configure $DIR   -Dvulkan=enabled -Dshaderc=enabled
ninja -C$DIR  && \
sudo ninja -Cbuild install
######################################################
SRT

git clone --depth 1 https://github.com/Haivision/srt.git && \
./configure && \
make -j4 && \
sudo make -j 4 install  && sudo ldconfig
###################################################

#####################################################################################
CHROMAPRINT

git clone  https://github.com/acoustid/chromaprint.git && \
cd ~/ffmpeg_sources/chromaprint && \
cmake --prefix=/usr/local -DCMAKE_BUILD_TYPE=Release -DBUILD_TOOLS=ON . && make -j4 && sudo make install  && sudo ldconfig

 #########################################################################################
 
FFmpeg


mkdir -p ~/bin &&  \
mkdir -p ~/ffmpeg_sources &&  \
cd ~/ffmpeg_sources && git clone https://github.com/FFmpeg/FFmpeg.git && cd ~/ffmpeg_sources/FFmpeg && \
./configure --prefix=/usr/local --enable-gpl --enable-neon  --disable-stripping --enable-libsoxr --enable-libpulse --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libssh --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --disable-doc --disable-htmlpages --disable-manpages --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-mmal --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-avisynth --enable-libsrt --enable-shared --enable-libfdk-aac --enable-nonfree --enable-liblensfun --enable-libopencore_amrnb --enable-version3
make -j4
sudo make install
make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/local/bin/ && ldconfig

#######################################################################################################################

cd ~/ffmpeg_sources  && \
git clone https://github.com/mpv-player/mpv.git && \
cd ~/ffmpeg_sources/mpv && \
./bootstrap.py && \
export PKG_CONFIG_PATH=/opt/vc/lib/pkgconfig && ./waf configure --enable-rpi --enable-rpi-mmal  \
--enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2 --enable-ffmpeg-strict-abi --disable-libavdevice  \
--enable-xv  --enable-egl-x11 --enable-libmpv-shared && \
./waf -j4 && sudo  ./waf install && sudo ldconfig

############################################################################
cd ~/ffmpeg_sources  && git clone https://github.com/videolan/vlc.git
cd vlc && ./bootstrap && \
./configure \
--enable-mmal --enable-omxil --enable-rpi-omxil  \
--enable-fdkaac --enable-gles2   && \
make -j4 && sudo make install && sudo  ldconfig && \
sudo apt purge -y  vlc vlc-bin vlc-plugin* libvlc* ffmpeg mpv  && \
cd ~/ && sudo apt-mark manual opencv* && sudo apt-mark manual lib* && sudo apt-mark manual *-dev  &&  sudo apt-mark manual qml-module* && \
sudo apt-mark hold libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev && sudo ldconfig

#####################################################################################
MPLAYER

wget http://www.mplayerhq.hu/MPlayer/releases/mplayer-export-snapshot.tar.bz2
tar xf mplayer-export-snapshot.tar.bz2
cd mplayer-/
./configure   --enable-faad 
#################################################################################
done
#############################################################
PULSEEFFECTS &lsp-plugins

apt install -y libfftw3-bin libfftw3-dev  && \
git clone https://github.com/swh/ladspa.git  && \
autoreconf -i && \
./configure && \
make -j4 && \
sudo make install


apt build-dep pulseeffects

git clone https://github.com/wwmm/pulseeffects.git
cd pulseeffects
git checkout v4.8.0
meson _build --prefix=/usr
sudo ninja -C _build install
##############################################

sudo apt install python3-pip bc swh-plugins meson && sudo pip3 install ninja && \
cd ~/ffmpeg_sources && git clone https://github.com/pulseaudio-equalizer-ladspa/equalizer.git &&\
cd equalizer && \
meson build && \
cd build && \
ninja && \
sudo ninja install
###########################################


