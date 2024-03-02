-------------------------------------
---        lsp, completion        ---
---  and all the things that are  ---
---     intertwined with them     ---
-------------------------------------

return {

  ----- Mason -----

  -- manage servers from inside neovim
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },

  -- better headless update
  {
    'RubixDev/mason-update-all',
    event = "VeryLazy",
    dependencies = 'mason.nvim',
    config = function()
      require('mason-update-all').setup()
    end
  },

  ----- LSP -----

  -- handles connecting completion and lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },

  -- various lsp stuff
  {

    -- required for lsp stuff
    "neovim/nvim-lspconfig",
    -- configure lua lsp for neovim stuff
    -- 'folke/neodev.nvim',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    lazy = false, -- lsp does not work well lazy loaded

  },

  ----- Completion Engine -----
  {

    -- the core plugin
    'hrsh7th/nvim-cmp',
    -- lsp
    'hrsh7th/cmp-nvim-lsp',
    -- commands (:)
    'hrsh7th/cmp-cmdline',
    -- words in this or other open buffers
    'hrsh7th/cmp-buffer',
    -- filepaths
    'hrsh7th/cmp-path',
    -- items with underscore are not at the top
    'lukas-reineke/cmp-under-comparator',
    -- arguments to functions etc
    'hrsh7th/cmp-nvim-lsp-signature-help',
    -- dictionary
    'uga-rosa/cmp-dictionary',
    -- a snippet plugin is required by cmp, though I don't use them yet
    -- 'dcampos/nvim-snippy',
    -- 'dcampos/cmp-snippy',

    dependencies = {
      'L3MON4D3/LuaSnip',
    },
    lazy = false, -- lsp does not work well lazy loaded
  },

  -- better ui for status updates
  {
    "j-hui/fidget.nvim",
  },

  -- pretty list of diagnostics
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require('trouble').setup {
        action_keys = {
          jump_close = { 'o', '<c-j>', 'enter' }
        }
      }
    end
  },

}
