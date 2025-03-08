status is-interactive || exit

set -Ux temp "$__fish_config_dir/conf.d/temp"

if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

function fish_default_mode_prompt ;end

type -q codium; and alias code='codium'

type -q bat; and alias cat='bat'

test -f ~/.aliases; and string replace '="' ' "' (cat ~/.aliases) | source

type -q thefuck; and test -f "$temp.fuck.fish" || thefuck --alias > "$temp.fuck.fish"

type -q zoxide; and test -f "$temp.zoxide.fish" || zoxide init fish --cmd cd > "$temp.zoxide.fish"

alias r='source ~/.config/fish/config.fish'

function __get_dotfiles_dir
  if test -f ~/.stowrc
    string replace "dir=" "" (cat ~/.stowrc | grep dir | cut -c3-)
  end
end

function __get_pack_dir
  echo "$(__get_dotfiles_dir)/.packages"
end

function fun
  fundle install
  fundle clean
  fundle update
end
