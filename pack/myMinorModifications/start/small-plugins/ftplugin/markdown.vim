""" --- my markdown personalisation --- """
"-- because I like verbose CLI tools
echo 'markdown filetype'

"-- compile
" pdf
function! MarkdownPdfPreview()
  !pandoc -i % -o /tmp/vimMarkdownPreview.pdf
  !start /tmp/vimMarkdownPreview.pdf
endfunction

command PDF call MarkdownPdfPreview()

" html
function! MarkdownHtmlPreview()
  !pandoc -i % -o /tmp/vimMarkdownPreview.html
  !start /tmp/vimMarkdownPreview.html
endfunction

command HTML call MarkdownHtmlPreview()