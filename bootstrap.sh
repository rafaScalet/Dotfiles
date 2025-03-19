#! /bin/sh

stow --dir ~/Dotfiles \
  --ignore="config" \
  --ignore="packages" \
  --ignore=".vscode" \
  --ignore=".git" \
  --ignore=".md" \
  .
