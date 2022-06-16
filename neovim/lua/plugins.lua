
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai'
  use 'machakann/vim-sandwich'
  use 'junegunn/fzf.vim'
  use 'altercation/vim-colors-solarized'
  use 'b3nj5m1n/kommentary'
  use 'johmsalas/text-case.nvim'
  use 'tpope/vim-tbone'
end)

vim.cmd [[
  runtime macros/sandwich/keymap/surround.vim
]]
vim.cmd [[
  colorscheme molokai
]]
vmap('<C-T>', ':Tyank<CR>')
