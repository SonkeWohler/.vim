""" --- my markdown personalisation --- """

""" --- for all text files (markdown, latex, etc) --- """
" Some stuff that I load on any human language text files

"-- settings

" obviously
set spell
" in markdown i find softwrap useful
set wrap linebreak nolist

"-- mappings

" end of sentence
inoremap <buffer> .<Space><Space> .<C-G>u<Esc>mQgqip`Qa<C-G>u  
inoremap <buffer> .<C-Q> .<Esc>mQgqip`Q
inoremap <buffer> .<Esc> .<Esc>mQgqip`Q
inoremap <buffer> .<C-j> .<Esc>mQgqip`Qox<BS><Esc>
""inoremap <buffer> ?? ?<C-G>u<Esc>mQgqip`Qa<C-G>u  
inoremap <buffer> ?<C-Q> ?<C-G>u<Esc>mQgqip`Q
inoremap <buffer> ?<Esc> ?<C-G>u<Esc>mQgqip`Q
inoremap <buffer> ?<Space><Space> ?<C-G>u<Esc>mQgqip`Qa<C-G>u  
""inoremap <buffer> !! !<C-G>u<Esc>mQgqip`Qa<C-G>u  
inoremap <buffer> !<C-Q> !<C-G>u<Esc>mQgqip`Q
inoremap <buffer> !<Esc> !<C-G>u<Esc>mQgqip`Q
inoremap <buffer> !<Space><Space> !<C-G>u<Esc>mQgqip`Qa<C-G>u  

" turn a ',' into a '.' or ensure there are two spaces after '.'
nnoremap ,. s. <Esc>2lvU
" ',' into '-' with correct spacing
nnoremap ,- s -<Esc>
" reverse of previous
nnoremap -, h2s,<esc>

""" --- text related but not for all text

" normally ^W doesn't work on words with ' in them, like doesn't
inoremap <C-W> <Esc>dBxa
" this creates some problems if there is text after the cursor, this helps
nnoremap qi i<Enter><Esc>kA
nnoremap qa a<Enter><Esc>kA
" TODO with c and s, but need to apply the motion as well
" to allow the original functionality if needed

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
