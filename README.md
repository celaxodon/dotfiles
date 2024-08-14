# Dotfiles #

## Prerequisites

Install [poetry](https://python-poetry.org/docs/).

Run `poetry install` for package installation.
NOTE: May require running `poetry env use $(which python3)` with asdf-installed versions of Python.

## Installing dotfiles ##

`$ ansible-playbook roles/development/main.yml --ask-become-pass`


### Installing Only Some Dotfiles

Use tags (zsh, vim, tmux), like so:

`$ ansible-playbook roles/development/main.yml --tags "vim"`

## Development

Run `ansible-lint` before committing.

## Prerequisites

#. Install asdf
#. Install python 3.12+

## TODO ##

#. Install and deploy elixir-ls in ~/bin/elixir-ls (?)
#. Install rust language server (?)
#. Install bat utility
#. Install ripgrep utility
#. Install perforce
