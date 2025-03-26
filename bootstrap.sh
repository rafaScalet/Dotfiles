#! /bin/sh

stow --dir ~/Dotfiles \
  --ignore="assets" \
  --ignore="config" \
  --ignore="docs" \
  --ignore="examples" \
  --ignore="packages" \
  --ignore="scripts" \
  --ignore="templates" \
  --ignore="bootstrap.sh" \
  --ignore=".vscode" \
  --ignore=".git" \
  --ignore=".md" \
  .
