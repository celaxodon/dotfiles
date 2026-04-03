# macOS-specific — sourced from ~/.zshrc when OSTYPE is darwin.
# Installed alongside other zsh snippets under $XDG_CONFIG_HOME/zsh/ (see XDG Base Directory).

if [[ -x /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
	eval "$(/usr/local/bin/brew shellenv)"
fi

if [[ -x "$HOME/bin/nvim-macos-arm64/bin/nvim" ]]; then
	alias nvim="$HOME/bin/nvim-macos-arm64/bin/nvim"
fi

export PATH=~/bin:$PATH

export DOCKER_CLI_PLATFORM=linux/amd64
export DOCKER_DEFAULT_PLATFORM=linux/amd64

export LDFLAGS="-L/usr/local/opt/wxwidgets/lib"
export CPPFLAGS="-I/usr/local/opt/wxwidgets/include"
export PKG_CONFIG_PATH="/usr/local/opt/wxwidgets/lib/pkgconfig"

# if command -v zellij >/dev/null 2>&1; then
# 	eval "$(zellij setup --generate-auto-start zsh)"
# fi
