git clone https://github.com/raspberrypi/libcamera.git
cd libcamera
meson setup build --buildtype=release  -Dprefix=/usr  -Dpipelines=rpi/vc4,rpi/pisp -Dipas=rpi/vc4,rpi/pisp -Dv4l2=true -Dgstreamer=enabled -Dtest=false -Dlc-compliance=disabled -Dcam=disabled -Dqcam=disabled -Ddocumentation=disabled -Dpycamera=enabled
ninja -C build install

git clone https://github.com/raspberrypi/rpicam-apps.git
meson setup build -Denable_libav=enabled -Denable_drm=enabled -Denable_egl=enabled -Denable_qt=enabled -Denable_opencv=disabled -Denable_tflite=disabled -Denable_hailo=disabled -Dprefix=/usr
meson compile -C build
sudo meson install -C build


git clone https://github.com/PipeWire/pipewire.git
meson setup build
meson configure build -Dprefix=/usr
meson compile -C build


systemctl --user stop pipewire.service \
                      pipewire.socket \
                      wireplumber.service \
                      pipewire-pulse.service \
                      pipewire-pulse.socket


sudo meson install -C build                      
