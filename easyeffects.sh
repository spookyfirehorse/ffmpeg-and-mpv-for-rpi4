apt source easyeffects
meson _build --prefix=/usr
sudo ninja -C _build install

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"
