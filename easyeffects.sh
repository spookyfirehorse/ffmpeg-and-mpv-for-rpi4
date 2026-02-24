apt source easyeffects
meson _build --prefix=/usr
sudo ninja -C _build install

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"


CXXFLAGS="-march=goldmont -O3 -pipe" meson setup build --prefix /usr --buildtype release -Db_lto=true




rm -rf build
CXXFLAGS="-march=goldmont -O3 -pipe" meson setup build --prefix /usr --buildtype release -Db_lto=true -Denable-rnnoise=false
