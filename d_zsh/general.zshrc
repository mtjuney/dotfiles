# zsh editer

# autoloads
autoload -Uz colors && colors
autoload -Uz compinit && compinit
# autoload -Uz predict-on && predict-on

# setopts
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
setopt complete_aliases
setopt complete_in_word
setopt auto_param_keys
setopt always_last_prompt
setopt no_beep
setopt auto_list
setopt list_types
setopt auto_menu
setopt magic_equal_subst
setopt multios
setopt brace_ccl
setopt extended_glob
setopt share_history
setopt print_eight_bit
setopt interactive_comments
setopt chase_links
setopt mark_dirs
setopt no_flow_control

fpath=($HOME/.dotfiles/d_zsh/submodules/zsh_completions/src $fpath)


export TERM="xterm-256color"
