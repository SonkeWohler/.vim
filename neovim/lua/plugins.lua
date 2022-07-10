-------------------------------------------------------------------
--------------       import and manage plugins       --------------
-------------------------------------------------------------------
--------------  this includes settings and mappings  --------------
--------------   for specific plugins, except hydra  --------------
-------------------------------------------------------------------


----------------------------------------------
------        importing plugins         ------
----------------------------------------------

require('packer').startup(function()
  -- packer itself
  use 'wbthomason/packer.nvim'
  -- color schemes
  use 'tomasr/molokai'
  use 'Shatur/neovim-ayu'
  use 'altercation/vim-colors-solarized'
  use 'xXTgamerXx/everforest-neovim'
  -- tab ans status lines
  use {
    'kdheepak/tabline.nvim',
    requires = {
      { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true}
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use('mrjones2014/smart-splits.nvim')
  -- better string conversions I still have to get used to
  use 'johmsalas/text-case.nvim'
  -- like tpope's surround but more maintained
  use {
    'machakann/vim-sandwich',
    -- I am still used to the tpope/surround keys
    config = vim.cmd [[
      runtime macros/sandwich/keymap/surround.vim
      ]]
  }
  -- file view as tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = {
      cmd('TT', 'NvimTreeToggle', { desc = 'open or close NvimTree: NvimTreeToggle' }),
      cmd('LSA', 'NvimTreeToggle', { desc = 'open or close NvimTree: NvimTreeToggle' })
    }
  }
  -- comments as actions
  use 'b3nj5m1n/kommentary'
  -- tmux integration for registers
  use {
    'tpope/vim-tbone',
    setup = {
      vmap('<C-T>', ':Tyank<CR>'),
      nmap('<C-T>', 'Vh:Tyank<CR>')
    }
  }
  -- hydra's are awesome, they have their own lua file in my setup
  use { 'anuvyklack/hydra.nvim',
    requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
  }
  -- fuzzy finding with fzf
  use 'junegunn/fzf.vim'
  -- better python word objects like functions
  -- maybe some for other languages would be nice
  use {
    'jeetsukumaran/vim-pythonsense',
    setup = function()
      vim.cmd[[
        let g:is_pythonsense_alternate_motion_keymaps = 1
        ]]
    end
  }
  -- Treesitter
  -- better syntax highlighting
  use {
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
  -- Language Client
  use {  -- more setup at the bottom
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
  }
  -- Completions of various kinds
  use {  -- more setup at the bottom
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
  }
  -- nerd fonds
  use 'kyazdani42/nvim-web-devicons'
end)

----------------------------------------------
-----       setting up the plugins      ------
----------------------------------------------

-- colors
require('ayu').setup({
    mirage = false,
    overrides = {},
})
vim.cmd [[
  colorscheme ayu
]]

-- file viewer
require("nvim-tree").setup {}

-- Fonts
require('nvim-web-devicons').setup{
  default = true;
}
-- tab and statusline
require('tabline').setup{}
require('lualine').setup{}
require('smart-splits').setup{}

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
