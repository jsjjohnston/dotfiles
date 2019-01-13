#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='\033[92m[\u]\e[0m\033[93m[\d \A]\e[0m\033[96m[\W]\e[0m '
PS1='\[\033[93m\][\d \A]\[\033[92m\][\u]\[\033[96m\][\W]\[\e[0m\] '