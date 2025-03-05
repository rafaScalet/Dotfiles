# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ..='cd ..'
alias .='cd .'
alias ~='cd'
# alias -='cd -'

alias ls='ls --color=auto'
alias la='ls --color=auto -la'
alias ll='ls --color=auto -l'
alias grep='grep --color=auto'

if [ -f /usr/share/git/completion/git-prompt.sh ]; then
  source /usr/share/git/completion/git-prompt.sh
fi

if [ "$TERM_PROGRAM" = "vscode" ] || [ "$TERM_PROGRAM" = "vscodium" ]; then
  IS_VSCODE=true
else
  IS_VSCODE=false
fi

if [ "$IS_VSCODE" = true ]; then
  PS1='\[\e[32m\][\[\e[34m\]\u\[\e[32m\]@\[\e[36m\]\h \[\e[33m\]\W\[\e[31m\]$(__git_ps1 " (%s)")\[\e[32m\]]\[\e[0m\]\$ '
  eval "$(oh-my-posh init --config ~/.config/ohmyposh/git-bash.json bash)"
else
  eval "$(starship init bash)"
fi
