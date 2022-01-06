#!/bin/bash

echo "Hi!"

pkgs='zsh tmux neovim git'
for pkg in $pkgs; do
    echo "Installing $pkg..."
    sudo apt install $pkg
done

echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install 

echo "Installing Oh My Zsh..."
sh -c "$(curl-fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended 

echo "Installing Oh My Zsh plugins: fast-syntax-highlighting, zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

echo "Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Making symlinks..."
ln -isv ~/dotfiles/.cmtm.sh ~
ln -isv ~/dotfiles/.gitconfig ~
ln -isv ~/dotfiles/.tmux.conf ~
mkdir -pv ~/.config/nvim && ln -isv ~/dotfiles/init.lua ~/.config/nvim && ln -isv ~/dotfiles/lua ~/.config/nvim
# exit

echo "Changing login shell..."
chsh -s $(which zsh)

echo "Done. Starting zsh..."
exec zsh
