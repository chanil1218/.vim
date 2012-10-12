#!/bin/sh
exec ln -s ~/.vim/vimrc ~/.vimrc
exec vim +BundleInstall +qall
