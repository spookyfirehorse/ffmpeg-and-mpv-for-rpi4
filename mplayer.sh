sudo apt build-dep mplayer  && \
svn checkout svn://svn.mplayerhq.hu/mplayer/trunk mplayer && cd mplayer && ./configure  --enable-faad --enable-gui --disable-ffmpeg_a    && \
make -j4 && sudo make install

