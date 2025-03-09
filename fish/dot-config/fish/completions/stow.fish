function __stow_completion
  eval set dotfiles_dir (__get_dotfiles_dir)

  for dir in $dotfiles_dir/*
    if test -d $dir
      echo (basename $dir)
    end
  end
end

function __pack_completion
  eval set packs_dir (__get_pack_dir)

  for pack in $packs_dir/*
    if test -f $pack
      echo (string replace ".txt" "" (basename $pack))
    end
  end
end

complete -f -c stow -a "(__stow_completion)"
complete -f -c pack -a "(__pack_completion)"

