" ###基本設定###

set clipboard+=unnamed

"---------------------------------------
"ゆとり仕様(カーソルキーとかBSキーとか)
"---------------------------------------
"viとの互換性を無効にする(INSERT中にカーソルキーが有効になる)
set nocompatible
"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start


"###表示設定###
set number	"行番号を表示
set title	"編集中のタイトルを表示
set showmatch	"括弧入力時の対応する括弧を表示
syntax on	"コード色分け
filetype plugin on
filetype indent on
set tabstop=2	"インデントをスペース4つ分に
set shiftwidth=2 "オートインデントでずれる幅"
set smartindent	"オートインデント
set laststatus=2	"ステータスラインを表示
"set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%l,%v]\ [%p%%]\ [LEN=%L]
"set statusline=%<%F\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]


" #####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

set cursorline
