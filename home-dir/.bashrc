#
# Custom Bash Run Script : https://www.gnu.org/software/bash/
# Manual : https://www.gnu.org/software/bash/manual/bash.html
# The RC is usually at location ~/.bashrc on the local system
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If I am root then return immediately and do not continue.
[[ "$(whoami)" = "root" ]] && return

# Set default prompt (https://scriptim.github.io/bash-prompt-generator/)
export PS1='\[\e[0;38;5;51m\]\t\[\e[97m\] \[\e[0;38;5;51m\]of \[\e[0;38;5;51m\]\D{%a, %d-%b} \[\e[0;38;5;228m\]\W \[\e[0;38;5;210m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0m\]\$ \[\e[0m\]'

# Run the welcome screen if it exists.
[[ -x ~/.welcome_screen ]] && . ~/.config/.welcome_screen

# Source the bash_aliases file if it exists.
[[ -x ~/.bash_aliases ]] && . ~/.bash_aliases

