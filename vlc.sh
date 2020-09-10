sudo apt build-dep -y vlc  && \
cd ~/ffmpeg_sources  && git clone https://github.com/videolan/vlc.git
cd vlc && ./bootstrap && \
./configure \
--enable-mmal --enable-omxil --enable-rpi-omxil  \
--disable-libva --enable-fdkaac --enable-gles2  --disable-vdpau --disable-wayland  && \
make -j4 && sudo make install && sudo  ldconfig && \
sudo apt purge -y libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev  && \
sudo apt purge -y  vlc vlc-bin vlc-plugin* libvlc* ffmpeg mpv  && \
cd ~/ && sudo apt-mark manual opencv* && sudo apt-mark manual lib* && sudo apt-mark manual *-dev  &&  sudo apt-mark manual qml-module* && \
sudo apt-mark hold libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev  && \
sudo apt install -y --no-install-recommends  qml-module-qtquick-layouts qml-module-org-kde-newstuff \
vlc-plugin-video-output libvlc5 libvlccore9  libvlc-bin  vlc-data phonon4qt5-backend-vlc && sudo ldconfig 
