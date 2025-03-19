function __get_dotfiles_dir
  string replace "dir=" "" (cat ~/Dotfiles/.stowrc | grep dir | cut -c3-)
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

