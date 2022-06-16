-- ### this will be used throughout the config
keymap = vim.api.nvim_set_keymap
keyopt = { noremap = true }
-- basically nnoremap
function nmap(trigger, target)
  keymap('n', trigger, target, keyopt)
end
-- basically inoremap
function imap(trigger, target)
  keymap('i', trigger, target, keyopt)
end
-- basically cnoremap
function cmap(trigger, target)
  keymap('c', trigger, target, keyopt)
end
function vmap(trigger, target)
  keymap('v', trigger, target, keyopt)
end
cmd = vim.api.nvim_create_user_command

-- ## packer
-- trying something with sandwich
--vim.g.sandwich_no_default_key_mappings = 1
--vim.g.textobj_sandwich_no_default_key_mappings = 1

require('plugins')
require('mappings')
require('commands')
require('settings')

-- ############################################ --
-- ### everything below is copied from my  ###
-- ### old vimscript setup and stays here  ###
-- ### so I will remember to convert it to ###
-- ###                  lua                ###
-- ############################################ --



-- unmap i_<C-W> i_<C-U>
--" so far the only command I reall use
--:command! FF Files

--""" --- https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md

--""" --- options

--let g:is_pythonsense_alternate_motion_keymaps = 1
--let g:ale_completion_enabled = 1

--""" --- language servers

----nnoremap <silent> gr mgmG:ALEFindReferences<CR>
----nnoremap <silent> L :ALECodeAction<CR>
----nnoremap <silent> <F2> :ALERename<CR>
----nnoremap <silent> gd mgmG:ALEGoToDefinition<CR>
----nnoremap <silent> gn :ALENext<CR>
----nnoremap <silent> gN :ALEPrevious<CR>
----
----inoremap <silent> <C-Space> <C-\><C-O>:ALEComplete<CR>
----
----command FIX ALEFix

--""" --- the below is left over from Language Client for Neovim
--" https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
--" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
--" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
--" nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
--" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
--" nnoremap <silent> L :call LanguageClient#textDocument_codeAction()<CR>
--" nnoremap <silent> gn :call LanguageClient#diagnosticsNext()<CR>
--" nnoremap <silent> gN :call LanguageClient#diagnosticsPrevious()<CR>
--" " did i do this one right?
--" nnoremap <silent> <C-P> :call LanguageClient#textDocument_completion()<CR>
--"-- language server
--" replaced this line from language client readmes with one from rust-analyzer
--  ""\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
--" let g:LanguageClient_serverCommands = {
--"   \ 'rust': ['rust-analyzer'],
--"   \ 'javascript': ['typescript-language-server', '--stdio'],
--"   \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
--"   \ 'typescript': ['typescript-language-server', '--stdio'],
--"   \ 'typescript.jsx': ['typescript-language-server', '--stdio'],
--"   \ 'python': ['pylsp'],
--"   \ 'sh': ['bash-language-server', 'start'],
--" \ }
