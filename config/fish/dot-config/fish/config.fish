status is-interactive || exit

test -f ~/.aliases; and string replace '="' ' "' (cat ~/.aliases) | source

type -q vivid; and set -gx LS_COLORS (vivid generate catppuccin-mocha)

alias r='source ~/.config/fish/config.fish'

set -gx CDPATH ~/Projects ~/Projects/*

curl -fsSL -o ~/.gitalias https://raw.githubusercontent.com/GitAlias/gitalias/refs/heads/main/gitalias.txt

