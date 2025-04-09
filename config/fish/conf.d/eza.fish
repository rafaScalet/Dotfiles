set -gx __eza_base_parameters --git --no-quotes --icons --group-directories-first --oneline --long

if type -q eza
    function ls --wraps eza
        eza $__eza_base_parameters --no-permissions --no-user --no-filesize --no-time $argv
    end
    function la --wraps eza
        eza $__eza_base_parameters --all $argv
    end
    function ll --wraps eza
        eza $__eza_base_parameters $argv
    end
end
