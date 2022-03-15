""" --- anything that sends you around the buffer, search, tags, marks --- """

"-- search patterns
" 
set ignorecase
set smartcase

"-- navigate inside insert mode
inoremap <C-e> <C-o><C-o>
inoremap <C-y> <C-o><C-y>

""" --- visual mode

"-- {} blocks
" select the block including its defition (e.g. for () {...)
nnoremap va{ va{V

