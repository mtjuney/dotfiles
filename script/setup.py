from __future__ import print_function

import os
from os import path
import shutil
import logging


HOME_DIR = path.expanduser('~/')

ROOT_DIR = path.dirname(path.dirname(path.abspath(__file__)))

COMPONENT_DIR = path.join(ROOT_DIR, 'components')

components = [
    ('git/.gitconfig', '.gitconfig'),
    ('zsh/.zshrc', '.zshrc'),
    ('tmux/.tmux.conf', '.tmux.conf'),
    ('tex/.latexmk', '.latexmk'),
    ('neovim/init.vim', '.config/nvim/init.vim')
]

abs_components = [(path.join(COMPONENT_DIR, src), path.join(HOME_DIR, dst)) for src, dst in components]


def link_dotfile(src, dst):
    """
    シンボリックリンクを張る
    張る先に何かあったら消す
    """

    try:
        if path.lexists(dst):
            if path.isdir(dst) and not path.islink(dst):
                shutil.rmtree(dst)
            else:
                os.remove(dst)

        if not path.lexists(path.dirname(dst)):
            os.makedirs(path.dirname(dst))

        os.symlink(src, dst)

    except Exception as err:
        logging.error('[ Failed ] link to {} : {}'.format(dst, err.message))

    else:
        logging.info('[ Success ] link to {}'.format(dst))


if __name__ == '__main__':
    for src, dst in abs_components:
        link_dotfile(src, dst)
