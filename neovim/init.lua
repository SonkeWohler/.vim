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

-- nvim_tree requires a different way to customize mappings
-- which has to be defined before you load the plugin
require('nvim_tree_on_attach')
-- make sure colors are right, for the colorscheme
vim.opt.termguicolors = true

-- install plugins
-- this might become more split up in the future
require('plugins')

-- other customization stuff
require('mappings')
require('commands')
require('settings')
require('hydras')
require('autocmds')
