status is-interactive || exit

# Shell Config
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME $HOME/.config

set -q CDPATH; or set -gx CDPATH ~/Projects ~/Projects/* ~

set -q EDITOR; or set -gx EDITOR nvim

fish_config theme choose "Catppuccin Mocha"

function fish_greeting
    fastfetch --config ~/.config/fastfetch/greeting.jsonc
end

function fish_reload
    clear
    exec fish
end

# Plugins config
if not functions -q fisher
    curl -sL https://git.io/fisher | source && fisher update
end

set -gx SHELL_MOMMYS_LITTLE child/girl/boy/dev

set -gx fish_tmux_config $HOME/.config/tmux/tmux.conf
set -gx fish_tmux_default_session_name default
set -gx fish_tmux_autostart true

set -gx COMMENT_FREQ 10

set -gx fifc_bat_opts --theme="Catppuccin Mocha"
set -gx fifc_exa_opts --icons

set -gx fzf_fd_opts --max-depth 5
set -gx fzf_preview_dir_cmd eza --all --color=always --no-quotes --icons --group-directories-first --oneline --long

# Binds
bind --mode insert ctrl-shift-l clear-screen
bind --mode default ctrl-shift-l clear-screen

bind --mode insert ctrl-alt-r fish_reload
bind --mode default ctrl-alt-r fish_reload

# Git Config
if not test -e ~/.gitalias
    curl -fsSL -o ~/.gitalias https://raw.githubusercontent.com/GitAlias/gitalias/refs/heads/main/gitalias.txt
end

if not test -e ~/.gitcatppuccin
    curl -fsSL -o ~/.gitcatppuccin https://raw.githubusercontent.com/catppuccin/delta/refs/heads/main/catppuccin.gitconfig
end

# Starship Config
if type -q starship
    function starship_transient_prompt_func
        echo -n (set_color blue)" "
    end

    function starship_transient_rprompt_func
        starship module time
    end

    starship init fish | source

    enable_transience
end

# Abbreviations
abbr dot "stow --stow"
abbr undot "stow --delete"
abbr redot "stow --restow"
abbr lzg lazygit
abbr lzd lazydocker
abbr q exit
abbr md "mkdir -p"
abbr A "cd ~/Annotations"
abbr D "cd ~/Dotfiles"
abbr P "cd ~/Projects"
abbr . "cd ."
abbr ~ "cd ~"
abbr .. "cd .."
abbr -- - "cd -"
abbr s source
abbr n nvim
abbr m mise
abbr c cat

# Aliases
if command -q codium
    alias code="codium"
end

if command -q eza
    alias ls="eza --git --icons --long --group-directories-first --no-quotes --no-user --no-permissions --no-time"
    alias la="eza --git --icons --long --group-directories-first --no-quotes --all"
    alias ll="eza --git --icons --long --group-directories-first --no-quotes"
end

if command -q bat
    alias cat="bat"
end

if command -q python3
    alias python="python3"
end
