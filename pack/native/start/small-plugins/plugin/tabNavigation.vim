""" --- shortcuts and the like for navigating tabs

" to prevent typos disrupting me
nnoremap gT :tabnew<CR>
" the little finger movement is annoying and takes too long
"+ n_gh is not really useful to me
nnoremap gh gT
" close current tab, but gx is already taken for opening links
""nnoremap gx :tabclose<CR>
nnoremap gX :tabclose!<CR>
