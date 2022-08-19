#!/bin/bash 

#
# https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_01.html
# Should be present at location ~/.config/.bash_profile
# 

# load bashrc file
if [ -x ~/.bashrc ]; then . ~/.bashrc; fi 

# update default editor for all commands to use neo-vim
# https://bash.cyberciti.biz/guide/$VISUAL_vs._$EDITOR_variable_%E2%80%93_what_is_the_difference%3F
export VISUAL=nvim
export EDITOR="$VISUAL"

