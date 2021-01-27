""" --- Format the File ---
"
function FormatThisBuffer()
  mark q
  norm gggqG
  norm `q
endfunction

:command Format call FormatThisBuffer()
