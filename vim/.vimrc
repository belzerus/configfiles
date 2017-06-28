" For best user experiance below listed plugins should be considered:
" - cctree.vim
" - bitbake.vim
" - syntax_checker
" - NERD_commenter
" - NERD_tree
" - syntastic
" - ctrlp.vim
" - checksyntax.vim


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
"color ron
color darkblue
" Stealed with pride from emuskon
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
"


highlight Comment ctermfg=red
highlight Cursor ctermbg=Red ctermfg=red
highlight CursorLine ctermfg=Green ctermbg=Green
set guioptions=agimt
set go-=m go-=T
set noequalalways
set autochdir
set tags+=./tags;

syntax match nonprintable "[^\x20-\x7E]"
highlight nonprintable guibg=Red ctermbg=2

map <Tab> ==
map <C-2> :set tabstop=2 shiftwidth=2<CR>
map <C-3> :set tabstop=4 shiftwidth=4<CR>
map <C-4> :set tabstop=8 shiftwidth=8<CR>

"map <F5> :! ctags -R .<CR>
map <F6> :se number!<CR>
" Enable below if NERD_commenter plugin is disabled..
"map <C-C> :s/\(\S\)/#\1/<CR>
"map <S-C> :s/#\(.\)/\1/<CR>
"map <C-K> :s/\(.*\)/\/\*\1\*\//<CR>
"map <S-K> :s/^[[:space:]]*\/\*\(.*\)[[:space:]]*\*\//\1/<CR><TAB>
map <C-E> :set noexpandtab!<CR>
map <S-E> :set expandtab!<CR>
map <ACS-C> :%s/\n\s*{/ {/<CR>
noremap tt :tab split<CR>
noremap tc :tabc<CR>
noremap sl :se number!<CR>

