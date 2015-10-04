
#----------#
# Aliases: #
#----------#

#alias rm='rm -i'
alias lf='ls -F'
alias py='cd ~/Programming/Python'
alias mv='mv -i'
alias mova='~/Scripts/mova.sh'
alias stroke='/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke'
alias timer='~/Scripts/timer.sh'
alias ls='ls -G' # Enable color OS X. For linux, '--color=auto'
#alias grep='grep --color=auto' # Enable grep colored output (Linux)
alias gdb='cgdb'
alias tmux='tmux -f ~/.tmux/tmux.conf'
alias tm='~/.tmux/startup.sh'

export PS1='\u@\h:[\W]$ '

SHELL=/bin/bash
EDITOR=/usr/local/bin/vim
# export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin

#----------------------#
# Paths and Variables: #
#----------------------#

# fixing manpath issue
export MANPATH=/usr/man:/usr/X11/man:/usr/local/man:/usr/local/share/man:/opt/local/man:/usr/X11R6/man:/usr/share/man:
