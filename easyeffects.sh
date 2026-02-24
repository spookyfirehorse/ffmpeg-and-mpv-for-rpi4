apt source easyeffects
CXXFLAGS="-march=goldmont -O3 -pipe" meson setup build --prefix /usr --buildtype release -Db_lto=true -Denable-rnnoise=false
sudo ninja -C _build install

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"


CXXFLAGS="-march=goldmont -O3 -pipe" meson setup build --prefix /usr --buildtype release -Db_lto=true




rm -rf build
CXXFLAGS="-march=goldmont -O3 -pipe" meson setup build --prefix /usr --buildtype release -Db_lto=true -Denable-rnnoise=false




meson setup builddir \
  -Doptimization=3 \
  -Db_lto=true \
  -Dcpp_args="-march=goldmont -mtune=goldmont" \
  -Dc_args="-march=goldmont -mtune=goldmont" \
  -Ddocs=disabled \
  -Dman=disabled \
  -Dtests=disabled \
  -Dinstalled_tests=disabled \
  -Dexamples=disabled \
  -Dffmpeg=disabled \
  -Dvulkan=enabled \
  -Dvolume=disabled \
  -Dsystemd-user-service=enabled \
  -Dbluez5-codec-lc3=enabled


ninja -C builddir -j4

sudo ninja -C builddir install

systemctl --user daemon-reload
systemctl --user restart pipewire.service pipewire-pulse.service


  
  




  meson setup builddir \
  -Doptimization=3 \
  -Db_lto=true \
  -Dcpp_args="-mcpu=cortex-a76 -pipe -ftree-vectorize" \
  -Dc_args="-mcpu=cortex-a76 -pipe -ftree-vectorize" \
  -Dffmpeg=enabled \
  -Dbluez5-codec-lc3=enabled \
  -Ddocs=disabled
  -Dvulkan=enabled




  ninja -C builddir -j4

sudo ninja -C builddir install

systemctl --user daemon-reload
systemctl --user restart pipewire.service pipewire-pulse.service


# In den EasyEffects Quellordner wechseln
meson setup builddir \
  --buildtype=release \
  -Doptimization=3 \
  -Db_lto=true \
  -Dcpp_args="-mcpu=cortex-a76 -pipe -ftree-vectorize -flto" \
  -Dc_args="-mcpu=cortex-a76 -pipe -ftree-vectorize -flto" \
  -Dcpp_link_args="-latomic -Wl,-O1" \
  -Dc_link_args="-latomic -Wl,-O1"  -Denable-rnnoise=false
  
CXXFLAGS="-mcpu=cortex-a76 -O3 -pipe -ftree-vectorize" \
meson setup build --prefix /usr --buildtype release \
-Db_lto=true \
-Denable-rnnoise=false
  

