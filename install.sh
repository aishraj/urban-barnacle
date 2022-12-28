#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -xe

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim
ln -s $(pwd)/emacs $HOME/.emacs
ln -s $(pwd)/screenrc $HOME/.screenrc

vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"

DOTFILES=/workspaces/.codespaces/.persistedshare/dotfiles

# Install fish
sudo apt-get update -y
sudo apt-get install fish -y


# Install Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# Install Oh My Fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

rm -rf ~/.config
ln -s $(pwd)/.config $HOME/.config
