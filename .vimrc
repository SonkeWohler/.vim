echo 'default configuration loaded'

""" --- plugin related stuff ---

" enable matchit that ships with vim
runtime macros/matchit.vim
" NERDTree show also hidden files
let NERDTreeShowHidden=1

""" --- settings ---

" these might be enabled by default, but it is (apparently) recommended to make sure
" to allow loading filetype specific things that you obviously want
filetype plugin indent on
syntax on
" softwrap lines
set wrap linebreak nolist
set encoding=utf-8

""" indent related:
" set tabwidth to 2
set tabstop=2 shiftwidth=2 expandtab
" smartindent is better than just autoindent
set smartindent


""" --- remapping ---

""" keys
" I am missing a <Del> key, but <C-d> is already taken
inoremap <C-l> <Del>

""" commands
" setup to resemble my bash command
:command LSA NERDTree
" easier to type than q!, for my hand at least
:command QQ qa!
