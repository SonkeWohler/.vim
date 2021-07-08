" always split buffers vertically
" copied originally from: https://www.reddit.com/r/vim/comments/2irn8j/vertical_split_by_default/
" also includes any other split related settings
set splitright
set splitbelow
set diffopt+=vertical
silent! set splitvertical
if v:errmsg != ''
  ""cabbrev split vert split
  ""cabbrev e vsplit
  ""cabbrev ee e
  cabbrev vsplit vert split
  cabbrev hsplit split
  cabbrev help vert help
  noremap <C-w>] :vert botright wincmd ]<CR>
  noremap <C-w><C-]> :vert botright wincmd ]<CR>
else
  cabbrev hsplit hor split
endif
