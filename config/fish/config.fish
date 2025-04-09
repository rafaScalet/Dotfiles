status is-interactive || exit

set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME $HOME/.config

set -q EDITOR; or set -gx EDITOR nvim

set -gx CDPATH ~/Projects ~/Projects/* ~

bind --mode insert ctrl-shift-l clear-screen
bind --mode default ctrl-shift-l clear-screen

bind --mode insert ctrl-alt-r fish_reload
bind --mode default ctrl-alt-r fish_reload

set -gx SHELL_MOMMYS_LITTLE child/girl/boy/dev

set -gx fish_tmux_config $HOME/.config/tmux/tmux.conf
set -gx fish_tmux_default_session_name default
set -gx fish_tmux_autostart true

set -gx COMMENT_FREQ 10

set theme (gsettings get org.gnome.desktop.interface color-scheme)
if test $theme = "'prefer-dark'"
    fish_config theme choose 'Catppuccin Mocha'
    type -q vivid; and set -gx LS_COLORS (vivid generate catppuccin-mocha)
else
    fish_config theme choose 'Catppuccin Latte'
    type -q vivid; and set -gx LS_COLORS (vivid generate catppuccin-latte)
end

fishin
