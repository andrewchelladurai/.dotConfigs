#
# Custom Bash Run Script : https://www.gnu.org/software/bash/
# Manual : https://www.gnu.org/software/bash/manual/bash.html
#
# The RC is usually at location ~/.bashrc on the local system
# However we are keeping all things consolidated in ~/.config/bash/ and refer to it via a symlink
##
# Do below to use this setup
#
# mkdir -p ~/.config/bash/ && cd ~/.config/bash/
# mv -v .bashrc .bashrc_original
# wget https://raw.githubusercontent.com/andrewchelladurai/configs/master/.bashrc
# ln -s ~/.config/bash/.bashrc ~/.config/.bashrc
# Restart existing bash terminal sessions for changes to take effect
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If I am root then return immediately and do not continue.
[[ "$(whoami)" = "root" ]] && return

# Run the welcome screen if it exists.
[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

# Source the bash_aliases file if it exists.
[[ -e ~/.bash_aliases ]] && . ~/.bash_aliases

# limits recursive functions
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

#
# The next section modifies the behavior of bash
#

# Set the default editor to vim.
export EDITOR=nvim

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
