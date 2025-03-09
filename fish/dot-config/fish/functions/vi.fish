function vi
  if set -q __vi_mode_enabled
    set -e __vi_mode_enabled
    fish_default_key_bindings
    echo vi is disable
  else
    set -Ux __vi_mode_enabled 1
    fish_vi_key_bindings
    echo vi is enable
  end
end
