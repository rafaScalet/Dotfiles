function fish_default_mode_prompt ; end

if type -q starship
	function starship_transient_prompt_func
		echo -n (set_color blue)" "
	end

	starship init fish | source

	enable_transience
end

