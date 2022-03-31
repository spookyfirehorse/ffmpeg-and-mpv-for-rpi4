
INSTALL FFMPEG for RPI4 32 bit + 64bit with nonfree codecs v4l2_request sand usw. + mmal on 32 bit

+MPV


########################### 

edit xdg and change to openbox windowmanager mutter is running with to much cpu


sudo nano /etc/xdg/lxsession/LXDE-pi/desktop.conf

#window_manager=mutter

window_manager=openbox

######################################################

FDK-AAC

wget http://deb.debian.org/debian/pool/non-free/f/fdk-aac/fdk-aac_2.0.2.orig.tar.gz && tar -xf fdk-aac_2.0.2.orig.tar.gz  && cd fdk-aac-2.0.2/ && autoreconf -fiv && \
./configure  --enable-shared && \
make -j4 && \
sudo make install && sudo ldconfig
######

sudo ln -s /usr/include/libdrm /usr/include/drm/

###################################################

64 bit FFMPEG

sudo apt build-dep ffmpeg

git clone -b test/4.3.3/rpi_main https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr  --toolchain=hardened --incdir=/usr/include/aarch64-linux-gnu --libdir=/usr/lib/aarch64-linux-gnu --cpu=cortex-a72 --arch=arm64 --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --disable-mmal --enable-neon --enable-v4l2-request --enable-libudev --enable-sand -linux-gnu  --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libfdk-aac --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-epoxy   --enable-libxcb --enable-libzimg  --enable-vout-drm --enable-libv4l2  --enable-vout-egl  --disable-static --enable-libsrt --extra-cflags=-I/usr/include/libdrm && make -j4 && sudo make -j4 install

make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig



########

32 bit FFMPEG

git clone -b test/4.3.3/rpi_main https://github.com/jc-kynesim/rpi-ffmpeg.git && cd rpi-ffmpeg && ./configure --prefix=/usr --toolchain=hardened --libdir=/usr/lib/arm-linux-gnueabihf/neon/vfp --incdir=/usr/include/arm-linux-gnueabihf --arch=arm --extra-libs=-latomic --extra-cflags=-I/usr/include/libdrm --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-pocketsphinx --enable-librsvg --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-nonfree --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libpulse --enable-nonfree --enable-libfdk-aac --enable-libx265 --enable-version3 --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-vulkan --arch=arm --enable-mmal --enable-avresample --disable-filter=resample --enable-libwavpack  --enable-libv4l2 --enable-sand --enable-vout-drm --enable-vout-egl --enable-v4l2-request --enable-libudev --enable-rpi --cpu=cortex-a72 --enable-neon --enable-v4l2-request --enable-libudev --enable-sand --enable-pocketsphinx --disable-static --enable-opencl --enable-libsrt  && make -j4 && sudo make -j4 install

make tools/qt-faststart && sudo cp  tools/qt-faststart /usr/bin/ && sudo ldconfig

############################################################################

rpi zero 

sudo nano /etc/apt/sources.list.d/raspi.list

deb http://archive.raspberrypi.org/debian/ bullseye main

deb-src http://archive.raspberrypi.org/debian/ bullseye main

sudo apt update

sudo apt build-dep ffmpeg

apt source ffmpeg

cd ffmpeg-4.3.3

./configure --prefix=/usr --extra-version=0+rpt3+deb11u1 --toolchain=hardened --incdir=/usr/include/arm-linux-gnueabihf --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-mmal --enable-neon --enable-rpi --enable-v4l2-request --enable-libudev --enable-epoxy --enable-pocketsphinx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --libdir=/usr/lib/arm-linux-gnueabihf --cpu=arm1176jzf-s --arch=arm --enable-nonfree --enable-libfdk-aac


#############################################
#####################################################

MPV

sudo apt build-dep mpv

apt source mpv && cd mpv-0.32.0  && chmod 777 waf && ./waf configure --enable-egl-drm --enable-gl-x11 --enable-egl --enable-sdl2 --enable-libmpv-shared --enable-libplacebo --enable-vulkan --disable-vaapi --disable-vdpau --enable-ffmpeg-strict-abi && ./waf -j4 && sudo .waf -j4 install

##############################

CELLULOID mpv player with sidebar

sudo apt build-dep celluloid

apt source celluloid && cd celluloid* && meson build && cd build && ninja -j4 && sudo ninja install

############################

VLC

sudo apt build-dep vlc

git clone -b dev/3.0.16/drm_1 https://github.com/jc-kynesim/vlc.git && cd vlc && ./bootstrap  && autoreconf -fiv  && ./configure  --enable-mmal  --disable-vdpau --disable-fdkaac --enable-gles2 && make -j4 && sudo make -j4 install

#########################################################

