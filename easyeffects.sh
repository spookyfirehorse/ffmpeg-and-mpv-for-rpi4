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
  -Dvulkan=disabled \


ninja -C builddir -j4

sudo ninja -C builddir install

systemctl --user daemon-reload
systemctl --user restart pipewire.service pipewire-pulse.service


  
  -Dvolume=disabled \
  -Dsystemd-user-service=enabled \
  -Dbluez5-codec-lc3=enabled

