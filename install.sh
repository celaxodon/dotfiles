#!/usr/bin/env bash

set -e
set -o pipefail


check_requirements() {
    git --version >/dev/null 2>&1 || { echo "git required but not installed."; exit 1 }
    vim --version >/dev/null 2>&1 || { echo "vim required but not installed."; exit 1 }
    tmux -V >/dev/null 2>&1 || { echo "tmux required but not installed."; exit 1 }
}

# set up vim
vim() {
    if [[ -f ~/.vim/vimrc ]] then
        cp ./.vim/vimrc ~/.vim/vimrc
        return 0
    elif 
        mkdir ~/.vim
        cp ./.vim/vimrc ~/.vim/vimrc
    fi

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall
}

tmux() {
    cp ./.tmux ~/.tmux
}

git() {
    cp ./.gitignore_global ~/.gitignore_global
}

# - #
# --- #
# ----- #
# ------- #
# --------- #
# main script # -
# --------- #   |
# ------- #     |
# ----- #       |
# --- #         |
# - #           |
#               v

check_requirements()

vim()

tmux()

git()

exit 0
