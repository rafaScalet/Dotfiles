## Dotfiles

My personal dotfiles for all tools that I use. using GNU Stow to manage then. In the most cases, just add the [catppuccin](https://catppuccin.com/) color theme.

### tools

- [bat](https://github.com/sharkdp/bat) - a replacement for the default `cat` command, using [catppuccin](https://github.com/catppuccin/bat).
- [codium](https://vscodium.com/) - open source binaries of vscode.
- [fastfetch](https://github.com/fastfetch-cli/fastfetch) - A better neofetch, with a greeting config.
- [fish](https://fishshell.com/) - my plugins, abbreviations and aliases for fish, using [catppuccin](https://github.com/catppuccin/fish).
- [ghostty](https://ghostty.org/) - the best terminal emulator that I ever use, using [catppuccin](https://github.com/catppuccin/ghostty).
- [git](https://git-scm.com/) - my alias and credentials for git, i use if i don't have installed `git-delta` yet.
- [git-delta](https://github.com/dandavison/delta) - a pager for `git diff`, using [catppuccin](https://github.com/catppuccin/delta).
- [lazygit](https://github.com/jesseduffield/lazygit) - a TUI to work better with git, using [catppuccin](https://github.com/catppuccin/starship).
- [mise](https://mise.jdx.dev/) - tool, task and env manager
- [neovim](https://neovim.io/) - a terminal based text editor.
- [starship](https://starship.rs/) - a cross platform shell prompt, using my own config.
- [starship-catppuccin](https://starship.rs/) - a starship config based on [gruvbox-rainbow](https://starship.rs/presets/gruvbox-rainbow) using [catppuccin](https://github.com/catppuccin/starship) color scheme.
- [tmux](https://github.com/tmux/tmux) - my keybindings and other stuffs, using [catppuccin](https://github.com/catppuccin/tmux).

### Usage

Using the default GNU stow command:

```bash
stow --dir ~/Dotfiles --target $HOME --stow fish
```

or using the fish plugin [dotfiles.fish](https://github.com/rafaScalet/Dotfiles.fish) (does not exist yet, see [Setups.fish](https://github.com/rafascalet/setups.fish)):

```bash
dot fish
```

### Extensions

to install automatically all the codium and gnome extensions, run these two commands:

- VS Codium:

```bash
xargs -a codium-extensions.txt -I % codium --install-extension %
```

- Gnome:

```bash
xargs -a gnome-extensions.txt -I % gext install %
```

to sync the extensions that already installed, run these two commands:

- VS Codium:

```bash
codium --list-extensions > ~/Dotfiles/codium-extensions.txt
```

- Gnome

```bash
gext ls --only-uuid > ~/Dotfiles/gnome-extensions.txt
```
