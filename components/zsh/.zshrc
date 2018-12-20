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

ZSH_DIR="${HOME}/.dotfiles/components/zsh"
PARTS_DIR="${ZSH_DIR}/parts"

source ${PARTS_DIR}/general.zshrc
source ${PARTS_DIR}/expath.zshrc
source ${PARTS_DIR}/alias.zshrc
source ${PARTS_DIR}/keybind.zshrc # after expath alias
source ${PARTS_DIR}/shell.zshrc
source ${PARTS_DIR}/terminal.zshrc
source ${PARTS_DIR}/completion.zshrc
source ${PARTS_DIR}/prompt.zshrc


source ${ZSH_DIR}/submodules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${ZSH_DIR}/submodules/zsh-autosuggestions/zsh-autosuggestions.zsh


## load user .zshrc configuration file
if [ -f ${HOME}/.zshrc.mine ]; then
  source ${HOME}/.zshrc.mine
fi
if [ -f ${HOME}/.mine.zshrc ]; then
  source ${HOME}/.mine.zshrc
fi
