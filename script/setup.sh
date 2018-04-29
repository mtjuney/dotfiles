#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

## submoduleの読み込み
echo '[[[[ SUBMODULES ]]]]'
git submodule update --init

## dotfilesのリンクを張る
echo '[[[[ DOTFILES ]]]]'
python $DOTFILES_DIR/script/setup.py
