

CONTEXT_BG=cyan
CONTEXT_FG=black
GIT_BG=white
GIT_FG=black
STATUS_FG=white
STATUS_BG=green
STATUS_ERROR_BG=red
DIR_FG=white
DIR_BG=blue
PROMPT_CHAR='$'
SEGMENT_SEPARATOR='\ue0b0'

NEWLINE='
'

# Git Setting
autoload -Uz vcs_info
precmd () {
  vcs_info

  # 現在のリポジトリ名をitermのタブに表示
  local tab_name=''
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    tab_name="$(basename `git rev-parse --show-toplevel`)"
  fi

  echo -ne "\033]0;${tab_name}\007"
}

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr " %F{green}✚%F{black}"
zstyle ':vcs_info:git:*' unstagedstr " %F{blue}✹%F{black}"
zstyle ':vcs_info:*' formats "%b%c%u%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
setopt prompt_subst

CURRENT_BG='NONE'

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡%f"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="⚙"

  if [[ -n "$symbols" && $RETVAL -ne 0 ]]; then
    prompt_segment $STATUS_ERROR_BG $STATUS_FG "$symbols"
  elif [[ -n "$symbols" ]]; then
    prompt_segment $STATUS_BG $STATUS_FG "$symbols"
  fi

}

context() {
  local user="$(whoami)"
	[[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]] && echo -n "${user}@%m"
}

prompt_context() {

  local _context="$(context)"
  [[ -n "$_context" ]] && prompt_segment $CONTEXT_BG $CONTEXT_FG "$_context"
}

prompt_dir() {
  local dir=''
  dir="${dir}%4(c:...:)%3c"
  prompt_segment $DIR_BG $DIR_FG $dir
}

prompt_git() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    prompt_segment $GIT_BG $GIT_FG
    echo -n "\ue0a0 ${vcs_info_msg_0_}"
  fi
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

prompt_char() {
  local prompt_char
  prompt_char=""
  prompt_char="${PROMPT_CHAR}"
  prompt_char="%(!.%F{red}#.%F{green}${prompt_char}%f)"
  echo -n $prompt_char
}

build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_context
  prompt_dir
  prompt_git
  prompt_end
}

PROMPT=''
PROMPT="$PROMPT$NEWLINE"
PROMPT="$PROMPT"'%{%f%b%k%}$(build_prompt)'
PROMPT="$PROMPT$NEWLINE"
PROMPT="$PROMPT"'%{${fg_bold[default]}%}'
PROMPT="$PROMPT"'$(prompt_char) %{$reset_color%}'
