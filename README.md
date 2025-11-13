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
#. Install lazygit

Post-install:
#. Install perforce
