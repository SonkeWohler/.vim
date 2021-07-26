""" --- syntastic settings --- """
" this needs to be expanded a lot, but for now lets keep it super simple

"-- mode
" I don't like the delay when saving.  I use vim because its fast
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
" but then I need to check manually
:command CH SyntasticCheck

"-- jumping errors
" next and previous error, because I don't quite like unimpaired mappings
nnoremap nm :lnext<CR>
nnoremap mn :lprevious<CR>
