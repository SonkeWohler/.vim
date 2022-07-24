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
  ------ meta ------
  -- packer itself
  use 'wbthomason/packer.nvim'
  ------ looks ------
  -- nerd fonds, should be part of requirements above already
  use 'kyazdani42/nvim-web-devicons'
  -- color schemes
  use 'tomasr/molokai'
  use 'tanvirtin/monokai.nvim'
  use 'Shatur/neovim-ayu'
  use 'altercation/vim-colors-solarized'
  use 'xXTgamerXx/everforest-neovim'
  use 'shaunsingh/nord.nvim'
  ------ commands ------
  -- better . use
  use 'tpope/vim-repeat'
  -- more <C-A>
  use 'tpope/vim-speeddating'
  use 'zef/vim-cycle'
  --[[ use {
    'monaqa/dial.nvim',
    tag = 'v0.3.0',
    config = function()
      require('dial.map').setup{}
    end
  } ]]
  ------ buffers ------
  -- tab and status lines
  use {
    'kdheepak/tabline.nvim',
    requires = {
      { 'hoob3rt/lualine.nvim', opt=true },
      {'kyazdani42/nvim-web-devicons', opt = true}
    },
    config = function()
      require('tabline').setup{ }
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup{}
    end
  }
  -- better resizing
  use {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require('smart-splits').setup{}
    end
  }
  -- file view as tree, like nerdtree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = {
      cmd('LSA', 'NvimTreeToggle', { desc = 'open or close NvimTree: NvimTreeToggle' })
    }
  }
  ------ search ------
  -- better string conversions I still have to get used to
  -- a bit like tpope's vim-abolish
  use{
    'johmsalas/text-case.nvim',
    config = function()
      require('textcase').setup{}
    end
  }
  -- fuzzy finding with fzf
  use 'junegunn/fzf.vim'
  ------ motions ------
  -- like tpope's surround but more maintained
  use {
    'machakann/vim-sandwich',
    -- I am still used to the tpope/surround keys
    config = function()
      vim.cmd [[ runtime macros/sandwich/keymap/surround.vim ]]
    end
  }
  -- comments as actions
  use 'b3nj5m1n/kommentary'
  -- tmux integration for registers
  use {
    'tpope/vim-tbone',
    setup = {
      vmap('<C-T>', ':Tyank<CR>'),
      nmap('<C-T>', 'V:Tyank<CR>')
    }
  }
  ------ git ------
  -- view git messages
  use {
    'rhysd/git-messenger.vim',
    setup = function()
      vim.g.git_messenger_no_default_mappings = false
    end,
    config = {
      nmap('gm', '<Plug>(git-messenger)')
    }
  }
  -- more git stuff
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  ------ hints ------
  -- cheatsheet, except for hydras
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup { }
    end
  }
  ------ awesome ------
  -- hydras are awesome, they have their own lua file in my setup
  use { 'anuvyklack/hydra.nvim',
    requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
  }
  ------ language support ------
  -- better python word objects/motions like functions
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
    end,
  }
  -- better folds using treesitter
  use {
    'kevinhwang91/nvim-ufo',
    requires = {
      'kevinhwang91/promise-async',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('ufo').setup({
        provider_selector = function()
          return {'treesitter', 'indent'}
        end
      })
    end
  }
  -- Language Client
  -- lsp and installer for lsp
  use {  -- more setup at the bottom
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
  }
  -- pretty list of diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  -- pretty in line visalisation of diagnostics
  --[[ use({
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
  end,
}) ]]
  -- Completions of various kinds
  use {  -- more setup at the bottom
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
  }
end)

----------------------------------------------
-----       setting up the plugins      ------
----------------------------------------------

-- colors
require('ayu').setup({
    mirage = false,
    overrides = {},
})
require('monokai').setup{ palette = require('monokai').soda }
-- require('molokai').setup{}
vim.g.nord_borders = true
vim.g.nord_contrast = true
-- vim.g.nord_disable_background = true
-- vim.cmd [[ colorscheme monokai_soda ]]
-- vim.cmd [[ colorscheme ayu ]]
vim.cmd [[ colorscheme nord ]]

-- file viewer
require("nvim-tree").setup {}

-- Fonts
require('nvim-web-devicons').setup{
  default = true;
}

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
require('trouble').setup{
  action_keys = {
    jump_close = {'o', '<c-j>', 'enter'}
  }
}
cmd('TT', 'TroubleToggle', { desc = 'toggle Trouble plugin'} )
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
