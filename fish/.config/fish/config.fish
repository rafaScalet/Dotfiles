status is-interactive || exit

if not functions -q fisher; curl -sL https://git.io/fisher | source && fisher update; end

abbr q 'exit'
abbr s 'source'
abbr c 'codium'
abbr c. 'codium .'
abbr c! 'codium -r . && exit'
abbr d 'docker'
abbr f 'fastfetch'
abbr m 'mise'
abbr ms 'mise'
abbr fs 'fisher'
abbr -- - 'cd -'
abbr . 'cd .'
abbr D 'cd ~/Dotfiles'
abbr C 'cd ~/.config/fish'

alias r='source ~/.config/fish/config.fish'
alias lzg='lazygit'
alias lzd='lazydocker'
alias code='codium -r . && exit'
alias config='codium ~/.config/fish/config.fish'
alias dot='stow -d ~/Dotfiles'
