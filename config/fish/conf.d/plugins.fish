set -e plugins

function @plugin
    set -g plugins $plugins (string lower $argv[1])
end

# @plugin gazorby/fifc
@plugin budimanjojo/tmux.fish
@plugin catppuccin/fish
@plugin dracula/fish
@plugin franciscolourenco/done
@plugin gazorby/fish-git-emojis
@plugin halostatue/fish-utils
@plugin halostatue/fish-utils-core
@plugin halostatue/fish-utils-net
@plugin jhillyerd/plugin-git
@plugin jorgebucaran/autopair.fish
@plugin jorgebucaran/fisher
@plugin jorgebucaran/getopts.fish
@plugin jorgebucaran/humantime.fish
@plugin jorgebucaran/replay.fish
@plugin jorgebucaran/spark.fish
@plugin jorgebucaran/fishtape
@plugin joseluisq/gitnow
@plugin laughedelic/fish_logo
@plugin mattmc3/magic-enter.fish
@plugin meaningful-ooo/sponge
@plugin nickeb96/puffer-fish
@plugin OakNinja/MakeMeFish
@plugin PatrickF1/fzf.fish
