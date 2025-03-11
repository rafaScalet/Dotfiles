status is-interactive || exit

if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin jorgebucaran/autopair.fish
fundle plugin jorgebucaran/replay.fish
fundle plugin rafascalet/docker-db.fish
fundle plugin jhillyerd/plugin-git
fundle plugin nickeb96/puffer-fish
fundle plugin gazorby/fish-abbreviation-tips
fundle plugin halostatue/fish-utils@v4
fundle plugin archelaus/shell-mommy
fundle plugin joehillen/to-fish

fundle init

function fun
  fundle install
  fundle clean
  fundle update
end
