#!/bin/bash

ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.p10k.zsh ~/.p10k.zsh

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "# macOS specific settings" >> ~/.zshrc.local
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "# Linux specific settings" >> ~/.zshrc.local
fi

echo "[ -f ~/.zshrc.local ] && source ~/.zshrc.local" >> ~/.zshrc
