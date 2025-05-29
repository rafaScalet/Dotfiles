status is-interactive || exit

set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME $HOME/.config

set -q EDITOR; or set -gx EDITOR nvim

set -g CDPATH ~/Projects ~/Projects/* ~

set -gx SHELL_MOMMYS_LITTLE child/girl/boy/dev

set -gx fish_tmux_config $HOME/.config/tmux/tmux.conf
set -gx fish_tmux_default_session_name default
set -gx fish_tmux_autostart true

set -gx COMMENT_FREQ 10

set -gx fifc_bat_opts --theme="Catppuccin Mocha"
set -gx fifc_exa_opts --icons

set -gx fzf_fd_opts --max-depth 5
set -gx fzf_preview_dir_cmd eza --all --color=always --no-quotes --icons --group-directories-first --oneline --long

fish_config theme choose "Catppuccin Mocha"
