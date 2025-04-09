if type -q eza
    function ls --wraps eza
        eza --git --icons --long --no-permissions --no-user --no-time --no-filesize --group-directories-first $argv
    end
    function la --wraps eza
        eza --git --icons --long --all --group-directories-first $argv
    end
    function ll --wraps eza
        eza --git --icons --long --group-directories-first $argv
    end
end
