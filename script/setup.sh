#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

## submoduleの読み込み
echo '[[[[ SUBMODULES ]]]]'
git submodule update --init


## dotfilesのリンクを張る
echo '[[[[ DOTFILES ]]]]'
# 主なdotfilesのリンク
DOT_FILES=("atom" "emacs.d" "gitignore_global" "gitconfig" "tmux.conf" "vimrc" "zshenv" "latexmkrc")

REFUGE_DIR="${DOTFILES_DIR}/refuge"
if [ ! -d $REFUGE_DIR ]; then
  mkdir $REFUGE_DIR && echo "[ MADE ] ${REFUGE_DIR}".
fi

TODAY=`date '+%F'`
REFUGE_TODAY_DIR="$REFUGE_DIR/$TODAY"
if [ ! -d $REFUGE_TODAY_DIR ]; then
  mkdir $REFUGE_TODAY_DIR && echo "[ MADE ] ${REFUGE_TODAY_DIR}"
fi


# 元々のdotfilesの削除または退避, 及びリンクを貼る関数.
link_dotfile(){
  SOURCEPATH=${1}
  DISTPATH=${2}
  if [ -e $DISTPATH ]; then
    if [ -L $DISTPATH ]; then
      rm $DISTPATH && echo "[ REMOVED ] ${DISTPATH}"
    else
      mv $DISTPATH "${REFUGE_TODAY_DIR}/" && echo "[ REFUGED ] ${DISTPATH}"
    fi
  fi

  ln -s $SOURCEPATH $DISTPATH
}

# DOT_FILESへのリンクを貼る
for file in ${DOT_FILES[@]}
do
  SOURCEPATH="${DOTFILES_DIR}/_.${file}"
  DISTPATH="${HOME}/.${file}"
  link_dotfile $SOURCEPATH $DISTPATH
done


link_dotfile "${DOTFILES_DIR}/_.nvimrc" "${HOME}/.config/nvim/init.vim"

