status is-interactive || exit

if not functions -q fisher; curl -sL https://git.io/fisher | source && fisher update; end

abbr q 'exit'
abbr s 'source'
abbr c 'codium'
abbr c. 'codium .'
abbr c! 'codium -r . && exit'
abbr nv 'nvim'
abbr nv. 'nvim .'
abbr gllg "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue<%an>%Creset %s %Cgreen%C(bold)%cr%Creset%C(magenta)%d' --max-count=30 --date=short"
abbr d 'docker'
abbr dc 'docker compose'
abbr dp 'docker pull'
abbr dr 'docker run'
abbr dr 'docker remove'
abbr dri 'docker image remove'
abbr dps 'docker ps'
abbr dpa 'docker ps -a'
abbr dst 'docker start'
abbr dsp 'docker stop'
abbr m 'mise'
abbr f 'fisher'
abbr fu 'fisher update'
abbr fi 'fisher install'
abbr fr 'fisher remove'
abbr fl 'fisher list'
abbr -- - 'cd -'
abbr . 'cd .'
abbr A 'cd ~/Annotations'
abbr D 'cd ~/Dotfiles'
abbr P 'cd ~/Projects'

alias r='source ~/.config/fish/config.fish'
alias lzg='lazygit'
alias lzd='lazydocker'
alias code='codium -r . && exit'
alias md='mkdir -p'
alias config='codium ~/.config/fish/config.fish'
alias envar='codium ~/.env'
alias ignore='codium ~/.gitignore'
alias dot='stow --stow'
alias undot='stow --delete'
alias redot='stow --restow'

source $__fish_config_dir/let.fish

function __stow_completion
  if test -f ~/.stowrc
    set dotfiles_dir (cat ~/.stowrc | grep dir | cut -c3-)
    eval set dotfiles_dir (string replace "dir=" "" $dotfiles_dir)
  else
    eval set dotfiles_dir (pwd)
  end


  for dir in $dotfiles_dir/*
    if test -d $dir
      echo (basename $dir)
    end
  end
end

complete -f -c stow -a "(__stow_completion)"
