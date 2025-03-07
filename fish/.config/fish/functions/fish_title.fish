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
