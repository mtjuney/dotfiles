
autoload -Uz vcs_info
precmd () { vcs_info }

zstyle ':vcs_info:*' formats "%r"
setopt prompt_subst

if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
  tab_name = $vcs_info_msg_0_
else
  tab_name = "%~"
fi

function chpwd() { echo -ne "\033]0;${tab_name}\007"}
