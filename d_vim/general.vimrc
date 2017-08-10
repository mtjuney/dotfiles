" ###基本設定###

"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start


"###表示設定###
set title	"編集中のタイトルを表示
filetype plugin on
filetype indent on

set completeopt=menuone,longest,preview

" file encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2user_jp,euc-jp,ascii

set fileformats=unix,mac,dos
set number wrap visualbell
set nocompatible showcmd
set autoindent smartindent expandtab
set numberwidth=5 shiftwidth=2 tabstop=2
set nowritebackup nobackup noswapfile
set incsearch hlsearch
set showmatch matchtime=1
set laststatus=2
set scrolloff=3
set clipboard+=unnamed mouse=a
set splitbelow splitright
set foldmethod=marker foldlevel=99
" set termguicolors
set list listchars=trail:•,extends:»,precedes:«,nbsp:•,tab:»-
" set list



"set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%l,%v]\ [%p%%]\ [LEN=%L]
"set statusline=%<%F\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

" #####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

set cursorline

let g:python3_host_prog = $PYENV_ROOT . '/shims/python'
