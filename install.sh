#!/usr/bin/env bash

# A bash script to set up my shell and development environment on OS X or Linux

set -e
set -o pipefail
# Show debug output
#set -x


SCRIPT_LOC="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


check_requirements() {
    git --version >&/dev/null || { echo >&2 "git required but not installed."; exit 1; }
    vim --version >/dev/null 2>&1 || { echo >&2 "vim required but not installed."; exit 1; }
    tmux -V >/dev/null 2>&1 || { echo "tmux required but not installed."; exit 1; }
}


brew_check() {
    # Install homebrew if it doesn\'t exist
    brew --version >&/dev/null || {
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \
        return 0; }

    if [[ $? != 0 ]]; then
        echo "Problem installing brew from Github"
        return 1
    fi
}

# set up vim
vim() {
    if [[ -f ~/.vim/vimrc ]]; then
        # TODO: Change ./.vim/vimrc to $(script_location)/.vim/vimrc
        cp "$SCRIPT_LOC"/.vim/vimrc ~/.vim/vimrc
        return 0
    else
        mkdir -p ~/.vim/bundle
        cp "$SCRIPT_LOC"/.vim/vimrc ~/.vim/vimrc
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
            vim +PluginInstall +qall
        return 0
    fi
}

tmux() {
    cp "$SCRIPT_LOC"/.tmux/* ~/.tmux/
    return 0
}

git() {
    cp "$SCRIPT_LOC"/.gitignore_global ~/.gitignore_global
    return 0
}

bash() {
    cp "$SCRIPT_LOC"/.bash_profile ~/.bash_profile
    return 0
}

zsh() {
    cp "$SCRIPT_LOC"/.zprofile ~/.zprofile
    cp "$SCRIPT_LOC"/.zshrc ~/.zshrc
}

#
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

main() {
    if [[ "$(uname)" == "Darwin" ]]; then
        echo "Operating system detected: MacOS"
        echo "Performing MacOS-specific checks:"
        # TODO: colorize results of commands
        brew_check && echo "    ...homebrew OK"
    else if [[ "$(uname)" == "Linux" ]]; then
        echo "Operating system detected: Linux"
    fi

    echo
    echo "Performing standard checks:"
    check_requirements && echo "    ...git, vim, tmux OK"
    echo
    vim && echo "vimrc installed"
    tmux && echo "tmux files installed"
    git && echo "git files installed"
    bash && echo "Bash files installed"
    zsh && echo "Zsh files installed"
    exit 0
}

main
