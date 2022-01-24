""" --- https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md

"-- language server
" replaced this line from language client readmes with one from rust-analyzer
  ""\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
let g:LanguageClient_serverCommands = {
  \ 'rust': ['rust-analyzer'],
  \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
  \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
  \ 'python': ['/usr/local/bin/pyls'],
  \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
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
" did i do this one right?
nnoremap <silent> <C-P> :call LanguageClient#textDocument_completion()<CR>

""" --- augroups

"-- [WIP] on save :w
""augroup LanguageClient_saveAction
""  autocmd!
""  :call LanguageClient#textDocument_formatting()<CR>
""augroup END
