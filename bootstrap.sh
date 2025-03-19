#! /bin/sh

stow --dir ~/Dotfiles \
  --ignore="config" \
  --ignore="templates" \
  --ignore="assets" \
  --ignore="packages" \
  --ignore="bootstrap.sh" \
  --ignore=".vscode" \
  --ignore=".git" \
  --ignore=".md" \
  .
