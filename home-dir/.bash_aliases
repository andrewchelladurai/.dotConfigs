#
# https://www.gnu.org/software/bash/manual/html_node/Aliases.html
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
# Place all additions into a separate file like ~/.config/bash/bash_aliases instead of adding them in ~/.bashrc directly.
# Source the separate aliases file in ~/.bashrc as below
# [[ -e ~/.bash_aliases ]] && . ~/.bash_aliases
#

# Remove unused packages & do full system upgrade 
alias upgradesys='sudo pkcon refresh && sudo pkcon update'

# restart networkmanager service using system control
alias restartNMW='sudo systemctl restart network-manager'

# restart networkmanager service using nm's own utility
alias restartNMCli='nmcli networking off ; sleep 10 ; nmcli networking on'

# restart networkmanager wifi radio
alias restartNMCliWifi='nmcli radio wifi off ; sleep 10 ; nmcli radio wifi on'

# LibVrt (VirtualBox Guests) and KVM (Android Emulators) conflict and do not run together.
# Stop KVM emulation, by disabling the kernel module
alias kvmstop="sudo rmmod kvm_intel ; sudo rmmod kvm"

# Start KVM emulation, by enabling the kernel module
alias kvmstart="sudo insmod /lib/modules/$(uname -r)/kernel/arch/x86/kvm/kvm.ko ; sudo insmod /lib/modules/$(uname -r)/kernel/arch/x86/kvm/kvm-intel.ko"

# Map nvim to vi
alias v="nvim"

# Start nvim in Readonly mode when needed
alias vr="nvim -R"

# Make some possibly destructive commands more interactive.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Alias list of files to be readable and easy on the eyes.
alias ll='ls -larth --color=auto'
alias l='ls -Fa --color=auto'

# Make output of commands human readable & use colors
alias df="df -h"
alias du="du -h"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -ltrh --color=auto'
alias llt='ls -ltrh --color=auto | tail'
alias llh='ls -ltrh --color=auto | head'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Make directory navigation painless
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Show open ports by default
alias showports='netstat -tulanp'

# Make wget start with continue option by default
alias wget='wget -c'

# Scrcpy commands : https://github.com/Genymobile/scrcpy 
# Enable Screen Mirroring on when physical device screen is off
# https://github.com/Genymobile/scrcpy#turn-screen-off
alias scrcpy='scrcpy --turn-screen-off --stay-awake'


# Add an "alert" alias for long running commands.
# Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
