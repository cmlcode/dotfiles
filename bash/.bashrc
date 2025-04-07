#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source bash aliases file
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Setup bash command line
PS1='[\u \W]\$ '
