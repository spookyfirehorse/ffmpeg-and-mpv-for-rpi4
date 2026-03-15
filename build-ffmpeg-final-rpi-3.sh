# pi 3


# minimal

cat << 'EOF' > bin/build-ffmpeg-final-rpi-3.sh
#!/bin/bash
# FFmpeg Build-Skript für RPi5 (Ultra-Minimal / Vulkan & V4L2)

# Alte Quellen entfernen
sudo rm -rf ~/rpi-ffmpeg

# Repository klonen
git clone -b test/7.1.2/main --depth 1 https://github.com/jc-kynesim/rpi-ffmpeg.git ~/rpi-ffmpeg
cd ~/rpi-ffmpeg || exit

TMPDIR=/home/spook/tmp PKG_CONFIG_PATH="/usr/lib/arm-linux-gnueabihf/pkgconfig" \
./configure \
  --prefix=/usr \
  --libdir=/usr/lib/arm-linux-gnueabihf \
  --incdir=/usr/include/arm-linux-gnueabihf \
  --extra-version=ultra-pi3-armhf-jc-final-minimal \
  --arch=arm --target-os=linux --cpu=cortex-a53 \
  --fatal-warnings \
  --extra-cflags='-I/usr/include/libdrm -I/usr/include/gbm -mcpu=cortex-a53+crypto -O2 -pipe -ftree-vectorize -flto -Wno-stringop-overflow' \
  --extra-ldflags='-L/usr/lib/arm-linux-gnueabihf -lgbm -ldrm -latomic -Wl,-O2 -Wl,-rpath,/usr/lib/arm-linux-gnueabihf -Wl,--as-needed -flto -lstdc++' \
  --extra-libs='-L/usr/lib/arm-linux-gnueabihf -lpthread -Wl,-O2 -lm -lrt -ldl -lasound -lstdc++ -ljack -ldrm -lgbm -lgnutls -lgcrypt -lgpg-error -lxml2 -lfdk-aac -lFLAC -lopus -lass -lsoxr -lfreetype -lharfbuzz -lfribidi -lrubberband' \
  --disable-everything \
  --disable-hwaccels \
  --enable-ffmpeg --enable-ffprobe --enable-ffplay \
  --enable-shared --disable-static \
  --disable-debug --enable-stripping \
  --enable-hardcoded-tables --enable-pic --enable-pthreads \
  --enable-gpl --enable-version3 --enable-nonfree --enable-lto \
  --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale --enable-avdevice \
  --enable-libxml2 --enable-v4l2-m2m --enable-v4l2-request --enable-sand --enable-libdrm --enable-epoxy --enable-libudev \
  --enable-opengl --disable-vulkan --disable-libshaderc --disable-libplacebo \
  --enable-hwaccel=hevc_v4l2request --enable-sdl2 \
  --enable-libass --enable-libfdk-aac --enable-libopus  --enable-libsoxr --enable-libfreetype --enable-libharfbuzz --enable-libfribidi \
  --enable-ladspa --enable-lv2 --enable-librubberband --enable-alsa --disable-libpulse --enable-libjack \
  --enable-network --enable-gnutls --enable-gcrypt --enable-asm --enable-inline-asm --enable-neon --enable-runtime-cpudetect \
  --enable-protocol='pipe,file,fd,tcp,udp,rtp,rtsp,tls,rtmp,rtmpt,rtmpe,rtmps,ffrtmpcrypt,hls,dash,srt,unix,cache,crypto,concat' \
  --enable-bsf='mpeg2_metadata,hevc_metadata,h264_metadata,h264_mp4toannexb,hevc_mp4toannexb,mpeg4_unpack_bframes,aac_adtstoasc,opus_metadata,extract_extradata,null' \
  --enable-filter='unsand,buffersrc,buffersink,format,null,copy,firequalizer,realtime,latency,deinterlace_v4l2m2m,scale_v4l2m2m,format,scale,fps,setdar,settb,setpts,asettb,asetpts,concat,aresample,aformat,volume,loudnorm,equalizer,bass,treble,crystalizer,ladspa,lv2,rubberband,afade' \
  --enable-decoder='libfdk_aac,h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,mpeg1_v4l2m2m,mpeg2_v4l2m2m,mpeg4_v4l2m2m,hevc_v4l2request,opus,aac,ac3,eac3,mpegaudio,flac,vorbis,ass,srt,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo,adpcm_ms,adpcm_ima_wav' \
  --enable-encoder='h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,libfdk_aac,aac,libopus,flac,ass,srt,pcm_s16le,pcm_s24le,pcm_s32le,rawvideo' \
  --enable-demuxer='id3v1,id3v2,matroska,matroska_audio,mpegts,mov,flac,wav,ogg,aac,avi,h264,hevc,rtsp,sdp,rtp,rtmp,hls,dash,mjpeg,image2,concat,rawvideo' \
  --enable-muxer='yuv4mpegpipe,adts,matroska,matroska_audio,mp4,mov,avi,flac,wav,opus,ogg,rtp,rtmp,rtsp,hls,dash,mpegts,image2,rawvideo,null,webm_dash_manifest' \
  --enable-parser='dca,ac3,eac3,h264,hevc,mjpeg,mpegvideo,mpeg4video,mpegaudio,aac,opus,flac,vorbis,h263' \
  --enable-indev='v4l2,alsa,jack,kmsgrab,v4l2_m2m,pipe,lavfi' \
  --enable-outdev='sdl2,v4l2,alsa,jack,drm,kmsgrab,pipe,v4l2_m2m' \
  --enable-xlib \
    --disable-cuda --disable-nvenc --disable-cuda-llvm --disable-nvdec --disable-cuvid --disable-libnpp --disable-ffnvcodec --disable-cuda-nvcc --disable-libnpp --disable-ffnvcodec \
  --disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages \
  --disable-sdl2 --disable-sndio --disable-indev=pulse --disable-outdev=pulse,xv 

