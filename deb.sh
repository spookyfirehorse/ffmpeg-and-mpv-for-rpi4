sudo apt update && sudo apt upgrade -y && sudo apt build-dep -y  ffmpeg && \
sudo apt install -y python3-pip bc swh-plugins meson && sudo pip3 install ninja libunistring-dev meson spirv-tools libplacebo* flatpak \
libxcb-shm0-dev libxcb-xv0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-composite0-dev libgles2-mesa-dev xcb-xkb*-dev libvlccore-dev libvlc-dev libdrm-dev\
libx11-xcb-dev libqt5*-dev qt5*-dev libqt5quick* qtquickcontrols2-5-dev && \
sudo apt build-dep -y mpv && sudo apt build-dep -y vlc && \

