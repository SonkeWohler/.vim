""" --- my markdown personalisation --- """

""" --- text related
" Some stuff that I load on any human language text files

"-- in markdown i find softwrap useful
set wrap linebreak nolist

"-- spell check
set spell

"-- mappings
" end of sentence
inoremap <buffer> .<Space><Space> .<C-G>u<Esc>gqqA<C-G>u  
inoremap <buffer> .<C-Q> .<Esc>gqq
inoremap <buffer> .<Esc> .<Esc>gqq
imap <buffer> .<C-j> .<Esc>gqq<C-m>
inoremap <buffer> ?? ?<C-G>u<Esc>gqqA<C-G>u  
inoremap <buffer> ?<C-Q> ?<C-G>u<Esc>gqq
inoremap <buffer> ?<Esc> ?<C-G>u<Esc>gqq
inoremap <buffer> ?<Space><Space> ?<C-G>u<Esc>gqqA<C-G>u  
inoremap <buffer> !! !<C-G>u<Esc>gqqA<C-G>u  
inoremap <buffer> !<C-Q> !<C-G>u<Esc>gqq
inoremap <buffer> !<Esc> !<C-G>u<Esc>gqq
inoremap <buffer> !<Space><Space> !<C-G>u<Esc>gqqA<C-G>u  

" since ` had to be remapped, in markdown it is better like this:
nnoremap ``` i```<cr>
inoremap ``` <C-G>u<Esc>o```<cr><Esc>

""" --- end of text

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

"-- things to execute
setlocal foldlevel=5
