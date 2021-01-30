""" --- use the black hole register more often

" -- black hole in normal/visual mode
" I find it useful to simply use visual mode if I do want to cut something
" rather than simply deleting it into nothing
nnoremap d "_d

" 'x' and 'X' always mean forget about the deleted content even in visual mode
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X

" -- delete inside all occurances of brackets on current line
" single and double quotes, backticks
nnoremap dl" :s/".\{-}"/""/gc<CR>
nnoremap dl' :s/'.\{-}'/''/gc<CR>
nnoremap dl` :s/`.\{-}`/``/gc<CR>
" brackets, can use open or close to run command
nnoremap dl( :s/(.\{-})/()/gc<CR>
nnoremap dl) :s/(.\{-})/()/gc<CR>
nnoremap dl[ :s/[.\{-}]/[]/gc<CR>
nnoremap dl] :s/[.\{-}]/[]/gc<CR>
nnoremap dl{ :s/{.\{-}}/{}/gc<CR>
nnoremap dl} :s/{.\{-}}/{}/gc<CR>
nnoremap dl< :s/<.\{-}>/<>/gc<CR>
nnoremap dl> :s/<.\{-}>/<>/gc<CR>
nnoremap dl</ :s/</.\{-}>/</>/gc<CR>
" tags
nnoremap dlt :s/>.\{-}<\//><\//gc<CR>
