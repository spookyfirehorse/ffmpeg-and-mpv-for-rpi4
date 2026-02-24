apt source easyeffects
CXXFLAGS="-march=goldmont -O3 -pipe" meson setup build --prefix /usr --buildtype release -Db_lto=true -Denable-rnnoise=false
sudo ninja -C _build install

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"


CXXFLAGS="-march=goldmont -O3 -pipe" meson setup build --prefix /usr --buildtype release -Db_lto=true




rm -rf build
CXXFLAGS="-march=goldmont -O3 -pipe" meson setup build --prefix /usr --buildtype release -Db_lto=true -Denable-rnnoise=false




# In den PipeWire-Quellordner wechseln
meson setup builddir \
  -Dprefix=/usr \
  -Doptimization=3 \
  -Dcpp_args="-march=goldmont -mtune=goldmont" \
  -Dc_args="-march=goldmont -mtune=goldmont" \
  -Dbluez5-codec-lc3=enabled \
  -Dsession-manager=wireplumber
