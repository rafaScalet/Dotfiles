status is-interactive || exit

set -g temp "$__fish_config_dir/conf.d/temp"

test -f ~/.aliases; and string replace '="' ' "' (cat ~/.aliases) | source

type -q thefuck; and test -f "$temp.fuck.fish" || thefuck --alias > "$temp.fuck.fish"

type -q zoxide; and test -f "$temp.zoxide.fish" || zoxide init fish --cmd cd > "$temp.zoxide.fish"

alias r='source ~/.config/fish/config.fish'

set -Ux CDPATH ~/Projects ~/Projects/* ~
