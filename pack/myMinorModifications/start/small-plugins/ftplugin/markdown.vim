""" --- my markdown personalisation --- """
"-- because I like verbose CLI tools
""echo 'markdown filetype'

"-- compile
" pdf
function! MarkdownPdfPreview()
  :w
  !pandoc -i % -o /tmp/vimMarkdownPreview.pdf
  !start /tmp/vimMarkdownPreview.pdf
endfunction

command PDF call MarkdownPdfPreview()

" html
function! MarkdownHtmlPreview()
  :w
  !pandoc -i % -o /tmp/vimMarkdownPreview.html
  !start /tmp/vimMarkdownPreview.html
endfunction

command HTML call MarkdownHtmlPreview()

"-- mappings
" end of sentence
inoremap .<Space><Space> .<C-G>u<Esc>gqqA  
inoremap .<C-Q> .<Esc>gqq
inoremap ?? ?<C-G>u<Esc>gqqA  
inoremap ?<C-Q> ?<Esc>gqq
inoremap ?<Space><Space> ?<Esc>gqq
inoremap !! !<C-G>u<Esc>gqqA  
inoremap !<C-Q> !<Esc>gqq
inoremap !<Space><Space> !<Esc>gqq

"-- things to execute
set foldlevel=5
