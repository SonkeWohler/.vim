""" --- use the black hole register more often

" -- black hole in normal/visual mode
" I find it useful to simply use visual mode if I do want to cut something
" rather than simply deleting it into nothing
nnoremap d "_d
nnoremap c "_c

" 'x' and 'X' always mean forget about the deleted content even in visual mode
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
