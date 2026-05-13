
optimum pi 3


export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig:$PKG_CONFIG_PATH
export TMPDIR=/home/spook/tmp

# Bereinigung des alten Verzeichnisses für sauberen Neuaufruf
rm -rf libcamera

# 1. libcamera (Treiber-Ebene für Pi 3) mit maximaler HW-Beschleunigung
git clone --depth 1 https://github.com/raspberrypi/libcamera.git &&   cd libcamera && \
meson setup build --buildtype=release -Dprefix=/usr \
-Dc_args="-mcpu=cortex-a53+crypto -mfpu=neon-fp-armv8 -mfloat-abi=hard -O3 -ftree-vectorize -ffast-math -funsafe-math-optimizations -pipe" \
-Dcpp_args="-mcpu=cortex-a53+crypto -mfpu=neon-fp-armv8 -mfloat-abi=hard -O3 -ftree-vectorize -ffast-math -funsafe-math-optimizations -pipe" \
-Dpipelines=rpi/vc4 -Dipas=rpi/vc4 \
-Dv4l2=enabled -Dgstreamer=enabled -Dtest=false -Dlc-compliance=disabled \
-Dcam=disabled -Dqcam=disabled -Ddocumentation=disabled -Dpycamera=enabled && \
ninja -C build -j 1 && \
sudo ninja -C build install && cd ..


export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig:$PKG_CONFIG_PATH
export TMPDIR=/home/spook/tmp

# Bereinigung falls der alte Build-Ordner blockiert
rm -rf rpicam-apps

# 2. rpicam-apps mit maximaler HW-Beschleunigung für Cortex-A53
git clone --depth 1 https://github.com/raspberrypi/rpicam-apps.git && cd rpicam-apps && \
meson setup build --buildtype=release -Dprefix=/usr \
-Dc_args="-mcpu=cortex-a53+crypto -mfpu=neon-fp-armv8 -mfloat-abi=hard -O3 -ftree-vectorize -ffast-math -funsafe-math-optimizations -pipe" \
-Dcpp_args="-mcpu=cortex-a53+crypto -mfpu=neon-fp-armv8 -mfloat-abi=hard -O3 -ftree-vectorize -ffast-math -funsafe-math-optimizations -pipe" \
-Denable_libav=enabled \
-Denable_drm=enabled \
-Denable_egl=enabled \
-Dpreview_default=drm \
-Denable_qt=disabled \
-Denable_opencv=disabled \
-Denable_tflite=disabled \
-Denable_hailo=disabled && \
meson compile -j 1 -C build && \
sudo meson install -C build && \
sudo ldconfig 



# =========================================================================
# 1. libcamera (Nutzt Pipeline rpi/vc4 für Pi 4)
# =========================================================================
export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH
export TMPDIR=/home/spook/tmp

# Bereinigung alter Verzeichnisse
rm -rf libcamera rpicam-apps

# Flag "-pipe" leitet Daten im RAM weiter statt temporäre Dateien zu schreiben
export OPT_FLAGS="-mcpu=cortex-a72+crypto -O3 -pipe -ftree-vectorize -flto -Wno-stringop-overflow -ffast-math -funsafe-math-optimizations"


git clone --depth 1 https://github.com/raspberrypi/libcamera.git &&  cd libcamera && \
meson setup build --buildtype=release -Dprefix=/usr \
-Dc_args="$OPT_FLAGS" \
-Dcpp_args="$OPT_FLAGS" \
-Dpipelines=rpi/vc4 -Dipas=rpi/vc4 \
-Dv4l2=enabled -Dgstreamer=enabled -Dtest=false -Dlc-compliance=disabled \
-Dcam=disabled -Dqcam=disabled -Ddocumentation=disabled -Dpycamera=enabled && \
ninja -C build -j 2 && \
sudo ninja -C build install && cd ..

# =========================================================================
# 2. rpicam-apps
# =========================================================================
export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH
export TMPDIR=/home/spook/tmp

# Bereinigung alter Verzeichnisse
rm -rf libcamera rpicam-apps

# Flag "-pipe" leitet Daten im RAM weiter statt temporäre Dateien zu schreiben
export OPT_FLAGS="-mcpu=cortex-a72+crypto -O3 -pipe -ftree-vectorize -flto -Wno-stringop-overflow -ffast-math -funsafe-math-optimizations"

git clone --depth 1 https://github.com/raspberrypi/rpicam-apps.git && cd rpicam-apps && \
meson setup build --buildtype=release -Dprefix=/usr \
-Dc_args="$OPT_FLAGS" \
-Dcpp_args="$OPT_FLAGS" \
-Denable_libav=enabled \
-Denable_drm=enabled \
-Denable_egl=enabled \
-Dpreview_default=drm \
-Denable_qt=disabled \
-Denable_opencv=disabled \
-Denable_tflite=disabled \
-Denable_hailo=disabled && \
meson compile -j 2 -C build && \
sudo meson install -C build && \
sudo ldconfig && cd ..



