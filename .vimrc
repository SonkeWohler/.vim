echo 'default configuration loaded'

" note: it can be better to set an option even if it is set by default to
" ensure consistency accross environments. This is obviously most useful if
" you use this vimrc in multiple locations with different OS, vim versions,
" emulators etc.
"
" note: most customisation options that can be grouped will be found under
" `pack/myMinorModifications/` usually under `start/`. If they are present
" here instead they are either experimental or very minor and can't be grouped
" into their own file.vim.

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
set encoding=utf-8
" softwrap lines
set wrap linebreak nolist
" line numbers and such
set number
set cursorline
set cursorlineopt=number

""" indent related:
" set tabwidth to 2
set tabstop=2 shiftwidth=2 expandtab
" smartindent is better than just autoindent
set smartindent


""" --- remapping ---

""" --- keys
" I am missing a <Del> key, but <C-d> (used in bash) is already taken
inoremap <C-l> <Del>
" I am trying out <c-q> instead of <c-[>
inoremap <c-q> <Esc>
vnoremap <c-q> <Esc>
cnoremap <c-q> <Esc>
nnoremap <c-q> <Esc>
xnoremap <c-q> <Esc>
snoremap <c-q> <Esc>
onoremap <c-q> <Esc>

""" --- hotkeys

""" --- commands
" setup to resemble my bash command
:command LSA NERDTree
" easier to type than q!, for my hand at least
:command QQ qa!