vulkan

./configure \
  --prefix=/usr \
  --libdir=/usr/lib/arm-linux-gnueabihf \
  --incdir=/usr/include/arm-linux-gnueabihf \
  --extra-version=ultra-pi3-armhf-jc-final-minimal \
  --arch=arm --target-os=linux --cpu=cortex-a53 \
 --extra-cflags='-I/usr/include/libdrm -I/usr/include/gbm -I/usr/include/vulkan -mcpu=cortex-a53+crypto -Ofast -pipe -ftree-vectorize -flto -fno-semantic-interposition -falign-functions=32 -Wno-stringop-overflow' \
 --extra-ldflags='-L/usr/lib/aarch64-linux-gnu -lgbm -ldrm -latomic -Wl,-O2 -Ofast -flto -Wl,-rpath,/usr/lib/aarch64-linux-gnu -Wl,--as-needed' \
 --extra-libs='-Wl,--start-group -lshaderc_combined -lglslang -lMachineIndependent -lGenericCodeGen -lSPIRV -lSPIRV-Tools-opt -lSPIRV-Tools -Wl,--end-group -lplacebo -lvulkan -lgbm -ldrm -lepoxy -lEGL -lGLESv2 -lfftw3 -lgnutls -lxml2 -lfdk-aac -lmp3lame -lFLAC -lopus -lass -lsoxr -lz -lsrt -ldvdnav -lstdc++ -lpthread -lm -lrt -ldl' \
--disable-everything --disable-hwaccels --enable-libdvdnav --enable-libdvdread \
 --enable-ffmpeg --enable-ffprobe --enable-ffplay --enable-sdl2 --enable-shared --disable-static --disable-debug --enable-stripping --enable-hardcoded-tables --enable-pic --enable-pthreads --enable-gpl --enable-version3 --enable-nonfree --enable-lto --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale --enable-avdevice \
 --enable-libxml2 --enable-v4l2-m2m --enable-v4l2-request --enable-sand --enable-libdrm --enable-epoxy --enable-libudev --enable-vout-egl --enable-vout-drm --enable-opengl --enable-vulkan --enable-libshaderc --enable-libplacebo \
 --enable-hwaccel=hevc_v4l2request --enable-hwaccel=av1_vulkan --enable-hwaccel=h264_vulkan --enable-hwaccel=hevc_vulkan \
 --enable-libass --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libsrt --enable-libsoxr --enable-libfreetype --enable-libharfbuzz --enable-libfribidi --enable-ladspa --enable-lv2 --enable-librubberband --enable-alsa --disable-libpulse --enable-libjack --enable-network --enable-gnutls --enable-gcrypt --enable-asm --enable-inline-asm --enable-neon --enable-runtime-cpudetect \
 --enable-protocol='pipe,file,fd,tcp,udp,rtp,rtsp,http,https,tls,rtmp,rtmpt,rtmpe,rtmps,ffrtmpcrypt,hls,dash,libsrt,unix,cache,crypto,concat' \
 --enable-bsf='aac_adtstoasc,av1_frame_merge,av1_frame_split,av1_metadata,dca_core,extract_extradata,h264_metadata,h264_mp4toannexb,hevc_metadata,hevc_mp4toannexb,mjpeg2jpeg,mpeg2_metadata,mpeg4_unpack_bframes,null,opus_metadata,pcm_rechunk,truehd_core,vp9_metadata,vp9_superframe' \
