-- ### this will be used throughout the config
-- mapping keys
local keymap = vim.api.nvim_set_keymap
local keyopt = { noremap = true }
-- basically nnoremap
function nmap(trigger, target)
  keymap('n', trigger, target, keyopt)
end
-- basically inoremap
function imap(trigger, target)
  keymap('i', trigger, target, keyopt)
end
-- basically cnoremap
function imap(trigger, target)
  keymap('c', trigger, target, keyopt)
end
