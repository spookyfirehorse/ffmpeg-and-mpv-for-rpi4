## for file in *.mp4; do ffmpeg -i "$file"  -vcodec copy -acodec copy Videos/"${file%.mp4}.mp4"; done
#
### for file in *.mp4; do ffmpeg -i "$file"  -vcodec copy -acodec copy "${file%.mp4}_1.mp4"; done



#for file in *.mp4; do ffmpeg -hwaccel drm -i "$file"  -c:v h264_v4l2m2m -b:v 2M -pix_fmt yuv420p -c:a libfdk_aac  -b:a 96k -f mp4 /media/moon/convert/"${file%.mp4}.mp4"; done

#for file in *.mp4; do ffmpeg -hwaccel drm -i "$file"  -c:v h264_v4l2m2m -b:v 2M -pix_fmt yuv420p -c:a libfdk_aac  -b:a 96k -f mp4 /media/moon/convert/"${file%.mp4}.mp4"; done 


for file in "$1"; do ffmpeg -hwaccel drm -i "$file"  -c:v h264_v4l2m2m -b:v 1500k -pix_fmt yuv420p  -trellis 2 -cmp 2 -subcmp 2  -g 60  -c:a libfdk_aac  -b:a 96k -f mp4 "${file%.*}_1.mp4"; done


#find . -name *.avi -or -name *.mkv -or -name *.mp4 -or -name *flv -exec ffmpeg -hwaccel drm -i {}  -c:v h264_v4l2m2m -b:v 1500k -pix_fmt yuv420p  -trellis 2 -cmp 2 -subcmp 2  -g 60  -c:a libfdk_aac  -b:a 96k -f mp4 {}_1.mp4 \;

