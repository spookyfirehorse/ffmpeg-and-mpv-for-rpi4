## for file in *.mp4; do ffmpeg -i "$file"  -vcodec copy -acodec copy Videos/"${file%.mp4}.mp4"; done
#
### for file in *.mp4; do ffmpeg -i "$file"  -vcodec copy -acodec copy "${file%.mp4}_1.mp4"; done


# for file in *.jpg; do ffmpeg  -i "$file" -vf scale=320:240,setdar=4:3  /media/moon/convert/"${file%.jpg}.jpg"; done


for file in "$1"; do  ffmpeg  -i "$file" -s 320x240 "${file%.*}_1.jpg"; done


# for file in *.png; do ffmpeg  -i "$file" -s 320x240  /home/tina/convert/"${file%.png}_1.png"; done
##  for file in "$1"; do
