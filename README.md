# Dotfiles #

## Prerequisites

Install [poetry](https://python-poetry.org/docs/).

Run `poetry init`.

## Installation Steps ##

`$ ansible_playbook install-dotfiles.yaml --ask-become-pass`

## Development

Run `ansible-lint` before committing.

## TODO ##

1. copy over vim config files
    a. Install Plug if it hasn't already been (see https://github.com/junegunn/vim-plug)
2. Migrate to nvim
3. Investigate alternatives to powerline-status
    - staship.rs
    - vim-airline
    - lightline.vim
    - Check https://github.com/sunaku/vim-modusline)
