
## add extend path

# brew-Cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export PATH=/usr/local/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH

export XDG_CONFIG_HOME=$HOME/.config

# anyenv
if [ -d ~/.anyenv ]; then
  export PATH=$HOME/.anyenv/bin:$PATH
  eval "$(anyenv init -)"
fi
