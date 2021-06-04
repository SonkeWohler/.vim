""" --- latex related personalisation --- """

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
