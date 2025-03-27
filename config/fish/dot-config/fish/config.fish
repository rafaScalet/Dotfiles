status is-interactive || exit

test -f ~/.aliases; and string replace '="' ' "' (cat ~/.aliases) | source

type -q vivid; and set -gx LS_COLORS (vivid generate catppuccin-mocha)

set -gx CDPATH ~/Projects ~/Projects/* ~

test -e ~/.gitalias || curl -fsSL -o ~/.gitalias https://raw.githubusercontent.com/GitAlias/gitalias/refs/heads/main/gitalias.txt

