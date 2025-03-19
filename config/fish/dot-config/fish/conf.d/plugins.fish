status is-interactive || exit

if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# fundle plugin archelaus/shell-mommy
# fundle plugin gazorby/fish-abbreviation-tips
fundle plugin halostatue/fish-utils@v4
fundle plugin jhillyerd/plugin-git
# fundle plugin joehillen/to-fish
fundle plugin jorgebucaran/autopair.fish
fundle plugin jorgebucaran/replay.fish
fundle plugin nickeb96/puffer-fish
fundle plugin rafascalet/docker-db.fish

fundle init

function fun
  fundle install
  fundle clean
  fundle update
end
