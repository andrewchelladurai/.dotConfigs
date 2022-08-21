#
# Steps used to setup Endeavour OS (BSPWM Community Edition)
# https://github.com/EndeavourOS-Community-Editions/bspwm
#

# Download the dotFiles repo 
mkdir ~/.dotConfigs/ && cd ~/.dotConfigs/
git clone https://github.com/andrewchelladurai/.dotConfigs.git
stow -nvR home-dir/ config-dir/
# Validate that the links are all present
ls -la ~/ ~/.config/ | grep -i '^l' | tr -s " " | cut -d" " -f 9-11

# Reload the modifications or open a terminal to load the new .bashrc file
source ~/.bashrc

# Disable Screen lock on lid-close.
sudo vi /etc/systemd/logind.conf
  HandleLidSwitch=ignore
  HandleLidSwitchExternalPower=ignore
  HandleLidSwitchDocked=ignore
systemctl restart systemd-logind.service

# Make links to actual content directories in a separate partition
# Required only if the data partition is on a separate partition from OS mount-point
rmdir ~/Documents/ ~/Downloads/ ~/Pictures/ ~/Videos/ ~/Music/
ln -s /media/$(whoami)/Data/Documents/ Documents
ln -s /media/$(whoami)/Data/Downloads/ Downloads
ln -s /media/$(whoami)/Data/Volatile/ Volatile
ln -s /media/$(whoami)/Media/Music/ Music
ln -s /media/$(whoami)/Media/Pictures/ Pictures
ln -s /media/$(whoami)/Media/Movies/ Videos

# Download required Nerd fonts :
# https://www.nerdfonts.com/font-downloads
# https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
# and place it in ~/.local/share/fonts/
# 
# DejaVuSansMono
# FiraCode
# JetBrainsMono
# Noto
# SourceCodePro
#
# Remove the unecessary font families from the extracts
find . -type f -iname \*Windows*ttf -delete
find . -type f -iname \*Mono.ttf -delete
find . -type f -iname \*Semi*ttf -delete
find . -type f -iname \*Extra*ttf -delete
find . -type f -iname \*Black*ttf -delete
find . -type f -iname \*Light*ttf -delete
find . -type f -iname \*Medium*ttf -delete
find . -type f -iname \*Thin*ttf -delete
find . -type f -iname \*otf -delete
find . -type f -iname \*Retina*ttf -delete
find . -type f -iname \*Ext*ttf -delete
rm Noto*Emoji*ttf Noto*Condensed*ttf Noto*Display*ttf

# Do a dist-upgrade to get recent core updates
upgradesys

# Install Bluetooth Stack and start the service at each reboot and also immediately
sudo pacman -S --needed bluez bluez-utils blueman && sudo systemctl enable --now bluetooth

# Install Nvidia Drivers, this will replace the open-source nouveau drivers.
# A reboot is needed after the reinstall
sudo pacman -S nvidia-installer-dkms && sudo nvidia-installer-dkms && sudo systemctl reboot

# Install commonly used applications from the main repo
sudo pacman -S neovim sqlite wireguard-tools jdk-openjdk scrcpy android-udev onboard ncdu btop nnn termdown calc alacritty kitty github-cli lazygit
# No depdendencies since the dependent JDK version may not be the latest.
sudo pacman -S --nodeps intellij-idea-community-edition 
# Install commonly used applications from the AUR repo
yay -S google-chrome enpass-bin onlyoffice-bin nordvpn-bin android-studio rdfind activitywatch-bin gtypist typiskt cli-visualizer

# Remove all the unnecesary packages from the fresh-install
sudo pacman -Rs thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman htop firewalld firefox vi eos-quickstart welcome eos-log-tool eos-apps-info meld reflector reflector-simple stoken openconnect xed mpv eos-update-notifier eos-rankmirrors file-roller endeavouros-xfce4-terminal-colors endeavouros-theming lxappearance-gtk3 yad-eos eos-qogir-icons xterm nitrogen xfce4-terminal
sudo pacman -Rsd --nodeps v4l-utils

# Now do a dist-upgrade again to clear unwanted dependencies
upgradesys

#
# Other common tasks
#

# Mask unnecessary desktop files from below location to declutter rofi / application launchers
ls -1trh /usr/share/applications/*desktop

# Theme ROFI using https://github.com/adi1090x/rofi

# Theme Polybar using https://github.com/adi1090x/polybar-themes

# This is for a Wifi Card Bug on HP Pavilion Notebook AB219TX (N8L68PA#ACJ)
# Do not think this is required any more, however keeping it for records sake.
# sudo sh -c 'echo "options rtl8723be fwlps=0 swlps=0 ips=0 ant_sel=1" >> /etc/modprobe.d/rtl8723be.conf'

# For Android AVD emulation performance
# Installl KVM packages for Linux
# https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux
# TO-DO
# sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
# sudo adduser $(whoami) kvm

# For bug that shows the extra user on the login screen
# sudo usermod -u 999 libvirt-qemu

# For manually mounting HDD's by label - Use this in the user profile if needed
# Was required for ElementaryOs Luna because of a bug
# Not sure if still needed, keeping for recod's sake
# udisksctl mount -b /dev/disk/by-label/Data
