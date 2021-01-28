""" --- Format the File ---

" -- simple formatting function
function FormatThisBuffer()
  mark q
  norm gggqG
  norm `q
endfunction
" I'd rather have a command than a normal mode mapping
:command Format call FormatThisBuffer()

" -- for markdown
" this is a workaround for an issue with `.`
function FormatThisMarkdownBuffer()
  call FormatThisBuffer()
  :%s/\(\w\).  \(\w\)/\1. \2/g
endfunction
" again, I'd rather use command mode to call this
:command FormatM call FormatThisMarkdownBuffer()
