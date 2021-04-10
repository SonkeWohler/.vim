""" --- settings and stuff related to netr

" -- display option
let g:netrw_winsize = 15
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_banner = 0

" -- opening related
" to enable some autocmd when vim opens
autocmd StdinReadPre * let s:std_in=1
" open current dir in NT when starting vim without specifying a file
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | Vexplore | endif
" open NT when starting in a directory rather than a file
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'Vexplore' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif
" open NT on :tabnew
""autocmd BufWinEnter * silent NERDTreeMirror

" -- closing related
" if NT is last window close vim
""autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:Vexplore') && b:Vexplore.isTabTree() |
""    \ quit | endif
" close NT after done opening files
""let NERDTreeQuitOnOpen = 1

" -- commands
" similar to my bash
:command LSA Vexplore
" for quick reference for beginners
:command LSH vert help netrw-quickmaps
