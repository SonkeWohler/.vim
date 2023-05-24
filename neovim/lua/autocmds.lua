-- relative line numbers in normal mode, absolute in insert or inactive windows

local augroup_line_number_toggle = vim.api.nvim_create_augroup('line_number_toggle', { clear = true })
vim.api.nvim_create_autocmd({
  -- 'BufWinEnter',
  'WinEnter',
  'BufEnter',
  'FocusGained',
  'InsertLeave',
}, {
  group = augroup_line_number_toggle,
  desc = 'relative number on',
  callback = function()
    vim.opt.relativenumber = true
  end
})
vim.api.nvim_create_autocmd({
  -- 'BufWinLeave',
  'WinLeave',
  'BufLeave',
  'FocusLost',
  'InsertEnter',
}, {
  group = augroup_line_number_toggle,
  desc = 'relative number off',
  callback = function()
    vim.opt.relativenumber = false
  end
})

-- highlight any yanked text

-- -- See `:help vim.highlight.on_yank()`
-- -- from kickstart
-- local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   callback = function()
--     vim.highlight.on_yank()
--   end,
--   group = highlight_group,
--   pattern = '*',
-- })
