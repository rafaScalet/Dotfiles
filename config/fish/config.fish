# @fish-lsp-disable 2002 
source $__fish_config_dir/alias.fish

set -gx ONLYOFFICE_PARAM --system-title-bar

# Shell Config
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_BIN_HOME $HOME/.local/bin
set -gx DOTFILES_DIR $HOME/Dotfiles
set -gx SCRIPTS_DIR $DOTFILES_DIR/scripts

set -gx PATH $SCRIPTS_DIR $XDG_BIN_HOME $XDG_DATA_HOME/nvim/mason/bin/ $PATH

set -gx MANPAGER "env BATMAN_IS_BEING_MANPAGER=yes bash /usr/bin/batman"
set -gx MANROFFOPT -c

set -gx CDPATH ~/Projects ~

fish_vi_key_bindings

# This function is masked and does nothing
function fish_default_mode_prompt
end

# ATAC Config
set -gx ATAC_KEY_BINDINGS $XDG_CONFIG_HOME/atac-vim.toml
set -gx ATAC_THEME $XDG_CONFIG_HOME/atac-theme.toml

# Everything below this line, is only executed in interactive mode
status is-interactive || exit

# Plugins Installation
type -q fisher; or curl -sL https://git.io/fisher | source && fisher update

# Shell Integrations Config
type -q nvim; and set -gx EDITOR nvim; or set -gx EDITOR vim

set -gx GOPATH $XDG_DATA_HOME/go
set -gx PATH $GOPATH/bin $PATH

set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx PATH $CARGO_HOME/bin $PATH

set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup

function fish_greeting
    type -q fastfetch; and fastfetch
end

# FZF Config
set -gx FZF_DEFAULT_OPTS "
--bind 'ctrl-y:execute-silent(wl-copy {})'
--bind ctrl-b:preview-up
--bind ctrl-f:preview-down
--bind alt-k:preview-up
--bind alt-j:preview-down
--bind home:preview-top
--bind end:preview-bottom
--bind change:first
--style full
--cycle
--tmux bottom,99%
--prompt '➜ '
--pointer '➜'
--scrollbar '▌▐'
--layout reverse
--color bg:-1,bg+:-1
--color fg:-1,fg+:-1
--color hl:red,hl+:red
--color info:green,marker:yellow,header:yellow
--color prompt:magenta,spinner:magenta
--color pointer:red,border:blue,label:cyan
"

# Tmux Config 
if type -q tmux
    if not set -q TMUX; and test "$TERM_PROGRAM" != vscode
        if not tmux has-session -t Default
            tmux new -d -s Default
        end

        exec tmux attach -t Default
    end
end

# Starship Config
if type -q starship
    starship init fish | source

    function starship_transient_prompt_func
        starship module character
    end

    function starship_transient_rprompt_func
        starship module time
    end

    enable_transience
end

# Shell Theme Config
if test (gsettings get org.gnome.desktop.interface color-scheme) = "'prefer-dark'"
    fish_config theme choose "Catppuccin Mocha"
    type -q vivid; and set -gx LS_COLORS (vivid generate catppuccin-mocha)
else
    fish_config theme choose "Catppuccin Latte"
    type -q vivid; and set -gx LS_COLORS (vivid generate catppuccin-latte)
end

# Abbreviations
abbr q exit
abbr md "mkdir -p"
abbr . "cd ."
abbr -- - "cd -"
abbr upgrade topgrade
abbr e $EDITOR
abbr lzd lazydocker
abbr lzg lazygit

# Binds
bind --mode insert ctrl-alt-g lazygit
bind --mode default ctrl-alt-g lazygit

bind --mode insert ctrl-alt-d lazydocker
bind --mode default ctrl-alt-d lazydocker

bind --mode insert ctrl-alt-b btm
bind --mode default ctrl-alt-b btm

bind --mode insert ctrl-alt-e $EDITOR
bind --mode default ctrl-alt-e $EDITOR

bind --mode insert ctrl-alt-r "clear && exec fish"
bind --mode default ctrl-alt-r "clear && exec fish"
