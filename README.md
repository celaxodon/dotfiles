# Dotfiles #

## Prerequisites

Install [uv](https://docs.astral.sh/uv/getting-started/installation/)

Run `uv sync` for package installation.

## Installing dotfiles ##

`$ uv run ansible-playbook roles/development/main.yml --ask-become-pass`


### Installing Only Some Dotfiles

Use tags (zsh, vim, tmux), like so:

`$ uv run ansible-playbook roles/development/main.yml --tags "vim"`

## Development

Run `ansible-lint` before committing.

## Prerequisites

## TODO ##

#. Install build-essential, openssl, libssl-dev, git, lzma-dev (required for asdf python3 builds)
#. Install and deploy elixir-ls in ~/bin/elixir-ls (?)
#. Install rust language server (?)
#. Install bat utility

## Issues ##

#. Repeat installs fail at oh-my-zsh step since it's already been installed
#. Rustup install succeeds, but then any call to `rustup` fails

Post-install:
```
$ ln -s /usr/bin/batcat ~/bin/bat
```
#. Install ripgrep utility
#. Install perforce
