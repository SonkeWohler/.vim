""" --- Format the File ---
"
""" --- options and settings

" -- cpoptions
" this is copied from the default
set cpoptions=aABceFs
" and 'J' added
" https://stevelosh.com/blog/2012/10/why-i-two-space/  under the 'Power' heading
set cpoptions+=J

" -- simple formatting function
function FormatThisBuffer()
  mark q
  norm gggqG
  norm `q
endfunction

" I'd rather have a command than a normal mode mapping
:command Format call FormatThisBuffer()
