for file in "$1"; do mpv "$file"  --profile=omx --o="${file%.*}_1.mp4"; done
