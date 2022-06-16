-- ### these are used throughout my config, so no local on these

-- mapping
keymap = vim.api.nvim_set_keymap
keyopt = { noremap = true }
-- commands
cmd = vim.api.nvim_create_user_command
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
-- basically vnoremap
function vmap(trigger, target)
  keymap('v', trigger, target, keyopt)
end

-- ### other lua files

-- Packer
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

----nnoremap <silent> gn :ALENext<CR>
----nnoremap <silent> gN :ALEPrevious<CR>
----
----inoremap <silent> <C-Space> <C-\><C-O>:ALEComplete<CR>
----
----command FIX ALEFix
