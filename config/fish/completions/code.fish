function __code_completions
  if set -q CDPATH
    for dir in $CDPATH/*
      string replace $HOME "~" $dir
    end
  end
end

complete -c code -a "(__code_completions)"
complete -c codium -a "(__code_completions)"
