#
# For Ubuntu Based Distros (KDE Specific)
# Preferred Distro : KDE Neon : https://neon.kde.org/
#

# Install necessary initial packages
sudo apt install stow git

# Download the dotFiles repo & switch to it
git clone https://github.com/andrewchelladurai/.dotConfigs-KDE-Neon.git
cd .dotConfigs-KDE-Neon/

# Simulate the stowing of the packages and remove the conflicts
# When all good, restow without the simulation flag [-n]
stow -nvR home-dir/ config-dir/

# Reload the modifications or open a terminal to load the new .bashrc file
source ~/.bashrc

# Remove unnecessary folders
rmdir ~/Documents/ ~/Downloads/ ~/Pictures/ ~/Videos/ ~/Music/

# Required only if the data partition is on a separate partition from OS mount-point
# Make links to actual content directories in a separate partition
ln -s /media/$(whoami)/Data/Documents/ Documents
ln -s /media/$(whoami)/Data/Downloads/ Downloads
ln -s /media/$(whoami)/Data/Volatile/ Volatile
ln -s /media/$(whoami)/Media/Music/ Music
ln -s /media/$(whoami)/Media/Pictures/ Pictures
ln -s /media/$(whoami)/Media/Movies/ Videos

# Create preferred folder tree structure 
mkdir -p ~/Documents/Media/{Audio,Video,Images}
mkdir -p ~/Documents/Projects/{Mobile,Web,Desktop,Api}
mkdir -p ~/Documents/Projects/Mobile/{Android,iOS}
mkdir -p ~/Tools/sdk/{android,flutter,dart,go}
mkdir -p ~/Tools/astudio
mkdir -p ~/.local/share/{themes,icons}

# Remove all the unnecesary packages from the fresh-install
sudo apt purge plasma-discover-common plasma-vault plasma-wallpapers-addons plasma-welcome plasma-firewall plasma-runners-addons plasma-widgets-addons ark firefox khelpcenter kwalletmanageri vim-common

# Now do a dist-upgrade
upgradesys

# For capability to add PPA repositories
sudo apt install -y software-properties-common software-properties-qt

# PPA : Google Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# PPA : Enpass.io (Password manager)
sudo sh -c 'echo "deb http://repo.sinew.in/ stable main" >> /etc/apt/sources.list.d/enpass.list'
wget -O - http://repo.sinew.in/keys/enpass-linux.key | sudo apt-key add -

# Download and Install Unified Remote Server
wget https://www.unifiedremote.com/download/linux-x64-deb && sudo dpkg --install linux-x64-deb

# Install Syncthing : https://syncthing.net/downloads/
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Download and install the latest release of ActivityWatch Timetracker
https://github.com/ActivityWatch/activitywatch/releases

# For Android AVD emulation performance, installl KVM packages for Linux
# https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux
sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
sudo adduser $(whoami) kvm

# Install necessary apps
sudo apt install -y kubuntu-restricted-extras git vlc sqlite filelight gimp google-chrome-stable enpass inkscape digikam wireguard neovim default-jdk
sudo apt-get install -y --no-install-recommends libreoffice

# Install proprietary drivers
sudo ubuntu-drivers autoinstall

# Set locale to use 24H time-format
# https://unix.stackexchange.com/questions/553679/set-clock-to-24-hour-format-for-all-users
sudo localectl set-locale C.UTF-8

# This is for a Wifi Card Bug on HP Pavilion Notebook AB219TX (N8L68PA#ACJ)
# have'nt observred WiFi drops for quite some time
# DO not think this is required any more, however keeping it for records sake.
# sudo sh -c 'echo "options rtl8723be fwlps=0 swlps=0 ips=0 ant_sel=1" >> /etc/modprobe.d/rtl8723be.conf'

# For bug that shows the extra user on the login screen
# sudo usermod -u 999 libvirt-qemu

# For manually mounting HDD's by label - Use this in the user profile if needed
# Was required for ElementaryOs Luna because of a bug
# Not sure if still needed, keeping for recod's sake
# udisksctl mount -b /dev/disk/by-label/Data
