# @fish-lsp-disable 2002 2003
status is-interactive || exit

# Utils Config
set -gx GOPATH $HOME/.local/share/go

# Shell Config
set -gx MANPAGER "env BATMAN_IS_BEING_MANPAGER=yes bash /usr/bin/batman"
set -gx MANROFFOPT -c

set -gx CDPATH ~/Projects ~/Projects/* ~

set -gx EDITOR nvim

type -q vivid; and set -gx LS_COLORS (vivid generate catppuccin-mocha)

fish_config theme choose "Catppuccin Mocha"

fish_vi_key_bindings

function fish_greeting
    type -q fastfetch; and fastfetch
end

# Tmux Config 
if type -q tmux
    if not set -q TMUX
        set session_name Default

        if tmux has-session -t $session_name
            exec tmux attach-session -t $session_name
        else
            tmux new-session -d -s Dotfiles -c $HOME/Dotfiles/
            tmux new-session -d -s Projects -c $HOME/Projects/
            exec tmux new-session -s $session_name
        end
    end
end

# Plugins Config
if not functions -q fisher
    curl -sL https://git.io/fisher | source && fisher update
end

set -g SHELL_MOMMYS_LITTLE child/girl/boy/dev

set -g fish_tmux_config $XDG_CONFIG_HOME/tmux/tmux.conf
set -g fish_tmux_default_session_name Default
set -g fish_tmux_autostart true
set -g fish_tmux_autoquit false

set -g COMMENT_FREQ 10

set -g fifc_editor $EDITOR
set -g fifc_fd_opts --hidden --exclude "**/.git"
set -U fifc_bat_opts --theme=Mocha --number
set -U fifc_exa_opts --icons --oneline --group-directories-first --all

set -g fzf_fd_opts --max-depth 5 --hidden --exclude "**/.git"
set -U fzf_preview_dir_cmd eza --icons --oneline --group-directories-first --all --color=always --tree
set -U fzf_diff_highlighter delta --paging=never --width=20
set -U fzf_preview_file_cmd bat --color=always --number --theme=Mocha

# Abbreviations
abbr q exit
abbr md "mkdir -p"
abbr . "cd ."
abbr -- - "cd -"

# Aliases
if type -q eza
    set base_params "--git --icons --oneline --group --group-directories-first --no-quotes"

    alias ls="eza $base_params"
    alias ll="eza $base_params --long"
    alias la="eza $base_params --long --all"
    alias ld="eza $base_params --long --all --treat-dirs-as-files"
end

if type -q bat
    alias cat="bat --pager never"
else if type -q bat-cat
    alias cat="bat-cat --pager never"
end

if type -q http
    alias hp="http --format-options json.indent:2"
end
