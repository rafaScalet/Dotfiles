if test $GREETING -eq 1
  function fish_greeting
    fastfetch --config ~/.config/fastfetch/greeting.jsonc 2> /dev/null
  end
else
  set -g fish_greeting
end
