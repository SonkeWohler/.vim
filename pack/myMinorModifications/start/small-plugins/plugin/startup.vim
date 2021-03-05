""" --- stuff to prompt the user at startup in certain conditions --- """

""" --- recovering swap file

"-- prompt that should be displayed
:function PromptForSwapFileDiff()
  echo "---------"
  let choice = confirm("Swap file exists! View Diffs?", "&Yes\n&No",2)
  if choice == 1
    recover(bufname())
    let b:recoveredFile = "/d/temp/vim/tempBufFile"
    :w b:recoveredFile
    !rmv v:swapname
    :diff b:recoveredFile
  endif
:endfunction
"-- should happen before normal recovery prompt
augroup AutoRecoverSwapWithDiff
  autocmd!
  ""autocmd SwapExists * call PromptForSwapFileDiff()
augroup END
