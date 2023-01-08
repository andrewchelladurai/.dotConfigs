#
# Steps used to setup Endeavour OS (BSPWM Community Edition)
# https://github.com/EndeavourOS-Community-Editions/bspwm
#

# Download the dotFiles repo
cd ~/
git clone https://github.com/andrewchelladurai/.dotConfigs.git
cd ~/.dotConfigs/

# Install stow and simulate restoring the config files to ensure no conflicts exist.
# If any folders exist then remove them and retry stow simulation.
# When the simulation is sucessfull, do it without the flag.
sudo pacman -Syu stow
stow -nvR home-dir/ config-dir/

# Reload the modifications or open a terminal to load the new .bashrc file
source ~/.bashrc

# Disable Screen lock on lid-close.
sudo vi /etc/systemd/logind.conf
  HandleLidSwitch=ignore
  HandleLidSwitchExternalPower=ignore
  HandleLidSwitchDocked=ignore
sudo systemctl restart systemd-logind.service

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

cd ~/.local/share/fonts/
wget -c https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf
wget -c https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf
wget -c https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf

# Do a dist-upgrade to get recent core updates
upgradesys

# Install Bluetooth Stack and start the service at each reboot and also immediately
sudo pacman -Syu --needed bluez bluez-utils blueman && sudo systemctl enable --now bluetooth

# Install Nvidia Drivers, this will replace the open-source nouveau drivers.
# A reboot is needed after the reinstall
sudo pacman -Syu nvidia-inst && nvidia-inst && sudo systemctl reboot

# Install commonly used applications from the main repo
sudo pacman -Syu neovim sqlite wireguard-tools jdk-openjdk scrcpy onboard ncdu btop termdown kitty github-cli lazygit
# No depdendencies since the dependent JDK version may not be the latest.
sudo pacman -Syu --nodeps intellij-idea-community-edition
# Install commonly used applications from the AUR repo
yay -Syu google-chrome enpass-bin onlyoffice-bin android-studio rdfind gtypist typiskt cli-visualizer

# Remove all the unnecesary packages from the fresh-install
sudo pacman -Rs thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman htop firewalld firefox vi eos-quickstart welcome eos-log-tool eos-apps-info meld reflector reflector-simple stoken openconnect xed mpv eos-update-notifier eos-rankmirrors file-roller endeavouros-xfce4-terminal-colors endeavouros-theming lxappearance-gtk3 yad-eos eos-qogir-icons xterm nitrogen xfce4-terminal networkmanager-openconnect
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

# For Android AVD emulation performance
# Installl KVM packages for Linux
# https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux
# TO-DO
# sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
# sudo adduser $(whoami) kvm
#
