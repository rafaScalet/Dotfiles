function __get_dotfiles_dir
  set -g __stowrc_command string replace "dir=" "" (cat $stowrc | grep dir | cut -c3-)

  if set -q $stowrc; and test -e $stowrc
    $__stowrc_command
  else if test -e ./.stowrc
    eval set -Ux stowrc (pwd)/.stowrc
    $__stowrc_command
  else if test -e ~/.stowrc
    eval set -Ux stowrc ~/.stowrc
    $__stowrc_command
  else
    eval set -Ux stowrc (find ~ -name ".stowrc" -not -path '*/Trash/*')
    $__stowrc_command
  end
end

function __stow_completion
  eval set dotfiles_dir (__get_dotfiles_dir)

  for dir in $dotfiles_dir/*
    if test -d $dir
      echo (basename $dir)
    end
  end
end

complete -f -c stow -a "(__stow_completion)"

