./uninstall.sh all wm8960 modules


## all pi
```bash
git clone https://github.com/spookyfirehorse/wm8960-kernel-6.18.git
cd wm8960-kernel-6.18
```

```bash
sudo cp wm8960-kernel-6.18/wm8960-* /boot/firmware/overlays/
```

```bash
sudo nano /boot/firmware/config.txt
```

```bash
dtoverlay=vc4-kms-v3d,cma-512,noaudio
max_framebuffers=2
camera_auto_detect=0
dtoverlay=imx708
vc4.tv_norm=PAL
dtoverlay=i2s
dtparam=i2c_arm=on
dtoverlay=wm8960-fix
```

```bash
sudo systemctl disable  wm8960-soundcard.service
```

```bash
sudo nano /etc/modprobe.d/blacklist-wm8960.conf
```

```bash
blacklist snd_soc_wm8960_soundcard
blacklist snd_bcm2835
```

```bash
sudo nano /etc/modules
```

```bash
i2c-dev
snd-soc-wm8960
```




```bash
amixer -c 0 contents | grep -A 2 "Input Mixer"
```

# Die Boost-Switches aktivieren die Vorverstärkung

```bash
amixer -c 0 cset numid=50 on
amixer -c 0 cset numid=51 on
```
```bash
# Sicherstellen, dass die ADC (Analog-Digital-Wandler) Pegel oben sind
amixer -c 0 sset 'ADC PCM' 255
amixer -c 0 sset 'Capture' 63
```
