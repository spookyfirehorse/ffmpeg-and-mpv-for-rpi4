sudo apt update && sudo apt install flatpak && \
git clone https://github.com/flathub/com.github.wwmm.pulseeffects.git && \
cd com.github.wwmm.pulseeffects/ && \
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
sudo flatpak install flathub com.github.wwmm.pulseeffects

