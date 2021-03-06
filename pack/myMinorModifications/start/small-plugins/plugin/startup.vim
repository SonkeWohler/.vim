""" --- stuff to prompt the user at startup in certain conditions --- """

""" --- recovering swap file
"not currently working

"-- should happen before normal recovery prompt
augroup AutoRecoverSwapWithDiff
  autocmd!
  ""autocmd SwapExists * call PromptForSwapFileDiff()
augroup END
"-- prompt that should be displayed
:function PromptForSwapFileDiff()
  echo "---------"
  let choice = confirm("Swap file exists! View Diffs?", "&Yes\n&No",2)
  if choice == 1
    :recover
    :command! DiffWrite call OverwriteRecoveredFile()
    :DiffOrig
  endif
:endfunction
"-- delete swap file and overwrite original file
function OverwriteRecoveredFile()
  :w
  execute '!rm --verbose -- ' sawpname()
endfunction
