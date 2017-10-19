## Alias configration
# expand aliases before completing

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
	alias ls="ls -G -F"
	;;
linux*)
	alias ls="ls --color=auto"
	;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias lla="ls -la"

alias du="du -h"
alias df="df -h"

alias su="su -l"

# alias for tmux
alias tma="tmux attach"
alias tmd="tmux detach"
alias tmat="tmux attach -t"
alias tmls="tmux ls"
alias tmrenamet="tmux rename -t"
alias tmkillt="tmux kill-session -t"
alias tmkillall="tmux kill-server"
alias tmnews="tmux new-session -s"

# global alias
alias -g P='| peco'
alias -g G='| grep'
alias -g L='| less'


# alias for git
alias gich="git checkout"
alias gicom="git commit"
alias gicomm="git commit -m"
alias gipmaster="git push origin master"
alias gipdevelop="git push origin develop"

if ! which tac &> /dev/null; then
	alias tac="tail -r"
fi

function gitbeer() {
	git add .;
	git commit -m '🍺';
}

function gitfix() {
	git add .;
	git commit -m 'bugfix';
}

# Vim
if which nvim &> /dev/null; then
	alias vim='nvim'
fi

# others
alias jn="jupyter notebook"
alias jl="jupyter lab"
alias ns="nvidia-smi"
