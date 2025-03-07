status is-interactive || exit

if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end # install fundle

function fish_default_mode_prompt ;end # disable the vi mode view in prompt

if type -q codium; alias code='codium'; end # replace code command for codium if is installed
if test -f ~/.aliasrc; source ~/.aliasrc; end

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
