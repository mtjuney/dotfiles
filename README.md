#dotfiles

Mtjune's dotfiles for zsh, vim, emacs, tmux and atom.

##Installation

```
$ git clone https://github.com/mtjune/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ bash script/setup.sh
```

or

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mtjune/dotfiles/master/script/installer.sh)"
```

Your original dotfiles (not symbolic link) take refuge to `~/.dotfiles/refuge/` date separately.


##Submodules

This dotfiles use the following items as submodule.

* neobundle.vim
* tpm
* oh-my-zsh
* zsh-completions
