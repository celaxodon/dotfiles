#set -o pipefail
#set -e

#----------#
# Aliases: #
#----------#

alias lf='ls -F'
alias mv='mv -i'
alias mova='~/Scripts/mova.py'
alias stroke='/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke'
alias timer='~/Scripts/timer.sh'
alias ls='ls -G' # Enable color OS X. For linux, '--color=auto'
#alias grep='grep --color=auto' # Enable grep colored output (Linux)
alias gdb='cgdb'
alias tmux='tmux -f ~/.tmux/tmux.conf'
alias tm='~/.tmux/startup.sh'
alias pygrade='pip3 freeze --local | grep -v '\^e' | cut -d = -f 1 | pip3 install -U'
alias myip='~/Scripts/iptools/iptools/ip_check.py'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable appending to history file instead of overwriting
shopt -s histappend

# Powerline set up
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
/usr/local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

export RUST_SRC_PATH='/usr/local/rust/rustc-1.9.0/src'

SHELL=/bin/bash
EDITOR=/usr/local/bin/vim
# export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
PATH=$PATH:~/.cargo/bin

#----------------------#
# Paths and Variables: #
#----------------------#

# fixing manpath issue
export MANPATH=/usr/man:/usr/X11/man:/usr/local/man:/usr/local/share/man:/opt/local/man:/usr/X11R6/man:/usr/share/man:

# Set prompt based on current system
set_prompt() {
    if [[ "$(hostname)" == "" ]]; then
        export PS1='\u:[\W]$ '
    else
        export PS1='\u@\h[\W]$ '
    fi
}
set_prompt

# In .bash_rc?
#sh -c ssh-agent
