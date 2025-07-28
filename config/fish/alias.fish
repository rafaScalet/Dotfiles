# @fish-lsp-disable 2002 4004
if type -q eza
    set base_params --git --icons --oneline --group --group-directories-first --no-quotes

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

if type -q fastfetch
    alias fetch="fastfetch -c examples/7.jsonc"
end

if type -q http
    alias hp="http --format-options json.indent:2"
end
