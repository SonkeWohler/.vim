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
-- has to be before plugins, which has to be before everything else
vim.opt.termguicolors = true

-- install plugins, before all the other settings
-- since I don't usually remove plugins anymore I don't put a lot of effort into
-- grouping settings etc by plugin, in favor of other groupings.
require('plugins')

-- colorscheme is kind of important
-- this does not load properly (with the schemes I am using) when defined via
-- lazy, but this does work
vim.cmd [[colorscheme bamboo]]

-- other customization stuff
-- grouped, roughly, by how I think of them, so if I have an idea and I go and
-- add it I will see if it already exists and I just forgot about it.
require('mappings')
require('commands')
require('settings')
require('hydras')
require('autocmds')
