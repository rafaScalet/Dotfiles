# @fish-lsp-disable 2002 4004
if type -q chafa
    alias chafa="chafa --passthrough tmux --format kitty"
end

if type -q sudo
    alias please="sudo"
end

if type -q eza
    alias eza="eza --git --icons --oneline --group --group-directories-first --no-quotes"

    alias ls="eza"
    alias ll="eza --long"
    alias la="eza --long --all"
    alias ld="eza --long --all --treat-dirs-as-files"

    alias tree="eza --tree"
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

function prv --argument-names file
    if test -z "$file"
        echo "Need a file"
    end

    set mime (file --mime-type -b $file)

    switch $mime
        case application/pdf
            pdftoppm -png -singlefile $file | chafa -
        case 'application/*'
            cat $file
        case 'image/*'
            chafa $file
        case 'text/*'
            cat $file
        case '*'
            xdg-open $file
    end
end
