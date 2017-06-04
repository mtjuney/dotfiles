#users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac


source ~/.dotfiles/d_zsh/general.zshrc
source ~/.dotfiles/d_zsh/expath.zshrc
source ~/.dotfiles/d_zsh/history.zshrc
source ~/.dotfiles/d_zsh/keybind.zshrc # after expath
source ~/.dotfiles/d_zsh/shell.zshrc
source ~/.dotfiles/d_zsh/terminal.zshrc
source ~/.dotfiles/d_zsh/completion.zshrc
source ~/.dotfiles/d_zsh/prompt.zshrc
source ~/.dotfiles/d_zsh/alias.zshrc


source ~/.dotfiles/d_zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


## load user .zshrc configuration file
if [ -f ${HOME}/.zshrc.mine ]; then
  source ${HOME}/.zshrc.mine
fi
if [ -f ${HOME}/.mine.zshrc ]; then
  source ${HOME}/.mine.zshrc
fi
