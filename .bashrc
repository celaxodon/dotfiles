#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

# Was 'eval `dircolors -b ~/.dir_colors`. Not sure why
#eval `dircolors -b ~/.dir_colors`

alias ls='ls --color=auto'
PS1='[\u \W]\$ '

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

#/usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh

# For bash+powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
export POWERLINE_CONFIG_COMMAND="/usr/bin/powerline-config"


export EDITOR=vim
# Changed from "C" to fix gnome-terminal issue: "Non UTF-8 locale
# (ANSI_X3.4-1968) is not supported", which caused gnome-terminal to crash
# on opening.
export LANG="en_US.UTF-8"
export TERM=xterm-256color
