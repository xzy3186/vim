"---------------
"色の設定
"--------------
execute pathogen#infect()
syntax on

highlight LineNr  ctermfg=darkyellow  "行番号
highlight Nontext ctermfg=darkgrey
highlight Folded  ctermfg=blue
highlight SpecialKey cterm=underline ctermfg=darkgrey
"highlight SpecialKey ctermfg=grey    "特殊記号

"全角スペースを視覚化
highlight  ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /  /

"タブ幅
set ts=4 sw=3
set softtabstop=3
set expandtab

"---------------
"日本語の設定
"---------------
set termencoding=utf-8,gb2312
set encoding=japan
set fileencodings=utf-8,euc-jp,gb2312
set fenc=utf-8
set enc=utf-8
set fileencoding=utf-8

"--------------
"検索
"-------------

"検索文字列に大文字が含まれている場合は大文字小文字を区別なく検索する(noignorecase)
set ignorecase

"検索文字列に大文字が含まれている場合は区別して検索する(nosmartcase)
set smartcase

"検索文字のハイライトをしない
set hlsearch

"インクリメンタルサーチ
set incsearch

if v:version < 700
   set migemo
endif

"--------------
"キーバインド
"--------------
"map = 全部
"vmap = VISUAL モード

"nmap = ノーマルモード
"nmap j g<Down>
"nmap k g<Up>
"nmap / g/
"nmap ? g?
"nmap <c-u> :ls<CR>
"nmap gw :bw<CR>
"nmap gp :bp<CR>
"nmap gn :bn<CR>
"nmap gm :marks<CR>
"nmap gh :set nohlsearch!<CR>
"nmap gb :lncBufSwitch<CR>
"nmap gt :Tlist<CR>
nnoremap <C-k> mz:m-2<cr>`z==
nnoremap <C-j> mz:m+<cr>`z==
xnoremap <C-k> :m'<-2<cr>gv=gv
xnoremap <C-j> :m'>+<cr>gv=gv

"コマンドモード
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>

imap <c-j> <esc>

"let mapleader = "\<C-k>"

" -------------------
" タイプ別関数呼び出し
" -------------------
au FileType perl call PerlType()
filetype plugin indent on
autocmd! BufRead,BufNewFile *.inc set filetype=php
autocmd! BufRead,BufNewFile *.cgi set filetype=perl
autocmd! BufRead,BufNewFile *.pass setlocal nobackup

" -------------------
" 自動保存
" -------------------
"autocmd CursorHold * call NewUpdate()
"set updatetime=500
"let g:svbfre = '.\+'

" -------------------
" Explore
" -------------------
let g:explHideFiles='^\.,\.gz$,\.exe$,\.zip$'  " 非表示の設定(aでトグル)
let g:explDetailedHelp=0
let g:explWinSize=''
let g:explSplitBelow=1
let g:explUseSeparators=1     " ディレクトリとファイルの間くらいにセパレータ表示


" -------------------
" バッファ関連
" -------------------
set hidden           " 切り替え時のundoの効果持続等

" -------------------
" その他
" -------------------
set notitle
set autowrite
set scrolloff=5 " スクロール時の余白確保
set showmatch
" set backup
set number
set history=50
set list
set listchars=tab:\ \ ,extends:<,trail:\ 
set laststatus=2
set directory=/tmp
set wildmode=full:list
set wrap
set textwidth=80

set statusline=[%L]\ %t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L

" ディレクトリの自動移動
au   BufEnter *   execute ":lcd " . escape(expand("%:p:h"), " #\\")
au CursorMoved * silent! exe printf('match Underlined /\<%s\>/',expand('<cword>'))

" -------------------
" 関数の定義
" -------------------
" 自動更新
function! NewUpdate()
   let time = strftime("%H", localtime())
   exe "set backupext=.".time
   if expand('%') =~ g:svbfre && !&readonly && &buftype == ''
      silent! update
   endif
endfunction
