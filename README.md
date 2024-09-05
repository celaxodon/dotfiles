# Dotfiles #

## Prerequisites

Install [poetry](https://python-poetry.org/docs/).

Run `poetry install` for package installation.
NOTE: May require running `poetry env use $(which python3)` with asdf-installed versions of Python.

#. Install asdf
#. Install python 3.12+
#. Install poetry


## Installing dotfiles ##

`$ ansible-playbook roles/development/main.yml --ask-become-pass`


### Installing Only Some Dotfiles

Use tags (zsh, vim, tmux), like so:

`$ ansible-playbook roles/development/main.yml --tags "vim"`

## Development

Run `ansible-lint` before committing.

## Prerequisites

## TODO ##

#. Install build-essential, openssl, libssl-dev, git, lzma-dev (required for asdf python3 builds)
#. Install and deploy elixir-ls in ~/bin/elixir-ls (?)
#. Install rust language server (?)
#. Install bat utility
Post-install:
```
$ ln -s /usr/bin/batcat ~/bin/bat
```
#. Install ripgrep utility
#. Install perforce
