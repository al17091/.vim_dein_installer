#!/bin/sh
#Installation directory
BUNDLE_DIR=~/.vim/dein
INSTALL_DIR="$BUNDLE_DIR/dein.vim"
echo "install at $INSTALL_DIR"
if [ -d "$INSTALL_DIR" ]; then
    echo "$INSTALL_DIR already exists!"
fi

#check git command
if type git; then
    : #If you have git command, No problem.
else
    echo 'Please install git or update your path to include the git executable!'
    exit 1
fi

#check ctags command
if type ctags; then
    : #If you have ctags command, No problem
else
    echo 'Please install ctags or update your path to include the ctags executable!'
    exit 1
fi

#python3 command
if type python3; then
    : #If you have python3 command, No problem
else
    echo 'Please install python3 or update your path to include the python3 executable!'
    exit 1
fi

#make bundle dir and fetch bundle
echo 'check install directory'
if ![ -d "$INSTALL_DIR"]; then
    mkdir -p "$BUNDLE_DIR"
fi

#If install directory already exist, install will contine.
echo 'start install dein'
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/dein.vim

#Vundle Install
echo 'copy ~/.vimrc, dein.toml, dein_lazy.toml'
cp ./_vimrc ~/.vimrc
cp ./dein.toml ~/.vim/dein/dein.toml
cp ./dein_lazy.toml ~/.vim/dein/dein_lazy.toml
vim +"call dein#install()" +qall

cd
sudo rm -r ./.vim_dein_installer
