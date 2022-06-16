
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
    'williamboman/nvim-lsp-installer',
    config = function ()
      require("nvim-lsp-installer").setup{}
    end,
    'neovim/nvim-lspconfig',
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
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

-- Completion
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-N>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
      { name = 'buffer' },
    }),
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP
-- setup doesn't seem to work for me as part of packer, so it is here
-- capabilities are from the completion plugin above, normally people just leave
-- these empy
local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup {
  capabilities = capabilities
}
lspconfig.bashls.setup {
  capabilities = capabilities
}
lspconfig.angularls.setup {
  capabilities = capabilities
}
lspconfig.bashls.setup {
  capabilities = capabilities
}
lspconfig.cmake.setup {
  capabilities = capabilities
}
lspconfig.dockerls.setup {
  capabilities = capabilities
}
lspconfig.gopls.setup {
  capabilities = capabilities
}
lspconfig.html.setup {
  capabilities = capabilities
}
lspconfig.jdtls.setup {
  capabilities = capabilities
}
lspconfig.jsonls.setup {
  capabilities = capabilities
}
lspconfig.lemminx.setup {
  capabilities = capabilities
}
lspconfig.pylsp.setup {
  capabilities = capabilities
}
lspconfig.marksman.setup {
  capabilities = capabilities
}
lspconfig.rust_analyzer.setup {
  capabilities = capabilities
}
lspconfig.sqlls.setup {
  capabilities = capabilities
}
lspconfig.sumneko_lua.setup {
  capabilities = capabilities
}
lspconfig.texlab.setup {
  capabilities = capabilities
}
lspconfig.tsserver.setup {
  capabilities = capabilities
}
lspconfig.yamlls.setup {
  capabilities = capabilities
}
-- mappings, since they are specific to the plugin
nmap('cn', ':lua vim.diagnostic.goto_next()<cr>')
nmap('cN', ':lua vim.diagnostic.goto_prev()<cr>')
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

