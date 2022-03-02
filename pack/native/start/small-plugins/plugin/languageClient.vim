""" --- https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md

"-- language server
" replaced this line from language client readmes with one from rust-analyzer
  ""\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
let g:LanguageClient_serverCommands = {
  \ 'rust': ['rust-analyzer'],
  \ 'javascript': ['typescript-language-server', '--stdio'],
  \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'typescript.jsx': ['typescript-language-server', '--stdio'],
  \ 'python': ['pylsp'],
  \ 'sh': ['bash-language-server', 'start'],
\ }


"-- https://github.com/autozimu/LanguageClient-neovim/wiki/deoplete
call deoplete#custom#source('LanguageClient',
  \ 'min_pattern_length',
  \ 2)

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> L :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> gn :call LanguageClient#diagnosticsNext()<CR>
nnoremap <silent> gN :call LanguageClient#diagnosticsPrevious()<CR>
" did i do this one right?
nnoremap <silent> <C-P> :call LanguageClient#textDocument_completion()<CR>

"-- formatting
" the language client can be used to format very nicely
" however, if there is no server setup it gets vim stuck

" because the filetype is not really accessible inside setup scripts the best
" thing I can really do is set it on BufEnter, even if that means it is
" redundantly setting the option.  As long as I don't have too many languages
" installed that should do.

function! LanguageClient_Formatting_Expression()
  for lang in keys(g:LanguageClient_serverCommands)
    if lang ==? &filetype
      set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
      break
    endif
  endfor
  if $formatexpr ==? ""
  endif
endfunction

augroup LanguageClinet_Formatting
  autocmd!
  autocmd BufEnter * call LanguageClient_Formatting_Expression()
augroup END

""" --- augroups

"-- [WIP] on save :w
""augroup LanguageClient_saveAction
""  autocmd!
""  :call LanguageClient#textDocument_formatting()<CR>
""augroup END
