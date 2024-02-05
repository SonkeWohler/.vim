-------------------------------------
---        lsp, completion        ---
---  and all the things that are  ---
---     intertwined with them     ---
-------------------------------------

return{

  -- the cmp instructions are very interconnected, so I am putting them all
  -- together, plus lsp
  {
    ----- completion engine -----
    -- lsp
    'hrsh7th/cmp-nvim-lsp',
    -- commands (:)
    'hrsh7th/cmp-cmdline',
    -- words in this or other open buffers
    'hrsh7th/cmp-buffer',
    -- filepaths
    'hrsh7th/cmp-path',
    -- the core plugin
    'hrsh7th/nvim-cmp',
    -- items with underscore are not at the top
    'lukas-reineke/cmp-under-comparator',
    -- arguments to functions etc
    'hrsh7th/cmp-nvim-lsp-signature-help',
    -- dictionary
    'uga-rosa/cmp-dictionary',
    -- snippets, required for cmp, even though I don't use them yet
    'dcampos/cmp-snippy',
    'dcampos/nvim-snippy',
    ----- LSP -----
    -- servers for all manner of things
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- required for lsp stuff
    "neovim/nvim-lspconfig",
    -- better ui for status updates
    "j-hui/fidget.nvim",
    -- configure lua lsp for neovim stuff
    'folke/neodev.nvim',
    -- config
    lazy = false,  -- lsp does not work well lazy loaded
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
