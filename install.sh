#!/bin/bash

OH_MY_ZSH_SETUP="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
LOCAL="no"

# local / devcontainer
# Devcontainer default env does have REMOTE_CONTAINERS=true
if [ "$REMOTE_CONTAINERS" != "true" ]; then
    LOCAL="yes"
    echo "Local env detected. Asking for sudo permissions ..."
    sudo -v
else
    echo "Devcontainer env detected. Skipping sudo permission request ..."
fi

# (Re-)Install oh-my-zsh
echo "(Re-)Install oh-my-zsh..."
rm -rf "$HOME/.oh-my-zsh"

# Non-interactive installation for envs other than local
# CHSH=no: Disables trying to set default shlett via chsh
# RUNZSH=no: Disables trying to open a zsh-session by default.
curl -fsSL $OH_MY_ZSH_SETUP | CHSH=$LOCAL RUNZSH=$LOCAL sh

# symlink .zshrc
echo "Set symlink for .zshrc..."
rm -f "$HOME/.zshrc" # (-f)orce, even if not exists to avoid interrput.
ln -s "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"

echo "Installation successfully! 🎉"
