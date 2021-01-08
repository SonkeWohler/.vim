"WIP
""" --- delete text inside "" () etc. but not the brackets themselves
" this is often covered by plugins that attempt to expand functionality
" related to brackets, but so far none of the plugins I have tried suited my
" needs properly

" -- inside these brackets
" single and double quotes, backticks
nnoremap d" T"dt"
nnoremap d' T'dt'
nnoremap d` T`dt`
" brackets, can use open or close to run command
nnoremap d( T(dt)
nnoremap d) T(dt)
nnoremap d[ T[dt]
nnoremap d] T[dt]
nnoremap d{ T{dt}
nnoremap d} T{dt}
nnoremap d< T<dt>
nnoremap d> T<dt>

" -- delete all occurances on current line
" single and double quotes, backticks
nnoremap dd" :s/".\{-}"/""/gc<CR>
nnoremap dd' :s/'.\{-}'/''/gc<CR>
nnoremap dd` :s/`.\{-}`/``/gc<CR>
" brackets, can use open or close to run command
nnoremap dd( :s/(.\{-})/()/gc<CR>
nnoremap dd) :s/(.\{-})/()/gc<CR>
nnoremap dd[ :s/[.\{-}]/[]/gc<CR>
nnoremap dd] :s/[.\{-}]/[]/gc<CR>
nnoremap dd{ :s/{.\{-}}/{}/gc<CR>
nnoremap dd} :s/{.\{-}}/{}/gc<CR>
nnoremap dd< :s/<.\{-}>/<>/gc<CR>
nnoremap dd> :s/<.\{-}>/<>/gc<CR>
nnoremap dd</ :s/</.\{-}>/</>/gc<CR>
nnoremap ddt :s/>.\{-}<\//><\//gc<CR>
