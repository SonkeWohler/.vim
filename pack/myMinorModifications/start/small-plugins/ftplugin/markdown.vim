""" --- my markdown personalisation --- """

"-- compile
" pdf
function! MarkdownPdfPreview()
  :w
  !pandoc -i % -o /tmp/vimMarkdownPreview.pdf
  !start /tmp/vimMarkdownPreview.pdf
endfunction

command-buffer PDF call MarkdownPdfPreview()

" html
function! MarkdownHtmlPreview()
  :w
  !pandoc -i % -o /tmp/vimMarkdownPreview.html
  !start /tmp/vimMarkdownPreview.html
endfunction

command-buffer HTML call MarkdownHtmlPreview()

"-- mappings
" end of sentence
inoremap <buffer> .<Space><Space> .<C-G>u<Esc>gqqA  
inoremap <buffer> .<C-Q> .<Esc>gqq
imap <buffer> .<C-j> .<Esc>gqq<C-m>
inoremap <buffer> ?? ?<C-G>u<Esc>gqqA  
inoremap <buffer> ?<C-Q> ?<Esc>gqq
inoremap <buffer> ?<Space><Space> ?<Esc>gqq
inoremap <buffer> !! !<C-G>u<Esc>gqqA  
inoremap <buffer> !<C-Q> !<Esc>gqq
inoremap <buffer> !<Space><Space> !<Esc>gqq

"-- things to execute
setlocal foldlevel=5
