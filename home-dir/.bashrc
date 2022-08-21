#
# Custom Bash Run Script : https://www.gnu.org/software/bash/
# Manual : https://www.gnu.org/software/bash/manual/bash.html
# The RC is usually at location ~/.bashrc on the local system
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If I am root then return immediately and do not continue.
[[ "$(whoami)" = "root" ]] && return

# Run the welcome screen if it exists.
[[ -x ~/.welcome_screen ]] && . ~/.config/.welcome_screen

# Source the bash_aliases file if it exists.
[[ -x ~/.bash_aliases ]] && . ~/.bash_aliases

# limits recursive functions
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

