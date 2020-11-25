#!/bin/bash

# source OS specific scripts
if [[ "$OSTYPE" == "darwin"* ]] ; then
  source "macos.bash"

elif [[ "$OSTYPE" == "linux-gnu" ]] ; then
  source "linux.bash"
fi

# source bash config
if [[ "$OSTYPE" == "darwin"* ]] ; then
  source "$HOME/.bash_profile"
else
  source "$HOME/.bashrc"
fi

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install fzf
git clone https://github.com/junegunn/fzf.git "$HOME/.fzf"
source "$HOME/.fzf/install" --all

# symlink dotfiles
source "symlinks.bash"
