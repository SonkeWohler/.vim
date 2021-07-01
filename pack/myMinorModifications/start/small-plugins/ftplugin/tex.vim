""" --- latex related personalisation --- """

""" --- text related
" Some stuff that I load on any human language text files

" spell check
set spell

"-- mappings
" end of sentence
inoremap <buffer> .<Space><Space> .<C-G>u<Esc>gqqA  
inoremap <buffer> .<C-Q> .<Esc>gqq
inoremap <buffer> .<Esc> .<Esc>gqq
imap <buffer> .<C-j> .<Esc>gqq<C-m>
inoremap <buffer> ?? ?<C-G>u<Esc>gqqA  
inoremap <buffer> ?<C-Q> ?<C-G>u<Esc>gqq
inoremap <buffer> ?<Esc> ?<C-G>u<Esc>gqq
inoremap <buffer> ?<Space><Space> ?<C-G>u<Esc>gqqA  
inoremap <buffer> !! !<C-G>u<Esc>gqqA  
inoremap <buffer> !<C-Q> !<C-G>u<Esc>gqq
inoremap <buffer> !<Esc> !<C-G>u<Esc>gqq
inoremap <buffer> !<Space><Space> !<C-G>u<Esc>gqqA  

""" --- end of text

"-- compiling
" Sometimes the vimtex compiler doesn't seem to work the way it is supposed to
" but pdflatex sometimes comes to the rescue
function! ViewPDFLatex(win)
  :w
  let b:pdfFile = expand('%:r') . ".pdf"
  !pdflatex %
  if a:win == "win"
    execute '!start ' . b:pdfFile
  else
    execute '!mupdf ' . b:pdfFile . ' &'
  endif
endfunction

command-buffer PDFL call ViewPDFLatex("lin")
command-buffer PDFW call ViewPDFLatex("win")
