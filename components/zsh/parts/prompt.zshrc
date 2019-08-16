
PROMPT_CHAR='❯'
SEGMENT_SEPARATOR='❯'
NEWLINE='
'

# colors
STATUS_COLOR=green
STATUS_ERROR_COLOR=red
CONTEXT_COLOR=cyan
K8S_COLOR=default
K8S_SEPARATOR_COLOR=cyan
DIR_COLOR=blue
GIT_COLOR=white

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

# k8s Setting
if [ -f /usr/local/opt/kube-ps1/share/kube-ps1.sh ]; then
  source /usr/local/opt/kube-ps1/share/kube-ps1.sh
  KUBE_PS1_CTX_COLOR=magenta
fi

prompt_segment() {
  local segment_content="$1"
  local color="$2"
  local separator_color="$3"
  [[ -n "$separator_color" ]] || separator_color="${color}"
  [[ -n "$segment_content" ]] && segment_content=" $segment_content "
  echo -n "${fg_bold[$color]}$segment_content${fg_bold[$separator_color]}$SEGMENT_SEPARATOR${reset_color}"
 }

prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡%f"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="⚙"

  if [[ -n "$symbols" && $RETVAL -ne 0 ]]; then
    prompt_segment "$symbols" $STATUS_ERROR_COLOR
  elif [[ -n "$symbols" ]]; then
    prompt_segment "$symbols" $STATUS_COLOR
  else
    prompt_segment "" $STATUS_COLOR
  fi

}

context() {
  local user="$(whoami)"
	[[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]] && echo -n "${user}@%m"
}

prompt_context() {
  local _context="$(context)"
  [[ -n "$_context" ]] && prompt_segment "$_context" $CONTEXT_COLOR
}

prompt_dir() {
  local dir=''
  dir="${dir}%4(c:...:)%3c"
  prompt_segment $dir $DIR_COLOR
}

prompt_k8s() {
  if $(kube_ps1 >/dev/null 2>&1); then
    local content="$(kube_ps1)"
    prompt_segment $content $K8S_COLOR $K8S_SEPARATOR_COLOR
  fi
}

prompt_git() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    local content="\ue0a0 ${vcs_info_msg_0_}"
    prompt_segment $content $GIT_COLOR
  fi
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
  prompt_k8s
  prompt_dir
  prompt_git
}

PROMPT=''
PROMPT="$PROMPT$NEWLINE"
PROMPT="$PROMPT$SEGMENT_SEPARATOR$SEGMENT_SEPARATOR"
PROMPT="$PROMPT"'$(build_prompt)'
PROMPT="$PROMPT$NEWLINE"
PROMPT="$PROMPT"'%{${fg_bold[default]}%}'
PROMPT="$PROMPT"'$(prompt_char) %{$reset_color%}'
