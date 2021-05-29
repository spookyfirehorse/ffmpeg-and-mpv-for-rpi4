


########################################   INSTALL  STEP BY STEP #################################################################


sudo apt build-dep ffmpeg mpv vlc mesa llvm mplayer

cd ~/ffmpeg_sources && git clone https://github.com/AviSynth/AviSynthPlus.git && \
cd ~/ffmpeg_sources/AviSynthPlus && /
mkdir avisynth-build && cd avisynth-build && \ 
cmake ../ -DHEADERS_ONLY:bool=on  && \
sudo make install  && sudo ldconfig

 
FFmpeg


mkdir -p ~/bin &&  \
mkdir -p ~/ffmpeg_sources &&  \
cd ~/ffmpeg_sources && git clone https://github.com/FFmpeg/FFmpeg.git && cd ~/ffmpeg_sources/FFmpeg && \
./configure --prefix=/usr --extra-version=4 --toolchain=hardened --libdir=/usr/lib/arm-linux-gnueabihf --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --enable-libsoxr --enable-libpulse --enable-swresample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libssh --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --disable-doc --disable-htmlpages --disable-manpages --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-mmal --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-avisynth  --enable-shared --enable-libfdk-aac --enable-nonfree  --enable-libopencore_amrnb --enable-version3

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

#####################################################################################
MPLAYER

wget http://www.mplayerhq.hu/MPlayer/releases/mplayer-export-snapshot.tar.bz2
tar xf mplayer-export-snapshot.tar.bz2
cd mplayer-/
./configure   --enable-faad 
make -j4
sudo make install
#################################################################################
done
#############################################################


