if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# fundle plugin adamchristiansen/vertical-fish
fundle plugin Alaz-Oz/fish-insulter
# fundle plugin archelaus/shell-mommy
# fundle plugin daleeidd/natural-selection
# fundle plugin gazorby/fish-abbreviation-tips
# fundle plugin halostatue/fish-macos
fundle plugin halostatue/fish-utils
fundle plugin halostatue/fish-utils-core
fundle plugin halostatue/fish-utils-net
fundle plugin IlanCosman/tide
fundle plugin jhillyerd/plugin-git
# fundle plugin joehillen/to-fish
fundle plugin jorgebucaran/autopair.fish
fundle plugin jorgebucaran/humantime.fish
# fundle plugin jorgebucaran/hydro
fundle plugin jorgebucaran/replay.fish
fundle plugin laughedelic/fish_logo
# fundle plugin mattmc3/magic-enter.fish
fundle plugin meaningful-ooo/sponge
fundle plugin nickeb96/puffer-fish
fundle plugin OakNinja/MakeMeFish
# fundle plugin paysonwallach/fish-you-should-use
# fundle plugin pure-fish/pure
fundle plugin rafascalet/docker-db.fish

fundle init

function fun
  fundle install
  fundle clean
  fundle update
end
