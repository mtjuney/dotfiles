#!/bin/bash

## submoduleの読み込み
echo '[[[[ Submodules ]]]]'
git submodule update --init


## dotfilesのリンクを張る
echo '[[[[ Dotfiles ]]]]'
# 主なdotfilesのリンク
DOT_FILES=("atom" "emacs.d" "gitignore_global" "tmux.conf" "vimrc" "zshenv" "latexmkrc")

if [ ! -d $HOME/.dotfiles/refuge ]; then
  fimkdir $HOME/.dotfiles/refuge
  echo "Made directory refuge".
fi

TODAY=`date '+%F'`

if [ ! -d $HOME/.dotfiles/refuge/$TODAY ]; then
  mkdir $HOME/.dotfiles/refuge/$TODAY
  echo "Made directory $TODAY in refuge."
fi


# 元々のdotfilesの削除または退避, 及びリンクを貼る関数.
link_dotfile(){
  SOURCEPATH=${1}
  DISTPATH=${2}
  if [ -e $DISTPATH ]; then
    if [ -L $DISTPATH ]; then
      rm $DISTPATH && echo "[ REMOVED ] ${DISTPATH}"
    else
      mv $DISTPATH $HOME/.dotfiles/refuge/$TODAY/ && echo "[ REFUGED ] ${DISTPATH}"
    fi
  fi

  ln -s $SOURCEPATH $DISTPATH
}

# DOT_FILESへのリンクを貼る
for file in ${DOT_FILES[@]}
do
  SOURCEPATH="${HOME}/.dotfiles/_.${file}"
  DISTPATH="${HOME}/.${file}"
  link_dotfile $SOURCEPATH $DISTPATH
done


link_dotfile "$HOME/.dotfiles/_.nvimrc" "$HOME/.config/nvim/init.vim"

