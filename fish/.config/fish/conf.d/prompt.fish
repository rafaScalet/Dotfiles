switch $PROMPT
  case "starship"
    function starship_transient_prompt_func
      echo -n (set_color blue)" "
    end

    starship init fish | source

    enable_transience
  case "ohmyposh"
    oh-my-posh init --config ~/.config/ohmyposh/$OHMYPOSH_THEME.json fish | source
end
