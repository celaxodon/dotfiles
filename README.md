# Dotfiles #

## Prerequisites

Install [poetry](https://python-poetry.org/docs/).

Run `poetry init`.

## Installation Steps ##

`$ ansible-playbook install_dotfiles.yaml --ask-become-pass`

## Development

Run `ansible-lint` before committing.

## TODO ##

1. Install Plug if it hasn't already been (see https://github.com/junegunn/vim-plug)

2. Install and deploy elixir-ls in ~/bin/elixir-ls

2. Vim plugins to look at:
    * QF Replace
    * tpope's vim-fugitive
    - Check https://github.com/sunaku/vim-modusline)
    - Ycm replacement
        - LSP

3. [playbook] Substitute home directory in coc-settings.js file.
[playbook] Install CoC dependencies (requires node?)
