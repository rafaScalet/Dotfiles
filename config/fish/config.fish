# @fish-lsp-disable 2002 
source $__fish_config_dir/alias.fish

fish_vi_key_bindings

# Don't show the vi mode in the prompt
function fish_default_mode_prompt
end

# Don't prompt a "hello" message
function fish_greeting
end

# Mise Config, needs to be outside the interactive session
if type -q mise
    mise activate fish | source
end

# Everything below this line, is only executed in interactive mode
status is-interactive || exit

# Plugins Installation
type -q fisher; or curl -sL https://git.io/fisher | source && fisher update

# Shell Integrations Config

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

if type -q tv
    tv init fish | source
end

if type -q nix-your-shell
    nix-your-shell fish | source
end

if type -q atuin
    atuin init fish | source
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
abbr v $EDITOR
abbr lzd lazydocker
abbr lzg lazygit

abbr -a --position anywhere -- --help '--help | bat -Pplhelp'
abbr -a --position anywhere -- -h '-h | bat -Pplhelp'

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
