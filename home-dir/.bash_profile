#!/bin/bash

#
# https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_01.html
# Should be present at location ~/.bash_profile
#

# update default editor for all commands to use NeoVim
# https://bash.cyberciti.biz/guide/$VISUAL_vs._$EDITOR_variable_%E2%80%93_what_is_the_difference%3F
export VISUAL=nvim
export EDITOR="$VISUAL"

# Avoid successive duplicates in the bash command history.
export HISTCONTROL=ignoredups

# Set bash_history file_path to be in the cache directory
export HISTFILE=/home/$USER/.cache/.bash_history

# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1614
HISTFILESIZE=1613

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Append commands to the history every time a prompt is shown,
# instead of after closing the session.
PROMPT_COMMAND='history -a'

# limits recursive functions
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
# bind '"\e[A":history-search-backward'
# bind '"\e[B":history-search-forward'

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Add Flutter to the executable path : https://docs.flutter.dev/get-started/install/linux
export PATH="$PATH:$HOME/Tools/sdk/flutter/bin"

# Add GO to the executable path : https://go.dev/doc/install
export PATH="$PATH:$HOME/Tools/sdk/go/bin"

# Add LazyGit to the executable path : https://github.com/jesseduffield/lazygit
export PATH="$PATH:$HOME/Tools/lazygit"

#
# load bashrc file
#
if [ -x ~/.bashrc ]; then
    . ~/.bashrc;
fi

