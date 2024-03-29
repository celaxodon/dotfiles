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
alias myip='/home/icarus/scripts/IP_check/ip_check.py'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias sobin="source bin/activate"
alias deac="deactivate"

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
export PATH=$PATH:~/.cargo/bin

set_prompt() {
    if [[ "$(hostname)" == "" ]]; then
        export PS1='\u:[\W]$ '
    else
        export PS1='\u@\h[\W]$ '
    fi
}
set_prompt


if [[ -e .bashrc ]]; then
    source ~/.bashrc
fi
