#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Was 'eval `dircolors -b ~/.dir_colors`. Not sure why
#eval `dircolors -b ~/.dir_colors`

alias ls='ls --color=auto'
PS1='[\u \W]\$ '

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
/usr/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh

export EDITOR=vim
export LC_ALL="C"
