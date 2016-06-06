"---------------
"��������
"--------------
syntax on

highlight LineNr  ctermfg=darkyellow  "���ֹ�
highlight Nontext ctermfg=darkgrey
highlight Folded  ctermfg=blue
highlight SpecialKey cterm=underline ctermfg=darkgrey
"highlight SpecialKey ctermfg=grey    "�ü쵭��

"���ѥ��ڡ������в�
highlight  ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /  /

"������
set ts=4 sw=3
set softtabstop=3
set expandtab

"---------------
"���ܸ������
"---------------
set termencoding=utf-8,gb2312
set encoding=japan
set fileencodings=utf-8,euc-jp,gb2312
set fenc=utf-8
set enc=utf-8
set fileencoding=utf-8

"--------------
"����
"-------------

"����ʸ�������ʸ�����ޤޤ�Ƥ��������ʸ����ʸ������̤ʤ���������(noignorecase)
set ignorecase

"����ʸ�������ʸ�����ޤޤ�Ƥ�����϶��̤��Ƹ�������(nosmartcase)
set smartcase

"����ʸ���Υϥ��饤�Ȥ򤷤ʤ�
set hlsearch

"���󥯥��󥿥륵����
set incsearch

if v:version < 700
   set migemo
endif

"--------------
"�����Х����
"--------------
"map = ����
"vmap = VISUAL �⡼��

"nmap = �Ρ��ޥ�⡼��
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

"���ޥ�ɥ⡼��
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>

imap <c-j> <esc>

"let mapleader = "\<C-k>"

" -------------------
" �������̴ؿ��ƤӽФ�
" -------------------
au FileType perl call PerlType()
filetype plugin indent on
autocmd! BufRead,BufNewFile *.inc set filetype=php
autocmd! BufRead,BufNewFile *.cgi set filetype=perl
autocmd! BufRead,BufNewFile *.pass setlocal nobackup

" -------------------
" ��ư��¸
" -------------------
"autocmd CursorHold * call NewUpdate()
"set updatetime=500
"let g:svbfre = '.\+'

" -------------------
" Explore
" -------------------
let g:explHideFiles='^\.,\.gz$,\.exe$,\.zip$'  " ��ɽ��������(a�ǥȥ���)
let g:explDetailedHelp=0
let g:explWinSize=''
let g:explSplitBelow=1
let g:explUseSeparators=1     " �ǥ��쥯�ȥ�ȥե�����δ֤��餤�˥��ѥ졼��ɽ��


" -------------------
" �Хåե���Ϣ
" -------------------
set hidden           " �ڤ��ؤ�����undo�θ��̻�³��

" -------------------
" ����¾
" -------------------
set notitle
set autowrite
set scrolloff=5 " �����������;�����
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

" �ǥ��쥯�ȥ�μ�ư��ư
au   BufEnter *   execute ":lcd " . escape(expand("%:p:h"), " #\\")
au CursorMoved * silent! exe printf('match Underlined /\<%s\>/',expand('<cword>'))

" -------------------
" �ؿ������
" -------------------
" ��ư����
function! NewUpdate()
   let time = strftime("%H", localtime())
   exe "set backupext=.".time
   if expand('%') =~ g:svbfre && !&readonly && &buftype == ''
      silent! update
   endif
endfunction
