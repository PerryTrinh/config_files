"******************************
"***Visual and Mouse Changes***
"******************************
syntax enable
colorscheme delek

set number
highlight LineNr ctermfg=blue ctermbg=NONE

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set autoindent
set backspace=indent,eol,start
set foldmethod=indent
set nofoldenable

set hlsearch
set mouse=a
set wrap
set linebreak

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"***************************
"***General Abbreviations***
"***************************
"Display current file name
nnoremap ff :echo expand('%:p')<ENTER>

"Mapping x to cut
vnoremap x d

"Mapping c to copy
vnoremap c y

"Mapping Backspace to cut
vnoremap <Bs> d

