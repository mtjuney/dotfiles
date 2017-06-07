#!/bin/bash

## submoduleの読み込み
git submodule update --init


## dotfilesのリンクを張る

# 主なdotfilesのリンク
DOT_FILES=("atom" "emacs.d" "tmux" "gitignore_global" "tmux.conf" "vimrc" "zshenv" "latexmkrc")

if [ ! -d $HOME/.dotfiles/refuge ]; then
	mkdir $HOME/.dotfiles/refuge
	echo "Made directory refuge".
fi

TODAY=`date '+%F'`

if [ ! -d $HOME/.dotfiles/refuge/$TODAY ]; then
	mkdir $HOME/.dotfiles/refuge/$TODAY
	echo "Made directory $TODAY in refuge."
fi


# 元々のdotfilesの削除または退避, 及びリンクを貼る関数.
link_dotfiles(){
	FILENAME=${1}
	if [ -e $HOME/.$FILENAME ]; then
		if [ -L $HOME/.$FILENAME ]; then
			rm $HOME/.$FILENAME && echo "$FILENAME is synbolic link. Removed"
		else
			mv $HOME/.$FILENAME $HOME/.dotfiles/refuge/$TODAY/ && echo "$FILENAME is not synbolic link. Moved to refuge"
		fi
	fi

	ln -s $HOME/.dotfiles/_.$FILENAME $HOME/.$FILENAME && echo "Made synbolic link $FILENAME"
}


# DOT_FILESへのリンクを貼る
for file in ${DOT_FILES[@]}
do
	link_dotfiles $file
done

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $HOME/.config/nvim
ln -s $HOME/.dotfiles/_.nvimrc $HOME/.config/nvim/init.vim
