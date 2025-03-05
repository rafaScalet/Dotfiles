function fish_greeting
  fastfetch --config ~/.config/fastfetch/greeting.jsonc 2> /dev/null
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
    if type -q starship
      function starship_transient_prompt_func
        starship module character
      end

      starship init fish | source

      enable_transience
    else
      fish_prompt
    end
  case "zen-p10k"
    if type -q oh-my-posh
      oh-my-posh init --config ~/.config/ohmyposh/zen-p10k.json fish | source
    end
  case "git-bash"
    if type -q oh-my-posh
      oh-my-posh init --config ~/.config/ohmyposh/git-bash.json fish | source
    end
  case "native"
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
end
