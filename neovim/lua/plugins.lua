require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai'
  use 'machakann/vim-sandwich'
  use 'junegunn/fzf.vim'
  use 'altercation/vim-colors-solarized'
  use 'b3nj5m1n/kommentary'
  use 'johmsalas/text-case.nvim'
  use 'tpope/vim-tbone'
  use { 'anuvyklack/hydra.nvim',
    requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
  }
  use {  -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
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
    end
  }
  use {  -- lsp, also see below
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
  }
  use {  -- Completion, also see below
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
  }
  use {
    'jeetsukumaran/vim-pythonsense',
    setup = function()
      vim.cmd[[
        let g:is_pythonsense_alternate_motion_keymaps = 1
        ]]
    end
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

-- Completion
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-<Space>>'] = cmp.mapping.complete(),
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
require("nvim-lsp-installer").setup {}
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
