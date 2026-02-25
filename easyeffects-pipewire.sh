apt source easyeffects
CXXFLAGS="-march=goldmont -O3 -pipe" meson setup build --prefix /usr --buildtype release -Db_lto=true -Denable-rnnoise=false
sudo ninja -C _build install

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"


CXXFLAGS="-march=goldmont -O3 -pipe" meson setup build --prefix /usr --buildtype release -Db_lto=true




systemctl --user daemon-reload
systemctl --user restart pipewire.service pipewire-pulse.service wireplumber.service



sudo apt install libspa-0.2-bluetooth libspa-0.2-jack pipewire-audio-client-libraries lsp-plugins-lv2 calf-plugins

meson setup builddir --prefix=/usr \
  --buildtype=release \
  -Doptimization=2 \
  -Db_lto=true \
  -Dcpp_args="-march=skylake -mtune=skylake -pipe" \
  -Dc_args="-march=skylake -mtune=skylake -pipe" \
  -Ddocs=disabled \
  -Dman=disabled \
  -Dtests=disabled \
  -Dinstalled_tests=disabled \
  -Dexamples=disabled \
  -Dffmpeg=disabled \
  -Dvulkan=enabled \
  -Dvolume=enabled \
  -Dsystemd-user-service=enabled \
  -Dbluez5-codec-lc3=enabled



meson setup builddir --prefix=/usr \
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


  
  


meson setup builddir --prefix=/usr \
  --buildtype=release \
  -Db_lto=false \
  -Dcpp_args="-march=armv8-a+crc -mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -pipe -ftree-vectorize" \
  -Dc_args="-march=armv8-a+crc -mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -pipe -ftree-vectorize" \
  -Dffmpeg=enabled \
  -Dpw-cat-ffmpeg=enabled \
  -Dvulkan=enabled \
  -Dbluez5-codec-lc3=enabled \
  -Ddocs=disabled \
  -Dman=disabled \
  -Dtests=disabled \
  -Dsystemd-user-service=enabled


# Vorher altes Build-Verzeichnis löschen!
rm -rf builddir

meson setup builddir --prefix=/usr \
  --buildtype=release \
  -Doptimization=2 \
  -Db_lto=true \
  -Dcpp_args="-march=skylake -mtune=skylake -pipe -ftree-vectorize" \
  -Dc_args="-march=skylake -mtune=skylake -pipe -ftree-vectorize" \
  -Dcpp_link_args="-Wl,-O1 -Wl,--as-needed" \
  -Dc_link_args="-Wl,-O1 -Wl,--as-needed" \
  -Denable-rnnoise=false



  # Alten Ordner löschen, um Fehler zu vermeiden
rm -rf builddir

meson setup builddir --prefix=/usr \
  --buildtype=release \
  -Doptimization=3 \
  -Db_lto=true \
  -Dcpp_args="-mcpu=cortex-a76 -pipe -ftree-vectorize" \
  -Dc_args="-mcpu=cortex-a76 -pipe -ftree-vectorize" \
  -Dffmpeg=enabled \
  -Dpw-cat-ffmpeg=enabled \
  -Dbluez5-codec-lc3=enabled \
  -Dvulkan=enabled \
  -Ddocs=disabled \
  -Dman=disabled \
  -Dtests=disabled \
  -Dsystemd-user-service=enabled



meson setup builddir --prefix=/usr \
  --buildtype=release \
  -Doptimization=3 \
  -Db_lto=true \
  -Dcpp_args="-mcpu=cortex-a72 -pipe -ftree-vectorize" \
  -Dc_args="-mcpu=cortex-a72 -pipe -ftree-vectorize" \
  -Dffmpeg=enabled \
  -Dpw-cat-ffmpeg=enabled \
  -Dbluez5-codec-lc3=enabled \
  -Dvulkan=enabled \
  -Ddocs=disabled \
  -Dman=disabled \
  -Dtests=disabled \
  -Dsystemd-user-service=enabled
  ninja -C builddir -j4

sudo ninja -C builddir install

systemctl --user daemon-reload
systemctl --user restart pipewire.service pipewire-pulse.service


# In den EasyEffects Quellordner wechseln
meson setup builddir --prefix=/usr \
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
  
# In den EasyEffects Quellordner wechseln
meson setup builddir --prefix /usr  \
  --buildtype=release \
  -Doptimization=3 \
  -Db_lto=true \
  -Dcpp_args="-mcpu=cortex-a72 -pipe -ftree-vectorize -flto" \
  -Dc_args="-mcpu=cortex-a72 -pipe -ftree-vectorize -flto" \
  -Dcpp_link_args="-latomic -Wl,-O1" \
  -Dc_link_args="-latomic -Wl,-O1"  -Denable-rnnoise=false
  
ninja -C builddir -j4

sudo ninja -C builddir install


# Für Raspberry Pi 3 (Cortex-A53)
# Vorher den alten Cache löschen!
rm -rf builddir

meson setup builddir   --buildtype=release   -Doptimization=3   -Db_lto=true   -Dcpp_args="-march=armv8-a+crc -mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -pipe -ftree-vectorize"   -Dc_args="-march=armv8-a+crc -mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -pipe -ftree-vectorize"   -Dffmpeg=enabled   -Dpw-cat-ffmpeg=enabled   -Dvulkan=enabled   -Dbluez5-codec-lc3=enabled   -Ddocs=disabled   -Dman=disabled   -Dtests=disabled   -Dsystemd-user-service=enabled --prefix /usr



  ninja -C builddir -j4

sudo nano /etc/pipewire/pipewire.conf.d/10-low-latency.conf 


context.properties = {
    default.clock.rate          = 48000
    default.clock.quantum       = 512
    default.clock.min-quantum   = 512
    default.clock.max-quantum   = 512
    default.clock.allowed-rates = [ 44100 48000 88200 96000 ]
    mem.allow-mlock             = true
}

stream.properties = {
    audio.format = "F32LE"
    resample.quality = 4
}

context.modules = [
    { name = libpipewire-module-rt
        args = {
            nice.level   = -20
            rt.prio      = 95
            uclimit      = true
            rt.time.soft = 200000
            rt.time.hard = 200000
        }
    }
]

