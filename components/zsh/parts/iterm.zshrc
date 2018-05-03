
function chpwd() {
  local tab_name = ''
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    tab_name = "$(basename `git rev-parse --show-toplevel`)"
  else
    tab_name = "%~"
  fi

  echo -ne "\033]0;${tab_name}\007"
}
