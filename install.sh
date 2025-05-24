#!/bin/bash

ln -sf $(pwd)/vim/.vimrc ~/.vimrc
ln -sf $(pwd)/zsh/.p10k.zsh ~/.p10k.zsh
ln -sf $(pwd)/tmux/.tmux.conf ~/.tmux.conf

ln -sf $(pwd)/fastfetch ~/.config/fastfetch

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "I'm on MacOS!"
    ln -sf $(pwd)/zsh/.zshrc.mac ~/.zshrc
    ln -sf $(pwd)/ghostty ~/.config/ghostty
    ln -sf $(pwd)/kitty ~/.config/kitty
    ln -sf $(pwd)/yabai ~/.config/yabai
    ln -sf $(pwd)/skhd ~/.config/skhd
    ln -sf $(pwd)/sketchybar ~/.config/sketchybar
    ln -sf $(pwd)/karabiner  ~/.config/karabiner

	
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "I'm on Debian!"
    ln -sf $(pwd)/zsh/.zshrc.deb ~/.zshrc
fi

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

grep -qxF '[ -f ~/.zshrc.local ] && source ~/.zshrc.local' ~/.zshrc || echo '[ -f ~/.zshrc.local ] && source ~/.zshrc.local' >> ~/.zshrc

