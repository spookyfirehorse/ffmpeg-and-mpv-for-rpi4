cd ~/ffmpeg_sources && git clone https://github.com/AviSynth/AviSynthPlus.git &&  cd ~/ffmpeg_sources/AviSynthPlus \
&& mkdir cd ~/ffmpeg_sources/AviSynthPlus/avisynth-build && cmake ../ -DHEADERS_ONLY:bool=on  && sudo make install 