--enable-filter='unsand,buffersrc,buffersink,format,null,copy,firequalizer,realtime,latency,colorspace,colormatrix,colorlevels,scale_v4l2m2m,deinterlace_v4l2m2m,vulkan,vulkan_filter,libplacebo,hwmap,hwupload,hwdownload,scale_vulkan,flip_vulkan,hflip_vulkan,vflip_vulkan,transpose_vulkan,chromaber_vulkan,color_vulkan,gblur_vulkan,nlmeans_vulkan,overlay_vulkan,xfade_vulkan,bwdif_vulkan,scale,fps,setdar,settb,setpts,asettb,asetpts,concat,aresample,aformat,volume,loudnorm,equalizer,bass,treble,crystalizer,ladspa,lv2,rubberband,afifo,anull,asplit,amix,anequalizer,surround,stereowiden,overlay,drawtext,pad,pan,yadif,crop,aevalsrc,smptebars,testsrc,testsrc2' \
 --enable-decoder='prores,prores_raw,wavpack,wrapped_avframe,libfdk_aac,h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,mpeg1_v4l2m2m,mpeg2_v4l2m2m,mpeg4_v4l2m2m,vc1_v4l2m2m,vp8_v4l2m2m,vp9_v4l2m2m,hevc_v4l2request,h264,hevc,mpeg1video,mpeg2video,mpeg4,mjpeg,h263,h263p,opus,aac,ac3,eac3,mp3,mpegaudio,flac,vorbis,ass,srt,pcm_bluray,pcm_dvd,pcm_f16le,pcm_f24le,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_lxf,pcm_mulaw,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s64be,pcm_s64le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,h263dsp,mpegvideodec,qpeldsp,mov_text,dvdsub,dvbsub,rawvideo,adpcm_ms,adpcm_ima_wav,adpcm_ima_qt' \
 --enable-encoder='prores,prores_aw,prores_ks,h264_vulkan,hevc_vulkan,wrapped_avframe,libfdk_aac,h263_v4l2m2m,h264_v4l2m2m,hevc_v4l2m2m,mpeg4_v4l2m2m,vp8_v4l2m2m,libmp3lame,wavpack,libopus,flac,ass,srt,pcm_bluray,pcm_dvd,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s64be,pcm_s64le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,mov_text,rawvideo' \
 --enable-demuxer='wavpack,aac,ac3,ac4,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,aiff,asf,asf_o,av1,avi,caf,concat,dash,dts,dtshd,dv,dvbsub,dvdvideo,eac3,flac,flv,h264,hevc,hls,image2,image2pipe,image_bmp_pipe,image_jpeg_pipe,image_png_pipe,image_webp_pipe,matroska,mjpeg,mov,mp3,mpegps,mpegts,mpegvideo,null,ogg,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,rawvideo,rm,rtp,rtsp,sdp,srt,truehd,vobsub,wav,webm_dash_manifest,yuv4mpegpipe' \
 --enable-muxer='wavpack,aac,ac3,adts,adx,aiff,amr,apng,asf,ass,av1,avi,caf,dash,dts,dv,dvd,eac3,f4v,flac,flv,g722,gif,h264,hevc,hls,image2,ismv,matroska,matroska_audio,mjpeg,mkvtimestamp_v2,mov,mp2,mp3,mp4,mpeg1system,mpeg1vcd,mpeg1video,mpeg2dvd,mpeg2svcd,mpeg2video,mpeg2vob,mpegts,mpjpeg,null,ogg,oma,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,psp,rawvideo,rtmp,rtmpt,rtp,rtp_mpegts,rtsp,sap,segment,smoothstreaming,spdif,srt,swf,tee,truehd,tta,vc1,wav,webm,webm_chunk,webm_dash_manifest,webp,webvtt,yuv4mpegpipe' \
 --enable-parser='dvd_nav,webp,vp8,vp9,vc1,aac_latm,aac,ac3,eac3,dca,mpegaudio,mp3,vorbis,opus,flac,h264,hevc,mpegvideo,mpeg4video,mjpeg,h263,mpeg1video,av1' \
 --enable-indev='v4l2,alsa,jack,kmsgrab,lavfi' \
 --enable-outdev='sdl2,v4l2,alsa,opengl,vout_drm,vout_egl' \
 --enable-xlib --disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages  --disable-sndio \
  --disable-cuda --disable-nvenc --disable-cuda-llvm --disable-nvdec --disable-cuvid --disable-libnpp --disable-ffnvcodec --disable-cuda-nvcc --disable-libnpp --disable-ffnvcodec \
  --disable-libx264 --disable-libx265 --disable-omx --disable-omx-rpi --disable-mmal --disable-avx --disable-avx2 --disable-avx512 --disable-fma3 --disable-fma4 --disable-xop --disable-fma4  --disable-vdpau --disable-vaapi \
 --disable-indev=pulse --disable-outdev=pulse && make -j2
sudo make install

# Strippen für minimale Dateigröße
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavcode*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavdevic*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavfilte*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavforma*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libavutil*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libpostpro*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libswresampl*
sudo strip --strip-unneeded /usr/lib/aarch64-linux-gnu/libswscale*

echo "Fertig! Installierte Größe:"
ls -l /usr/lib/arm-linux-gnueabihf/libav* /usr/lib/arm-linux-gnueabihf/libsw* /usr/lib/arm-linux-gnueabihf/libpostproc* | awk '{sum += $5} END {print sum / 1024 / 1024 " MB"}'
EOF

chmod +x bin/build-ffmpeg-final-rpi-3.sh
