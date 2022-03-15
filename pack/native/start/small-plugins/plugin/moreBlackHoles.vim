""" --- use the black hole register more often

" -- black hole in normal/visual mode
" I find it useful to simply use visual mode if I do want to cut something
" rather than simply deleting it into nothing
nnoremap d "_d
nnoremap D "_D
nnoremap c "_c
nnoremap C "_C
nnoremap s "_s
nnoremap S "_S

" 'x' and 'X' always mean forget about the deleted content even in visual mode
" so do `c` and `C`
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
vnoremap c "_c
vnoremap C "_C
