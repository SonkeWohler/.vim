""" --- settings and stuff related to NERDTree

" -- display options
" show also hidden files
let NERDTreeShowHidden=1

" -- opening related
" to enable some autocmd when vim opens
autocmd StdinReadPre * let s:std_in=1
" open current dir in NT when starting vim without specifying a file
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" open NT when starting in a directory rather than a file
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif
" open NT on :tabnew
""autocmd BufWinEnter * silent NERDTreeMirror

" -- closing related
" if NT is last window close vim
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" close NT after done opening files
let NERDTreeQuitOnOpen = 1

" -- commands
" similar to my .bashrc alias
:command LSA NERDTree
" access search quickly from anywhere
:cnoremap nfind :NERDTree<CR>:NERDTreeFind 
