status is-interactive || exit

if not test -e ~/.gitalias
    curl -fsSL -o ~/.gitalias https://raw.githubusercontent.com/GitAlias/gitalias/refs/heads/main/gitalias.txt
end

if not test -e ~/.gitcatppuccin
    curl -fsSL -o ~/.gitcatppuccin https://raw.githubusercontent.com/catppuccin/delta/refs/heads/main/catppuccin.gitconfig
end
