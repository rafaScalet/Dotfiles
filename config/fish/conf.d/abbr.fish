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
abbr nv nvim
abbr vi nvim
abbr vim nvim
abbr m mise
abbr c cat

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
