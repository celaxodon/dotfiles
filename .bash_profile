
#------------------------------------
# Aliases:
#------------------------------------

alias rm='rm -i'
alias lf='ls -F'
alias py='cd ~/Programming/Python'
alias mv='mv -i'
alias mova='~/Scripts/mova.sh'
alias stroke='/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias timer='~/Scripts/timer.sh'

#------------------------------------
# Paths:
#------------------------------------

SHELL=/bin/bash
MANPATH=/usr/man:/usr/X11/man
EDITOR=/usr/bin/vim
# export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin

# Setting PATH for Python 3.3
# The orginal version is saved in krull.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"
export PATH

##
# Your previous /Users/krull 1/.bash_profile file was backed up as /Users/krull 1/.bash_profile.macports-saved_2013-03-05_at_10:36:24
##

# MacPorts Installer addition on 2013-03-05_at_10:36:24: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Finished adapting your PATH environment variable for use with MacPorts.

# Initialization for FDK command line tools.Mon Apr 29 00:25:21 2013
FDK_EXE="/Users/klurl/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/klurl/bin/FDK/Tools/osx"

export PATH
export FDK_EXE

# fixing manpath issue
export MANPATH=/usr/man:/usr/X11/man:/usr/local/man:/opt/local/man:/usr/X11R6/man:/usr/share/man

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
