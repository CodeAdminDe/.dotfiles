#!/bin/bash

OH_MY_ZSH_SETUP=https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

#sudo if needed
sudo -v

# (Re-)Install oh-my-zsh
echo "(Re-)Install oh-my-zsh"
rm -rf $HOME/.oh-my-zsh
curl -L $OH_MY_ZSH_SETUP | sh

# symlink .zshrc
echo "symlink .zshrc"
rm $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
echo "Installation done!"
