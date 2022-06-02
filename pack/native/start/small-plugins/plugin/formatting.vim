""" --- Format the File ---
"
""" --- options and settings

" -- cpoptions
" this is copied from the default
set cpoptions=aABceFs
" and 'J' added
" https://stevelosh.com/blog/2012/10/why-i-two-space/  under the 'Power' heading
set cpoptions+=J
set joinspaces

"-- textwidth
set textwidth=80
""set colorcolumn=+1

"-- indents and lines
" set tabwidth to 2
set tabstop=2 shiftwidth=2 expandtab
" smartindent is better than just autoindent
set smartindent
" auto-format options
set formatoptions=roqlnjp
" for the most part i don't like softwraping lines
set nowrap nolinebreak list
set listchars=tab:<->,eol:$

"-- folding
set foldlevel=8

" -- simple formatting function
function FormatThisBuffer()
  mark q
  norm gggqG
  norm `q
endfunction

" I'd rather have a command than a normal mode mapping
:command Format call FormatThisBuffer()
