
## add extend path

# brew-Cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export PATH=/usr/local/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# anyenv setting
if [ -d ~/.anyenv ]; then
  export PATH=$HOME/.anyenv/bin:$PATH
  eval "$(anyenv init - --no-rehash)"
fi

# direnv setting
if type direnv > /dev/null 2>&1; then
  export EDITOR=vim
  eval "$(direnv hook zsh)"
fi
