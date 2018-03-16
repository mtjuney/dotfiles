## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete


# peco
if which peco &> /dev/null; then
	function peco-history-selection() {
		BUFFER=$(\history -n 1 | tac | awk '!a[$0]++' | peco --query "$LBUFFER")
		CURSOR=$#BUFFER
		zle reset-prompt
	}
	zle -N peco-history-selection
	bindkey '^R' peco-history-selection
fi

if [which peco &> /dev/null] && [which ghq &> /dev/null]; then
	function peco-ghq-cd () {
	local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
	}
	zle -N peco-ghq-cd
	bindkey '^]' peco-ghq-cd
fi