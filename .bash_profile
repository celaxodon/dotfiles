
#------------------------------------
# Aliases:
#------------------------------------

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

#------------------------------------
# Paths:
#------------------------------------

SHELL=/bin/bash
EDITOR=/usr/bin/vim
# export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin

# MacPorts Installer addition on 2013-03-05_at_10:36:24: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Finished adapting your PATH environment variable for use with MacPorts.

# Initialization for FDK command line tools.Mon Apr 29 00:25:21 2013
FDK_EXE="/Users/klurl/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/klurl/bin/FDK/Tools/osx"

export PATH
export FDK_EXE

# fixing manpath issue
export MANPATH=/usr/man:/usr/X11/man:/usr/local/man:/usr/local/share/man:/opt/local/man:/usr/X11R6/man:/usr/share/man:

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
