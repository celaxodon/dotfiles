#!/bin/bash

# A script for interactive tmux on startup
# Parts of it from github.com/nicknisi/dotfiles/bin/tm

# Exit if already inside a tmux session
[[ $TMUX == "" ]] || exit 0;

# Choose session to attach to, if one exists:

# Get number of active sessions:
#session_nums=$(tmux ls | wc -l)

# Get list of sessions:
session_list=($(tmux ls -F "#S") "New Session")

PS3="Select a session to attach to: "

echo " ";
echo "Available sessions:"
echo "-------------------"
echo " ";
select i in "${session_list[@]}"; do
    case $i in 
            "New Session") 
                    read -p "Enter a new session name: " session_name;
                    tmux -f ~/.tmux/tmux.conf new -s "$session_name";
                    # Case needs extra semicolons at ends of case statements; see help case
                    break;;
            *)
                    tmux attach-session -t "$i"
                    break;;
    esac
done
exit 0
