""" --- settings and stuff related to netr
"
" I used to use NERDTree and some of these are copied from its README
" The switch came with this article: https://shapeshed.com/vim-netrw/

" -- display option
" size of the netr buffer
""let g:netrw_winsize = 15
" how files are listed, 3 = tree view
let g:netrw_liststyle = 3
" what <CR> does to a file, 0 = open inside netr buffer
let g:netrw_browse_split = 0
" vertical split buffers to the right instead of the left
let g:netrw_altv = 1
" turn off banner
let g:netrw_banner = 0

" -- opening related
" to enable some autocmd when vim opens
autocmd StdinReadPre * let s:std_in=1
" open current dir in netr when starting vim without specifying a file
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | Explore | endif
" open nert when starting in a directory rather than a file
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | Explore | endif
" open netr on :tabnew, seems to break something right now
""autocmd BufWinEnter * silent Explore

" -- commands
" similar to my bash
:command LSA Explore
:command LSV Vexplore
" for quick reference for beginners
:command LSH vert help netrw-quickmaps
