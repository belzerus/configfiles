set nocompatible
set ruler
set history=50
set showcmd
set showmode
set incsearch
set nohlsearch
set nowrap
set textwidth=0
set mousehide
set vb t_vb=
set autoindent smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set backspace=eol,start,indent
set undolevels=1000
set updatecount=100
set complete=.,w,b,u,U,t,i,d
set showtabline=2
syntax on
filetype plugin indent on
filetype plugin on
color ron
highlight Comment ctermfg=red
highlight Cursor ctermbg=Red ctermfg=red
highlight CursorLine ctermfg=Green ctermbg=Green
set guioptions=agimt
set go-=m go-=T
set noequalalways

let Tlist_Display_Prototype = 1
let JavaBrowser_Expand_Tree_At_Startup = 1
imap <C-H> <Left>
imap <C-L> <Right>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-P> <Esc>pa
imap <C-E> \emph{}<Esc>i
map <Tab> ==
map <F5> :! ctags -R *<CR>
map <F6> :se number!<CR>
map <F7> :set hlsearch!<CR>
map <F8> :set colorcolumn=80
map <C-C> :s/\(\S\)/#\1/<CR>
map <S-C> :s/#\(.\)/\1/<CR>
map <C-K> :s/\(.*\)/\/\*\1\*\//<CR>
map <S-K> :s/^[[:space:]]*\/\*\(.*\)[[:space:]]*\*\//\1/<CR><TAB>
map <C-T> :set noexpandtab!<CR>
map <S-T> :set expandtab!<CR>
map <CS-J> Jx
map <ACS-C> :%s/\n\s*{/ {/<CR>


