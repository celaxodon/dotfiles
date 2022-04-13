# Dotfiles #

## Prerequisites

Install [poetry](https://python-poetry.org/docs/).

Run `poetry init`.

## Installation Steps ##

$ ansible-playbook install-dotfiles.yaml

`$ ./install.sh`

## Development

Run `ansible-lint` before committing.

## TODO ##

1. copy over vim config files
    a. Install plugins
    b. Template to pass in Python path or other paths? Requires `powerline-status`
    c. Install Plug if it hasn't already been (see https://github.com/junegunn/vim-plug)

2. Copy over tmux stuff
    - use template syntax to update `source` line for powerline's tmux config file
        ```
        powerline_loc=dirname $(python -c "import powerline; print(powerline.__file__)")
        $powerline_loc/
        ```
