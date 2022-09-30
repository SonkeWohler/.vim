-- ## commands

cmd('PP', 'PackerSync', {desc = 'run PackerSync'} )
cmd('FF', 'Files', {desc = 'run fzf :Files'} )
cmd('LL', 'BLines', {desc = 'run fzf :BLines, the default is inside the current buffer'} )
cmd('LB', 'Lines', {desc = 'run fzf :Lines, not in Buffer'} )
cmd('RR', 'Rg', {desc = 'run fzf :Rg, in the working directory'} )
cmd('RG', 'Rg', {desc = 'run fzf :Rg, in the working directory'} )
cmd('Q', 'q!', {desc = 'force quit'})
cmd('Qa', 'qa!', {desc = 'force quit all buffers'})

-- ## autocommands

local augroup_line_number_toggle = vim.api.nvim_create_augroup('line_number_toggle', {clear = true})

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
