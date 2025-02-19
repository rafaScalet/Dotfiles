# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ..='cd ..'
alias .='cd .'
alias ~='cd'
alias D='cd ~/Dotfiles'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
