
# CUDA & cuDNN Setting
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export CPATH=/usr/local/cuda/include:$CPATH
export LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH

# golang Setting
export GOPATH=$HOME/golang
export PATH=$GOPATH/bin:$PATH

# anyenv setting
if [ -d ~/.anyenv ]; then
  export PATH=$HOME/.anyenv/bin:$PATH

  if [ -d ~/.anyenv/envs/pyenv/bin ]; then
    export PATH=$HOME/.anyenv/envs/pyenv/bin:$PATH
  fi

  eval "$(anyenv init - --no-rehash)"
fi



# direnv setting
if type direnv > /dev/null 2>&1; then
  export EDITOR=vim
  eval "$(direnv hook zsh)"
fi

