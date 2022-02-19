apt source libdrm
cd libdrm
CFLAGS="-O2 -march=armv8-a+crc+simd -mtune=cortex-a72" CXXFLAGS="-O2 -march=armv8-a+crc+simd -mtune=cortex-a72" meson --prefix /usr -Dudev=true -Dvc4=true -Dintel=false -Dvmwgfx=false -Dradeon=false -Damdgpu=false -Dnouveau=false -Dfreedreno=false -Dinstall-test-programs=true build
ninja -C build
sudo ninja -C build install
