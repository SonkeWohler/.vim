
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
    "williamboman/nvim-lsp-installer",
    config = function ()
      require("nvim-lsp-installer").setup{}
    end,
    "neovim/nvim-lspconfig",
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
-- setup doesn't seem to work for me as part of packer, so it is here
local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup {}
lspconfig.bashls.setup {}
lspconfig.angularls.setup {}
lspconfig.bashls.setup {}
lspconfig.cmake.setup {}
lspconfig.dockerls.setup {}
lspconfig.gopls.setup {}
lspconfig.html.setup {}
lspconfig.jdtls.setup {}
lspconfig.jsonls.setup {}
lspconfig.lemminx.setup {}
lspconfig.pylsp.setup {}
lspconfig.marksman.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.sqlls.setup {}
lspconfig.sumneko_lua.setup {}
lspconfig.texlab.setup {}
lspconfig.tsserver.setup {}
lspconfig.yamlls.setup {}
-- mappings, since they are specific to the plugin
nmap('gd', ':lua vim.lsp.buf.definition()<cr>')
nmap('gD', ':lua vim.lsp.buf.type_definition()<cr>')
nmap('gi', ':lua vim.lsp.buf.implementation()<cr>')
--nmap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nmap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nmap('gr', ':lua vim.lsp.buf.references()<cr>')
nmap('K', ':lua vim.lsp.buf.hover()<cr>')
nmap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nmap('L', ':lua vim.lsp.buf.code_action()<cr>')
nmap('R', ':lua vim.lsp.buf.rename()<cr>')

