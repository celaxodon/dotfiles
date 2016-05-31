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
alias tm='~/.tmux/startup.sh'
alias pygrade='pip3 freeze --local | grep -v '\^e' | cut -d = -f 1 | pip3 install -U'

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
#alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;\$!ba:s/\n/ /g')"

# Enable appending to history file instaed of overwriting
shopt -s histappend
# Starts X11 on login

# Attempting to enable colemak by default in X window system
# Options may be set in Gnome or other GUI
#setxkbmap us -variant colemak
#setxkbmap -option 'ctrl:nocaps'

export SHELL=/bin/bash
export EDITOR=/usr/bin/vim

if [[ -e .bashrc ]]; then
    source ~/.bashrc
fi
