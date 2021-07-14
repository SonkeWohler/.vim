""" --- my markdown personalisation --- """

""" --- for all text files (markdown, latex, etc) --- """
" Some stuff that I load on any human language text files

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

""" --- text related but not for all text

" since ` had to be remapped, in markdown it is better like this:
nnoremap ``` i```<cr>
inoremap ``` <C-G>u<Esc>o```<cr><Esc>

" normally ^W doesn't work on words with ' in them, like doesn't
inoremap <C-W> <Esc>dBxa

" in markdown i find softwrap useful
set wrap linebreak nolist

""" --- compiling
"
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
