echo 'default configuration loaded'

""" --- plugin related stuff ---

" matchit 
runtime macros/matchit.vim


""" --- settings ---

" these might be enabled by default, but it is (apparently) recommended to make sure
" to allow loading filetype specific things that you obviously want
filetype plugin indent on
syntax on
" softwrap lines
set wrap linebreak nolist

""" indent related:
" set tabwidth to 2
set tabstop=2 shiftwidth=2 expandtab
" smartindent is better than just autoindent
set smartindent


""" --- remapping ---

""" keys
" I wonder why <C-h> works out of the box, but this doesn't
inoremap <C-d> <Del>

""" commands
" setup to resemble my bash command
:command LSA NERDTree
" easier to type than q!, for my hand at least
:command QQ q!
