""" --- use the black hole register more often
" I find it useful to simply use visual mode if I do want to copy and delete something
" and to assume I don't need it otherwise
" rather than fully deleting it perhaps cutting it to "b is better. The
" important part is that it doesn't interfere with """
nnoremap d "bd

" 'x' and 'X' always mean forget about the deleted content
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
