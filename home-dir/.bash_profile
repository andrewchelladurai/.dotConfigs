#!/bin/bash 

#
# https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_01.html
# Should be present at location ~/.config/.bash_profile
# 

# Set default prompt (https://scriptim.github.io/bash-prompt-generator/)
export PS1='\[\e[0;38;5;45m\]\t\[\e[0;97m\] of \[\e[0;38;5;147m\]\d \[\e[0;38;5;214m\]\W \[\e[0;38;5;156m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0;38;5;210m\]\$ \[\e[0m\]'

# update default editor for all commands to use neo-vim
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

# Append commands to the history every time a prompt is shown,
# instead of after closing the session.
PROMPT_COMMAND='history -a'

# limits recursive functions
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

#
# load bashrc file
#
if [ -x ~/.bashrc ]; then
    . ~/.bashrc;
fi 

