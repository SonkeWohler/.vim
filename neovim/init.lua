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
require('hydras')

