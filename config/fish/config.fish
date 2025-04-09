status is-interactive || exit

test -f ~/.aliases; and string replace '="' ' "' (cat ~/.aliases) | source

set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME $HOME/.config

type -q vivid; and set -gx LS_COLORS (vivid generate catppuccin-mocha)

set -gx CDPATH ~/Projects ~/Projects/* ~

if not test -e ~/.gitalias
    curl -fsSL -o ~/.gitalias https://raw.githubusercontent.com/GitAlias/gitalias/refs/heads/main/gitalias.txt
end

bind --mode insert ctrl-shift-l clear-screen
bind --mode default ctrl-shift-l clear-screen

bind --mode insert ctrl-alt-r fish_reload
bind --mode default ctrl-alt-r fish_reload

set -gx SHELL_MOMMYS_LITTLE child/girl/boy/dev

set -gx fish_tmux_config $HOME/.config/tmux/tmux.conf
set -gx fish_tmux_default_session_name default
set -gx fish_tmux_autostart true

set -gx COMMENT_FREQ 10

fish_config theme choose 'Catppuccin Mocha'

fishin
