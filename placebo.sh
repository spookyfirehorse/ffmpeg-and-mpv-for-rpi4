git clone --recursive https://code.videolan.org/videolan/libplacebo

or

git clone https://github.com/haasn/libplacebo.git
cd libplacebo
git submodule update --init

# Hier den Prefix auf /usr setzen
meson setup build --prefix=/usr -Dvulkan=enabled -Dshaderc=enabled

# Falls das Verzeichnis 'build' schon existiert, nutze stattdessen:
# meson configure build --prefix=/usr

meson compile -C build

sudo meson install -C build


