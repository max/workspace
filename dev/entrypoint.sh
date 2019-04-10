#!/usr/bin/env bash

set -e

if [ ! -d ~/code/dotfiles ]; then
  echo "Cloning dotfiles"
  cd ~/code
  git clone git@github.com:max/workspace.git
fi

cd ~/code/workspace

ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/zshrc ~/.zshrc
ln -s $(pwd)/gitconfig ~/.gitconfig

/usr/bin/zsh
