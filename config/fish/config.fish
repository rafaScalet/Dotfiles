status is-interactive || exit

mise activate fish | source

# Shell Config
set -gx XDG_CONFIG_HOME $HOME/.config

set -gx CDPATH ~/Projects ~/Projects/* ~

set -gx LS_COLORS (vivid generate catppuccin-mocha)

set -gx EDITOR nvim

fish_config theme choose "Catppuccin Mocha"

function fish_greeting
    fastfetch --config ~/.config/fastfetch/greeting.jsonc
end

# Plugins config
if not functions -q fisher
    curl -sL https://git.io/fisher | source && fisher update
end

set -g SHELL_MOMMYS_LITTLE child/girl/boy/dev

set -g fish_tmux_config $HOME/.config/tmux/tmux.conf
set -g fish_tmux_default_session_name default
set -g fish_tmux_autostart true

set -g COMMENT_FREQ 10

set -g fifc_editor $EDITOR
set -g fifc_fd_opts --hidden
set -U fifc_bat_opts --theme="Catppuccin Mocha"
set -U fifc_exa_opts --icons --oneline --group-directories-first --all --long --git

set -g fzf_fd_opts --max-depth 5
set -g fzf_preview_dir_cmd eza --all --color=always --no-quotes --icons --group-directories-first --oneline --long

# Binds
bind --mode insert ctrl-shift-l clear-screen
bind --mode default ctrl-shift-l clear-screen

# Git Config
if not test -e ~/.gitalias
    curl -fsSL -o ~/.gitalias https://raw.githubusercontent.com/GitAlias/gitalias/refs/heads/main/gitalias.txt
end

if not test -e ~/.gitcatppuccin
    curl -fsSL -o ~/.gitcatppuccin https://raw.githubusercontent.com/catppuccin/delta/refs/heads/main/catppuccin.gitconfig
end

# Carapace Config
set -l carapace_tools \
    carapace \
    java \
    javac \
    jar \
    pnpm \
    bun

for tool in $carapace_tools
    carapace $tool fish | source
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
abbr -- - "cd -"

# Aliases
if type -q codium
    alias code="codium"
end

if type -q eza
    alias ls="eza --git --icons --oneline --group-directories-first --no-quotes"
    alias ll="eza --git --icons --oneline --group-directories-first --no-quotes --long"
    alias la="eza --git --icons --oneline --group-directories-first --no-quotes --long --all"
end

if type -q bat
    alias cat="bat"
end

if type -q python3
    alias python="python3"
end
