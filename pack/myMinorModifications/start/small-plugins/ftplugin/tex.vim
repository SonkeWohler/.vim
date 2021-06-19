""" --- latex related personalisation --- """

""" --- text related
" Some stuff that I load on any human language text files

" spell check
set spell

"-- mappings
" end of sentence
inoremap <buffer> .<Space><Space> .<C-G>u<Esc>gqqA  
inoremap <buffer> .<C-Q> .<Esc>gqq
imap <buffer> .<C-j> .<Esc>gqq<C-m>
inoremap <buffer> ?? ?<C-G>u<Esc>gqqA  
inoremap <buffer> ?<C-Q> ?<C-G>u<Esc>gqq
inoremap <buffer> ?<Space><Space> ?<C-G>u<Esc>gqqA  
inoremap <buffer> !! !<C-G>u<Esc>gqqA  
inoremap <buffer> !<C-Q> !<C-G>u<Esc>gqq
inoremap <buffer> !<Space><Space> !<C-G>u<Esc>gqqA  

""" --- end of text

"-- compiling
" Sometimes the vimtex compiler doesn't seem to work the way it is supposed to
" but pdflatex sometimes comes to the rescue
function! ViewPDFLatex()
  :w
  let b:pdfFile = expand('%:r') . ".pdf"
  !pdflatex %
  execute '!start ' . b:pdfFile
endfunction

command-buffer PDFL call ViewPDFLatex()
