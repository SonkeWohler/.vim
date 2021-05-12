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
" browse from buffer file location, not project location
let netrw_keepdir = 1
" https://github.com/tpope/vim-vinegar/issues/13#issuecomment-489440040
let netrw_fastbrowse = 0

" -- opening related
" to enable some autocmd when vim opens
autocmd StdinReadPre * let s:std_in=1
" open current dir in netr when starting vim without specifying a file
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | Explore | endif
" open nert when starting in a directory rather than a file
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | Explore | endif
" open netr on :tabnew, seems to break something right now
""autocmd BufWinEnter * silent Explore

""" --- commands
"-- inspired by my bash lsa
" exit netr to previous file
:command LSX Rexplore
" open netrw in current directory
" replacing the current buffer
:command LSA call Netrw_LSA()
function! Netrw_LSA()
  :Ntree
  :Explore
endfunction
" splitting vertically from current buffer
:command LSV call Netrw_LSV()
function! Netrw_LSV()
  :vsplit
  :Ntree
  :Explore
endfunction
" for quick reference for beginners
:command LSH vert help netrw-quickmaps
"-- non-netrw file exploring
" search for filename
cnoremap ef<Space> e **/*
cnoremap vf<Space> vsplit **/*

augroup netrw_remaps
  autocmd!
  autocmd filetype netrw call Netrw_Mappings()
augroup END

function! Netrw_Mappings()
  "-- remap netrw mappings
  nmap <buffer> h -
  nmap <buffer> l <CR>
  "-- cursor display
  let g:netrw_bufsettings = 'nomodifiable nomodified number nobuflist nowrap readonly'
endfunction

