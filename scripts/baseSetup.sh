#
# For Ubuntu Based Distros (KDE Specific)
# Preferred Distro : KDE Neon : https://neon.kde.org/
#

# Install necessary initial packages
sudo apt install stow git

# Download the dotFiles repo & switch to it
cd ~/ \
&& git clone https://github.com/andrewchelladurai/.dotFiles.git \
&& cd .dotFiles/

# Simulate the stowing of the packages and remove the conflicts
# When all good, restow without the simulation flag [-n]
stow -nvR home-dir/ config-dir/

# Reload the modifications or open a terminal to load the new .bashrc file
source ~/.bashrc

# Remove unnecessary folders
rm -rf ~/Documents/ ~/Downloads/ ~/Pictures/ ~/Videos/ ~/Music/

# Create preferred folder tree structure
mkdir -p ~/Documents/{Others,Media/{Audio,Video,Images},Projects,Tools/{lazygit,sdk/{android,flutter,dart,go}}}

# Required only if the data partition is on a separate partition from OS mount-point
# Make links to actual content directories in a separate partition
ln -s /media/$(whoami)/Data/Documents/ Documents
ln -s /media/$(whoami)/Data/Downloads/ Downloads
ln -s /media/$(whoami)/Data/Volatile/ Volatile
ln -s /media/$(whoami)/Media/Music/ Music
ln -s /media/$(whoami)/Media/Pictures/ Pictures
ln -s /media/$(whoami)/Media/Movies/ Videos

# For capability to add PPA repositories
sudo apt install -y software-properties-common software-properties-qt

# Install proprietary drivers
sudo ubuntu-drivers autoinstall

# Remove all the unnecessary packages from the fresh-install
sudo apt purge -y plasma-discover-common plasma-vault plasma-wallpapers-addons plasma-welcome plasma-firewall plasma-runners-addons plasma-widgets-addons ark firefox khelpcenter kwalletmanager vim-common kate vlc

# Now do a dist-upgrade
upgradesys

# Install Google Chrome
# https://support.google.com/chrome/answer/95346
cd ~/Documents/Others/ && wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo apt install -y ./google-chrome-stable_current_amd64.deb && rm ./google-chrome-stable_current_amd64.deb && cd ~/

# Install Enpass.io (Password manager)
# https://support.enpass.io/app/getting_started/installing_enpass.htm
echo "deb https://apt.enpass.io/  stable main" | sudo tee /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | sudo tee /etc/apt/trusted.gpg.d/enpass.asc

# Download and Install Unified Remote Server
# https://www.unifiedremote.com/download/other#linux
cd ~/Documents/Others/ && wget -c https://www.unifiedremote.com/download/linux-x64-deb && sudo dpkg -i ./linux-x64-deb && rm ./linux-x64-deb && cd ~/

# Install Syncthing
# https://syncthing.net/downloads/
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Download and install the latest release of ActivityWatch Timetracker
https://github.com/ActivityWatch/activitywatch/releases

# Install Lazygit
# https://github.com/jesseduffield/lazygit#ubuntu
cd ~/Documents/Tools/lazygit/
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
wget -c lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xvf lazygit.tar.gz lazygit && sudo install lazygit /usr/local/bin && rm lazygit.tar.gz && cd ~/

# Install GitHub CLI
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
cd ~/Documents/Others/
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update

# For Android AVD emulation performance, installl KVM packages for Linux
# https://developer.android.com/studio/run/emulator-acceleration#vm-linux
sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
sudo adduser $(whoami) kvm

# Install necessary packages for Flutter Development
# https://docs.flutter.dev/get-started/install/linux#linux-prerequisites
sudo apt-get install -y clang cmake git ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev

# Install necessary apps
sudo apt install -y kubuntu-restricted-extras git sqlite filelight gimp google-chrome-stable enpass inkscape digikam wireguard neovim default-jdk krita kompare elisa ktouch kontact zanshin arianna kommit btop gh
sudo apt-get install -y --no-install-recommends libreoffice

# Remove unnecessary wallpapers
cd /usr/share/wallpapers/ && \
sudo rm -rf ./Canopee/ ./Cascade/ ./Cluster/ ./BytheWater/ ./ColdRipple/ ./ColorfulCups/ ./DarkestHour/ ./Elarun/ ./EveningGlow/ ./FallenLeaf/ ./Flow/ ./FlyingKonqui/ ./Grey/ ./Honeywave/ ./IceCold/ ./Kay/ ./Kite/ ./Kokkini/ ./Opal/ ./PastelHills/ ./summer_1am/ ./Shell/ ./Volna/ && \
cd ~\

# This is for a Wifi Card Bug on HP Pavilion Notebook AB219TX (N8L68PA#ACJ)
# have'nt observred WiFi drops for quite some time
# DO not think this is required any more, however keeping it for records sake.
# sudo sh -c 'echo "options rtl8723be fwlps=0 swlps=0 ips=0 ant_sel=1" >> /etc/modprobe.d/rtl8723be.conf'
