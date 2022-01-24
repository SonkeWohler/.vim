""" --- latex related personalisation --- """

""" --- text related
" Some stuff that I load on any human language text files

" spell check
set spell

"-- mappings
" end of sentence
inoremap <buffer> .<Space><Space> .<C-G>u<Esc>mQgqip`Qa<C-G>u  
inoremap <buffer> .<C-Q> .<Esc>mQgqip`Q
inoremap <buffer> .<Esc> .<Esc>mQgqip`Q
imap <buffer> .<C-j> .<Esc>mQgqip`Q<C-m>
""inoremap <buffer> ?? ?<C-G>u<Esc>mQgqip`Qa<C-G>u  
inoremap <buffer> ?<C-Q> ?<C-G>u<Esc>mQgqip`Q
inoremap <buffer> ?<Esc> ?<C-G>u<Esc>mQgqip`Q
inoremap <buffer> ?<Space><Space> ?<C-G>u<Esc>mQgqip`Qa<C-G>u  
""inoremap <buffer> !! !<C-G>u<Esc>mQgqip`Qa<C-G>u  
inoremap <buffer> !<C-Q> !<C-G>u<Esc>mQgqip`Q
inoremap <buffer> !<Esc> !<C-G>u<Esc>mQgqip`Q
inoremap <buffer> !<Space><Space> !<C-G>u<Esc>mQgqip`Qa<C-G>u  

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
    " open in mupdf in background and redirect console output to tmp file so
    " it doesn't bother me
    execute '!mupdf ' . b:pdfFile . ' &>> /tmp/mupdf.log&'
  endif
endfunction

command-buffer PDFL call ViewPDFLatex("lin")
command-buffer PDFW call ViewPDFLatex("win")
