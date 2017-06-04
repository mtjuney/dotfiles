#!/usr/bin/sh

# gitが使えるか確認
if type git; then

  git clone https://github.com/mtjune/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles && echo "moved $HOME/.dotfiles"
  script/setup.sh

else

  echo "git not found!"
  echo "please install git"
  exit 1

fi
