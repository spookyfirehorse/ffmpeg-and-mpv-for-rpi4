apt source libdrm && sudo apt install libatomic-ops-dev libcunit1-dev
cd libdrm
CFLAGS="-O2 -march=armv8-a+crc+simd -mtune=cortex-a72" CXXFLAGS="-O2 -march=armv8-a+crc+simd -mtune=cortex-a72" meson --prefix /usr -Dudev=true -Dvc4=true -Dintel=false -Dvmwgfx=false -Dradeon=false -Damdgpu=false -Dnouveau=false -Dfreedreno=false -Dinstall-test-programs=true build
ninja -C build
sudo ninja -C build install




git clone https://dri.freedesktop.org/libdrm/libdrm-2.4.109.tar.xz

tar -xf libdrm-2.4.109.tar.xz


cd libdrm

meson --prefix /usr -Dudev=true -Dvc4=true -Dintel=false -Dvmwgfx=false -Dradeon=false -Damdgpu=false -Dnouveau=false -Dfreedreno=false -Dinstall-test-programs=true build

