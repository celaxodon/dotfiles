# Dotfiles #

## Prerequisites

Install [poetry](https://python-poetry.org/docs/).

Run `poetry init`.

## Installation Steps ##

`$ ansible_playbook install-dotfiles.yaml --ask-become-pass`

## Development

Run `ansible-lint` before committing.

## TODO ##

1. Install Plug if it hasn't already been (see https://github.com/junegunn/vim-plug)

2. Vim plugins to look at:
    * QF Replace
    * tpope's vim-fugitive
    - Check https://github.com/sunaku/vim-modusline)
    - Ycm replacement
        - LSP
