------------------------------
--- simple editing actions ---
---     e.g. autopair      ---
------------------------------

return{

  -- There is also in treesitter.lua
  -- * "windwp/nvim-ts-autotag"

  -- there is also in telescope.lua
  -- * "johmsalas/text-case.nvim"

    -- better . use
    {
      'tpope/vim-repeat',
      event = "VeryLazy",
    },

    -- more <C-A>
    {
      'tpope/vim-speeddating',
      event = "VeryLazy",
    },

    {
      'zef/vim-cycle',
      event = "VeryLazy",
    },

    -- treat surrounding pairs as one text object
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    },

    -- so far the best autopair I've tried.  I used to have reservations
    {
      "windwp/nvim-autopairs",
      event = "VeryLazy",
      config = function()
        require("nvim-autopairs").setup {
          check_ts = true,
          break_undo = false,
          map_c_h = true,
          map_c_w = true,
        }
      end
    },

    -- comments as actions
    {
      'numToStr/Comment.nvim',
      event = "VeryLazy",
      config = function()
        require('Comment').setup()
      end
    },

    -- I could add it to my own autocommands, or use off the shelf
    -- honestly, which is better?
    {
      "cappyzawa/trim.nvim",
      event = "VeryLazy",
      config = function()
        require("trim").setup({})
      end
    },

}
