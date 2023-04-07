# Dotfiles #

## Prerequisites

Install [poetry](https://python-poetry.org/docs/).

Run `poetry init` for package installation

## Installing dotfiles ##

`$ ansible-playbook roles/development/main.yml --ask-become-pass`


### Installing only (n)vim-related dotfiles

`$ ansible-playbook roles/development/main.yml --tags "vim"`

## Development

Run `ansible-lint` before committing.

## TODO ##

1. Install Plug if it hasn't already been (see https://github.com/junegunn/vim-plug)

2. Install and deploy elixir-ls in ~/bin/elixir-ls

2. Vim plugins to look at:
    * QF Replace
    * tpope's vim-fugitive
    - Check https://github.com/sunaku/vim-modusline)

3. [playbook] Substitute home directory in coc-settings.js file.
[playbook] Install CoC dependencies (requires node?)

4. Update tmux status bar to display *Z* in front of the window name when a pane is zoomed in the window.
Maybe powerline-status had this set up?
