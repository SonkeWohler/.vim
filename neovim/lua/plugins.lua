
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai'
  use 'machakann/vim-sandwich'
  use 'junegunn/fzf.vim'
  use 'altercation/vim-colors-solarized'
  use 'b3nj5m1n/kommentary'
  use 'johmsalas/text-case.nvim'
  use 'tpope/vim-tbone'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    {
      "williamboman/nvim-lsp-installer",
      config = function ()
        require("nvim-lsp-installer").setup {}
      end
    },
    {
      "neovim/nvim-lspconfig",
      after = "nvim-lsp-installer",
      config = function()
        local lspconfig = require("lspconfig")
        lspconfig.sumneko_lua.setup {}
        lspconfig.pylsp.setup {}
      end
    }
  }
end)

-- sandwich with surround mappings, thanks
vim.cmd [[
  runtime macros/sandwich/keymap/surround.vim
]]
-- can't seem to make colorschema work with vim.g.colors_name
vim.cmd [[
  colorscheme molokai
]]
-- tmux yanking
vmap('<C-T>', ':Tyank<CR>')

-- ### IDE stuff
-- thanks to https://codevion.github.io/#!vim/treelsp.md
-- treesitter
local configs = require'nvim-treesitter.configs'
configs.setup {
  highlight = {
    enable = true, 
  },
  indent = {
    enable = true,
  }
}
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- LSP
--local lsp_installer = require("nvim-lsp-installer")
--lsp_installer.on_server_ready(function(server)
--  local opts = {}
--  server:setup(opts)
--end)
