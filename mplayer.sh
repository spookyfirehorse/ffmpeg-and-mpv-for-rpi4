#sudo apt build-dep mplayer  && svn checkout svn://svn.mplayerhq.hu/mplayer/trunk mplayer && cd mplayer && ./configure  --enable-faad --enable-gui --disable-ffmpeg_a    && make -j4 && sudo make install
apt source mplayer && cd mplayer-1.4+ds1/ && ./configure  --enable-faad --enable-gui --enable-dvdnav --disable-ffmpeg_a  --disable-vdpau  && make -j4 && sudo make install

