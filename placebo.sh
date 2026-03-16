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


git clone https://github.com/haasn/libplacebo.git
cd libplacebo
git submodule update --init

# Lösche einen alten Build-Ordner, um sauber neu zu starten
rm -rf build

# Setup mit CPU-Optimierungen für Cortex-A72
CFLAGS="-mcpu=cortex-a72+crypto -Ofast -pipe -ftree-vectorize" \
CXXFLAGS="-mcpu=cortex-a72+crypto -Ofast -pipe -ftree-vectorize" \
meson setup build \
  --prefix=/usr \
  --buildtype=release \
  -Dvulkan=enabled \
  -Dshaderc=enabled \
  -Dglslang=enabled \
  -Db_lto=true \
  -Db_pie=true

# Kompilieren
meson compile -C build



git clone https://github.com/haasn/libplacebo.git
cd libplacebo
git submodule update --init

# Lösche einen alten Build-Ordner, um sauber neu zu starten
rm -rf build

# Setup mit CPU-Optimierungen für Cortex-A76
CFLAGS="-mcpu=cortex-a76+crypto -Ofast -pipe -ftree-vectorize" \
CXXFLAGS="-mcpu=cortex-a76+crypto -Ofast -pipe -ftree-vectorize" \
meson setup build \
  --prefix=/usr \
  --buildtype=release \
  -Dvulkan=enabled \
  -Dshaderc=enabled \
  -Dglslang=enabled \
  -Db_lto=true \
  -Db_pie=true

# Kompilieren
meson compile -C build

# Installieren
sudo meson install -C build


# Installieren
sudo meson install -C build
