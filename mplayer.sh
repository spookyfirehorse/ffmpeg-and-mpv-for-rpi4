cd ~/ffmpeg_sources  && wget http://www.mplayerhq.hu/MPlayer/releases/mplayer-export-snapshot.tar.bz2 && tar xf mplayer-export-snapshot.tar.bz2 && tar xf mplayer-export-snapshot.tar.bz2
tar xf mplayer-export-snapshot.tar.bz2

cd ~/ffmpeg_sources/mplaye

./configure   --enable-faad  --disable-ffmpeg_a && make -j4 && sudo make install
