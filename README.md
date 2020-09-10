hi everybody !!!

sorry for my bad english

compilations guide for:

ffmpeg-4.3.1 mpv-32-git and vlc-4.0-git for raspberry pi 3b, zero, 3b+

I think for all rpi modells but this 3 was tested

this tutorial is for stable io s raspian

testing is very similar

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

you can install pulseeffects also
but dont use to look a movie to much cpu mpv

pulseaudio-equalizer has less cpu

set in pcmanfm /usr/local/bin/cvlc as standard

usw.

if you like to install all of this

simply run     

##########################################################################

git clone https://github.com/spookyfirehorse/raspberry-pi-with-ffmpeg-all-codecs-mpv-rpi-.git && cd ~/raspberry-pi-with-ffmpeg-all-codecs-mpv-rpi- && \
chmod 777 *.sh   && ./boot.sh && ./config_files.sh && ./deb.sh && ./fdk-aac.sh &&  ./ffmpeg.sh && ./mpv.sh && ./vlc.sh && ./install-equalizer.sh && ./pulseeffects-install.sh &&  reboot
  
all codecs installed no need to buy the keys cpu usage 15 % ca 

spooky !!!!!
done

###################################################################################


STEP BY STEP



####################################### BOOT  ########################################################

disable all v3d
and add gpu_mem



sudo nano /boot/config.txt

gpu_mem=128

#dtoverlay=vc4-kms-v3d

#dtoverlay=vc4-fkms-v3d


#####################################  DOWNLOAD  #################################################


git clone https://github.com/spookyfirehorse/raspberry-pi-with-ffmpeg-all-codecs-mpv-rpi-.git && cd raspberry-pi-with-ffmpeg-all-codecs-mpv-rpi- && chmod 777 *.sh



########################################   INSTALL  STEP BY STEP #################################################################


./config_files.sh                         ## install conf files for mpv and  vlc and ffmpeg

./deb.sh                                    ### install depend files

./fdk-aac.sh                               ## install libfdk_aac

./ffmpeg.sh                               ### install ffmpeg

./mpv.sh                                  ### install mpv

./vlc.sh   ### install vlc   there is no qui for vlc usage cvlc example.mp4

./pulseeffects-install.sh     #### flatpak run com.github.wwmm.pulseeffects

./install-equalizer.sh   #####   pulseaudio-equalizer-gtk

reboot
#######################################################################################################################

mpv example.mp4

or you set in pcmanfm /usr/local/bin/cvlc as standard
and klick on the movie
close mpv with q
close cvlc strg + q
mpv volume 0 9
cvlc volume strg arrow up and down


you can install pulseeffects also
but dont use to look a movie to much cpu 


sudo ./pulseeffects-install.sh

normal start 

flatpak run com.github.wwmm.pulseeffects

start command in background

flatpak run com.github.wwmm.pulseeffects --gapplication-service &


less cpu install pulseaudio-equalizer-git

sudo ./install-equalizer.sh

start coomand 

pulseaudio-equalizer enable

or with gui
pulseaudio-equalizer-gtk

to set up





done

