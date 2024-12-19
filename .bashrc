#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source bash aliases file
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

PS1='[\u \W]\$ '

PATH=$PATH:/usr/local/stata18/
export XDG_CURRENT_DESKTOP=GNOME
alias config='/usr/bin/git --git-dir=/home/cml/.cfg/ --work-tree=/home/cml'
