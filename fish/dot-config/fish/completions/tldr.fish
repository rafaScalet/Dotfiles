function __tldr_completions; tldr --list | awk '{print $1}'; end

complete -f -c tldr -a "(__tldr_completions)"
