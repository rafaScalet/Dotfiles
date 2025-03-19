status is-interactive || exit

set -g temp "$__fish_config_dir/conf.d/temp"

if type -q ~/.local/bin/mise; and not test -f "$temp.mise.fish"
  ~/.local/bin/mise activate fish > "$temp.mise.fish"
  ~/.local/bin/mise activate fish | source
end

if type -q usage; and not test -f "$temp.usage.fish"
  ~/.local/bin/mise completions fish > "$temp.usage.fish"
  usage --completions fish >> "$temp.usage.fish"
end
