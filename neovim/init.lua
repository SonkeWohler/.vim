-- ### these are used throughout my config, so no local on these

-- mapping
keymap = vim.keymap.set
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

require('nvim_tree_on_attach')
require('plugins')
require('mappings')
require('commands')
require('settings')
require('hydras')
require('autocmds')
