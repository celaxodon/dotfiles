# Dotfiles #

## Prerequisites

Install [poetry](https://python-poetry.org/docs/).

Run `poetry init`.

## Installation Steps ##

$ ansible-playbook install-dotfiles.yaml

`$ ./install.sh`

## TODO ##

* automate copy and setup of minimal environment on machines ssh'ing into

(to automate with install script)
1. copy `~/.gitignore_global` to home dir and run command on first line of file
2. copy over vim stuff
3. Copy over tmux stuff
4. download necessary python packages (powerline-status and others)

