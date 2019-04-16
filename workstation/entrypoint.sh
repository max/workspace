#!/usr/bin/env bash

set -e

if [ ! -d ~/code/max/workspace ]; then
  echo "Cloning dotfiles"
  cd ~/code
  git clone git@github.com:max/workspace.git max/workspace
fi

cd ~/code/max/workspace

ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/zshrc ~/.zshrc
ln -s $(pwd)/gitconfig ~/.gitconfig

cd

/usr/bin/zsh
