status is-interactive || exit

set -gx fisher_path $HOME/.local/share/fish/plugins

set -g fisher_function_path $fisher_path/functions
set -g fisher_complete_path $fisher_path/completions
set -g fisher_config_d_path $fisher_path/conf.d
set -g fisher_themes_path $fisher_path/themes

set fish_function_path $fish_function_path[1] $fisher_function_path $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_complete_path $fish_complete_path[2..-1]

for file in $fisher_config_d_path/*.fish
    source $file
end

if not test -e $fisher_themes_path
    ln -s $fisher_themes_path $__fish_config_dir/themes >/dev/null
end

if not functions -q fisher
    curl -sL https://git.io/fisher | source && fishin
end
