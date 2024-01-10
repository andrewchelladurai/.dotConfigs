#
# For [Arch Linux] (https://archlinux.org/) Based Distros (KDE Specific)
# Preferred Distro : [Endeavour OS] (https://endeavouros.com/)
#

# Install necessary initial packages
sudo pacman -S stow git

# Download the dotFiles repo & switch to it
cd ~/ && \
git clone https://github.com/andrewchelladurai/.dotFiles.git && \
cd .dotFiles/

# Simulate the stowing of the packages and remove the conflicts
# When all good, restow without the simulation flag [-n]
stow -nvR home-dir/ config-dir/

# Reload the modifications or open a terminal to load the new .bashrc file
source ~/.bashrc

##
## File and Folder rearrangement
##

# Remove unnecessary folders
rm -rf ~/Documents/ ~/Downloads/ ~/Pictures/ ~/Videos/ ~/Music/

# Create preferred folder tree structure
mkdir -p ~/Documents/{Others,Media/{Audio,Video,Images},Projects,Tools/sdk/{android,flutter,dart,go}}

# Required only if the data partition is on a separate partition from OS mount-point
# Make links to actual content directories in a separate partition
ln -s /media/$(whoami)/Data/Documents/ Documents
ln -s /media/$(whoami)/Data/Downloads/ Downloads
ln -s /media/$(whoami)/Data/Volatile/ Volatile
ln -s /media/$(whoami)/Media/Music/ Music
ln -s /media/$(whoami)/Media/Pictures/ Pictures
ln -s /media/$(whoami)/Media/Movies/ Videos

##
## Remove & Install Packages
##

## Install Nvidia Drivers for current Laptop
sudo pacman -S nvidia-inst && \
nvidia-inst && \
sudo pacman -Rns nvidia-inst

# Remove all the unnecessary packages from the fresh-install
sudo pacman -Rns stoken meld haruna mpv ark file-roller firewalld glances nano-syntax-highlighting openconnect networkmanager-openconnect inxi plasma-disks kdeplasma-addons firefox vi kate hwinfo
# Remove EndeavourOS Packages
sudo pacman -Rns endeavouros-theming eos-plasma-sddm-config eos-qogir-icons eos-settings-plasma eos-apps-info eos-log-tool eos-quickstart reflector reflector-simple welcome eos-bash-shared eos-rankmirrors eos-update-notifier
# Remove package BUT NOT the depedencies
sudo pacman -Rdd v4l-utils qt5-tools

# Perform a system upgrade.
upgradesys

# Install necessary apps from main repo
sudo pacman -Syu git sqlite filelight krita digikam neovim elisa btop github-cli dragon

# Install necessary apps from AUR repo
yay -Syu google-chrome enpass-bin lazygit syncthing unified-remote-server

##
## Install necessary packages for Dev work.
##

# Android
# https://developer.android.com/studio
cd ~/Documents/Tools/ &&
tar -xvf android-studio*linux.tar.gz

# For Android AVD emulation performance, install KVM packages for Linux
# https://developer.android.com/studio/run/emulator-acceleration#vm-linux
sudo apt-get install qemu-system-x86 libvirt-daemon-system libvirt-clients bridge-utils && \
sudo adduser $(whoami) kvm

# Dart
# https://dart.dev/get-dart#install
sudo apt-get install apt-transport-https && \
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg && \
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list && \
sudo apt-get update && \
sudo apt-get install dart

# Flutter
# https://docs.flutter.dev/get-started/install/linux#linux-prerequisites
sudo apt-get install -y clang cmake git ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev

# GoLang
# https://go.dev/doc/install


##
## Update system Look & Feel
##

# Remove unnecessary wallpapers
cd /usr/share/wallpapers/ && \
sudo rm -rf ./Canopee/ ./Cascade/ ./Cluster/ ./BytheWater/ ./ColdRipple/ ./ColorfulCups/ ./DarkestHour/ ./Elarun/ ./EveningGlow/ ./FallenLeaf/ ./Flow/ ./FlyingKonqui/ ./Grey/ ./Honeywave/ ./IceCold/ ./Kay/ ./Kite/ ./Kokkini/ ./Opal/ ./PastelHills/ ./summer_1am/ ./Shell/ ./Volna/ && \
cd ~/

# Install Dracula & Nord theme - Konsole
# https://draculatheme.com/konsole
# https://www.nordtheme.com/ports/konsole
mkdir -p ~/.local/share/konsole/ && \
cd ~/.local/share/konsole && \
wget -c https://raw.githubusercontent.com/dracula/konsole/master/Dracula.colorscheme && \
wget -c https://raw.githubusercontent.com/nordtheme/konsole/develop/src/nord.colorscheme && \
cd ~/


# Install Dracula & Nord theme - .dircolors
# https://draculatheme.com/dircolors
# https://www.nordtheme.com/ports/dircolors
cd /home/andrew/.dotFiles/home-dir && \
wget -c https://raw.githubusercontent.com/dracula/dircolors/main/.dircolors && \
mv -v .dircolors .dircolors-dracula && \
wget -c https://raw.githubusercontent.com/nordtheme/dircolors/develop/src/dir_colors && \
mv -v dir_colors .dircolors-nord && \
cd ~/

# Install Dracula & Nord theme - xresources
# https://draculatheme.com/xresources
# https://www.nordtheme.com/ports/xresources
cd /home/andrew/.dotFiles/home-dir && \
wget -c https://raw.githubusercontent.com/dracula/xresources/master/Xresources && \
mv -v Xresources Xresources-dracula && \
wget -c https://raw.githubusercontent.com/nordtheme/xresources/develop/src/nord && \
mv -v nord Xresources-nord && \
cd ~/

# This is for a Wifi Card Bug on HP Pavilion Notebook AB219TX (N8L68PA#ACJ)
# have'nt observred WiFi drops for quite some time
# DO not think this is required any more, however keeping it for records sake.
# sudo sh -c 'echo "options rtl8723be fwlps=0 swlps=0 ips=0 ant_sel=1" >> /etc/modprobe.d/rtl8723be.conf'
