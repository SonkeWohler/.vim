""" --- the way line numbers and the cursorline are displayed
" source and inspiration https://jeffkreeftmeijer.com/vim-number/
" and their plugin https://github.com/jeffkreeftmeijer/vim-numbertoggle

"-- cursor display
set cursorline
set cursorlineopt=number
"-- hybrid line numbers most of the time
set number relativenumber
"-- toggle to absolute line numbers in certain situations
:augroup linenumbertoggle
:  autocmd!
:  autocmd BufWinEnter,WinEnter,BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufWinLeave,WinLeave,BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
