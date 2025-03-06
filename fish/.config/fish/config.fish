status is-interactive || exit

if not functions -q fisher; curl -sL https://git.io/fisher | source && fisher update; end

function fish_default_mode_prompt ;end # disable the vi mode view in prompt

abbr i "awk '{print \$1}' .packages/yay.txt | xargs -n1 yay -Ss"
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
alias pnpx='pnpm dlx'

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

function vi
  if set -q __vi_mode_enabled
    set -e __vi_mode_enabled
    fish_default_key_bindings
    echo vi is disable
  else
    set -Ux __vi_mode_enabled 1
    fish_vi_key_bindings
    echo vi is enable
  end
end

if [ $GREETING ]
  function fish_greeting
    fastfetch --config ~/.config/fastfetch/greeting.jsonc 2> /dev/null
  end
else
  set -g fish_greeting
end

function fish_title
  set -l current_dir (basename (pwd))
  set -l parent_dir (basename (dirname (pwd)))

  if test -n "$TMUX"
    echo $parent_dir/$current_dir
  else
    switch $current_dir
      case (whoami); echo 
      case 'Documentos' 'Documents'; echo 󰈙
      case 'Models' 'Modelos'; echo 󰛼
      case 'Downloads'; echo 
      case 'Music' 'Músicas'; echo 󰝚
      case 'Pictures' 'Imagens'; echo 
      case 'Projects' 'Developer' 'Dev'; echo 󰲋
      case 'Games'; echo 󰮂
      case 'Public' 'Público'; echo 󰖟
      case 'Vídeos' 'Videos'; echo 
      case 'Desktop' 'Área de trabalho'; echo 
      case 'Dotfiles' 'Config' 'Configurations'; echo 
      case 'Annotations' 'Notes'; echo 
      case '*'; echo $parent_dir/$current_dir
    end
  end
end

switch $PROMPT
  case "starship"
    function starship_transient_prompt_func
      echo -n (set_color blue)" "
    end

    starship init fish | source

    enable_transience
  case "ohmyposh"
    oh-my-posh init --config ~/.config/ohmyposh/$OHMYPOSH_THEME.json fish | source
end
