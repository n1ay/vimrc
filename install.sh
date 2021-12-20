#!/bin/bash
curr_dir="$(pwd)"
[ -e ~/.vim/bundle/Vundle.vim ] || (echo 'Installing Vundle, the vim addon manager...'; git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim)

cp vimrc ~/.vimrc
echo 'Installing vim plugins with Vundle...'
vim +PluginInstall +qall

echo 'Setting up YCM...'
ycm_deps='build-essential cmake python3-dev'

dpkg -l $ycm_deps || (echo "Please provide a password to install $ycm_deps"; sudo apt install -y $ycm_deps || (echo "Can't setup YCM without requested requirements"; exit 1))
cd ~/.vim/bundle/YouCompleteMe
python3 ./install.py --clang-completer && cd "$curr_dir"

