status is-interactive || exit

if not functions -q fisher; curl -sL https://git.io/fisher | source && fisher update; end

abbr q 'exit'
abbr s 'source'
abbr c 'codium'
abbr c. 'codium .'
abbr c! 'codium -r . && exit'
abbr nv 'nvim'
abbr nv. 'nvim .'
abbr vi 'nvim'
abbr vi. 'nvim .'
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

function fish_greeting
  fastfetch --config ~/.config/fastfetch/greeting.jsonc 2> /dev/null
end

function fish_title
  set -l current_dir (basename (pwd))
  set -l parent_dir (basename (dirname (pwd)))

  switch $current_dir
    case (whoami)
      echo 
    case 'Documentos' 'Documents'
      echo 󰈙
    case 'Models' 'Modelos'
      echo 󰛼
    case 'Downloads'
      echo 
    case 'Music' 'Músicas'
      echo 󰝚
    case 'Pictures' 'Imagens'
      echo 
    case 'Projects' 'Developer' 'Dev'
      echo 󰲋
    case 'Games'
      echo 󰮂
    case 'Public' 'Público'
      echo 󰖟
    case 'Vídeos' 'Videos'
      echo 
    case 'Desktop' 'Área de trabalho'
      echo 
    case 'Dotfiles' 'Config' 'Configurations'
      echo 
    case 'Annotations' 'Notes'
      echo 
    case '*'
      echo $parent_dir/$current_dir
  end
end

function fish_prompt
  set_color magenta
  printf '%s' $USER
  set_color normal
  printf ' in '

  set_color yellow
  printf '%s' (basename (pwd))
  set_color normal

  # Line 2
  echo
  set_color green
  printf '↪ '
  set_color normal
end

if type -q starship
  function starship_transient_prompt_func
    starship module character
  end

  starship init fish | source

  enable_transience
end
