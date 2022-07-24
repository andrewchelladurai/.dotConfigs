#
# For Arch Based Distros
# Preferred Distro : Endeavour OS (BSPWM Community Edition)
# https://github.com/EndeavourOS-Community-Editions/bspwm
#

#
# Pre-requisites
#

# Convenient aliases for frequent commands are now a part of the .bash_aliases file.
# Download and source the .bash_aliases file from the repo before proceeding. 
# Some steps below require custom aliases to be present for execution.

# Move bash files to config dir and link to it from the home dir
mkdir -p ~/.config/bash/
mv -v ~/.bashrc ~/.config/bash/.bashrc
mv -v ./bash_aliases ./bash_profile ~/.config/bash/
ln -s ~/.config/bash/.bashrc ~/.bashrc
ln -s ~/.config/bash/.bash_profile ~/.bash_profile

# Now reload the  modifications
source ~/.bashrc

# Disable Screen lock on lid-close, this is because I want to handle it myself
# and most times, the laptop will be connected to an external monitor with the lid closed
sudo vi /etc/systemd/logind.conf
  HandleLidSwitch=ignore
  HandleLidSwitchExternalPower=ignore
  HandleLidSwitchDocked=ignore
systemctl restart systemd-logind.service

# Make links to actual content directories in a separate partition
# This is only required if the data partition is separate from the actual home mount
# rmdir Documents/ Downloads/ Pictures/ Videos/ Music/
# ln -s /media/$(whoami)/Data/Documents/ Documents
# ln -s /media/$(whoami)/Data/Downloads/ Downloads
# ln -s /media/$(whoami)/Data/Volatile/ Volatile
# ln -s /media/$(whoami)/Media/Music/ Music
# ln -s /media/$(whoami)/Media/Pictures/ Pictures
# ln -s /media/$(whoami)/Media/Movies/ Videos

# Remove all the unnecesary packages from the fresh-install
sudo pacman -Rs thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman htop firewalld firefox vi eos-quickstart welcome eos-log-tool eos-apps-info meld reflector reflector-simple stoken openconnect xed mpv eos-update-notifier eos-rankmirrors file-roller endeavouros-xfce4-terminal-colors endeavouros-theming lxappearance-gtk3 yad-eos eos-qogir-icons xterm nitrogen
sudo pacman -Rsd --nodeps v4l-utils

# Now do a dist-upgrade
upgradesys

#
# Install necessary apps
#

# Install Bluetooth Stack and start the service at each reboot and also immediately
sudo pacman -S --needed bluez bluez-utils blueman && sudo systemctl enable --now bluetooth

# Install Nvidia Drivers, this will replace the open-source nouveau drivers.
# A reboot is needed after the reinstall
sudo pacman -S nvidia-installer-dkms && sudo nvidia-installer-dkms && sudo systemctl reboot

# Install commonly used applications from the main repo
sudo pacman -S neovim sqlite bashtop wireguard-tools jdk-openjdk scrcpy android-udev

# Install commonly used applications from the AUR repo
yay -S google-chrome enpass-bin onlyoffice-bin nordvpn-bin android-studio 

#
# Other common tasks
#

# Mask unnecessary desktop files from below location to declutter rofi / application launchers
ls -1trh /usr/share/applications/*desktop

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