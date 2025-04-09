if test -z "$NVIM"
    function fish_greeting
        fastfetch --config ~/.config/fastfetch/greeting.jsonc 2>/dev/null
    end
else
    function fish_greeting
        set -l colors (set_color --print-colors)
        set -l random_index (random 1 (count $colors))
        set_color $colors[$random_index]
        figlet nvim btw -f slant
        set_color normal
    end
end
