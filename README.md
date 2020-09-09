hi everybody !!!

compilations guide for:

ffmpeg mpv and vlc for raspberry pi 3b, zero, 3b+

its very easy !!!

you can play movies without overheating

CPU runtime 15 %

you can stream cammera output and audio over ssh

ssh moon ffmpeg -fflags nobuffer  -hide_banner -y   -f alsa  -ac 1 -i hw:CARD=Device,DEV=0      -f v4l2  -re -i /dev/video0    -c:v h264_omx -profile:v high  -level 4  -pix_fmt yuv420p -g 45 -bf 2 -trellis 2 -cmp 2 -subcmp 2  -b:v 1200k  -c:a libfdk_aac  -profile:a aac_he -vbr 2 -movflags +faststart    -f  mpegts  - | mpv --profile=low-latency   -

you can find your alsa device by  aplay -L  and rename hw:CARD

encode and decode movies and music

convert movies and music in other formats

x11grab for recording desktop

ffmpeg -y -re -threads 4 -hide_banner -f pulse -ac 2 -i default -f x11grab -framerate 25 -video_size 1920x1080 -i :0.0+0,0 -c:v hevc_nvenc  -pix_fmt yuv420p -qp 0 -preset fast -b:v 1200k -c:a libfdk_aac -b:a 128k  -ar 48000  -af aresample=async=1:min_hard_comp=0.100000:first_pts=0  testvideo.mkv

download a movie 

ffmpeg -i http://url -c:v copy -c:a copy output.mp4

usw.


sudo raspi-config
or
sudo nano /boot/config.txt

and disable all v3d
and add gpu_mem

gpu_mem=128

#dtoverlay=vc4-kms-v3d

#dtoverlay=vc4-fkms-v3d

#####################################
git clone --depth 1 https://github.com/mstorsjo/fdk-aac

cd raspberry-pi-with-ffmpeg-all-codecs-mpv-rpi-/

config-files

./config_files.sh

deb files

./deb.sh

libfdkaac

./libfdkaac.sh

ffmpeg

./ffmpeg.sh

mpv

./mpv.sh


vlc

./vlc.sh


done

