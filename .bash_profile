#
# ~/.bash_profile
#     Linux
#

#------------------------#
#         Aliases        #
#------------------------#

alias lf='ls -F'
alias py='cd ~/Programming/Python'
alias mv='mv -i'
alias vi='vim'
alias ls='ls --color=auto'     # Enable ls colored output (Linux)
alias grep='grep --color=auto' # Enable grep colored output (Linux)
alias tmux='tmux -f ~/.tmux/tmux.conf'

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;\$!ba:s/\n/ /g')"

# Starts X11 on login
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 }} && exec startx

# Attempting to enable colemak by default in X window system
setxkbmap us -variant colemak

#-------------------#
#       Paths:      #
#-------------------#

export SHELL=/bin/bash

[[ -f ~/.bashrc ]] && . ~/.bashrc
