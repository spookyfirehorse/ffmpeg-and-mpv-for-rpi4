sudo apt install tclsh && \
cd ~/ffmpeg_sources/ && git clone --depth 1 https://github.com/Haivision/srt.git && cd srt && \
./configure && \
make -j4 && \
sudo make -j 4 install
