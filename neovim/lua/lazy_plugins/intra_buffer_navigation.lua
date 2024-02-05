--------------------------------------------
---     navigating within the buffer     ---
--- e.g. word to word, lines, paragraphs ---
---                  etc.                ---
--------------------------------------------

return {

    -- better word based movement
    {
      "chrisgrieser/nvim-spider",
      event = "VeryLazy",
    },
    -- I use this in mappings.lua, to keep all the mapping related stuff in one
    -- place.  This makes them easier to extend, at the cost of getting errors
    -- during refactoring.

    -- better textobjects for words and other things
    -- works great hand in hand with the above spider
    {
      "chrisgrieser/nvim-various-textobjs",
      event = "VeryLazy",
      config = function()
        -- I only use subword from here so far, so I use manual mappings
        -- consider markdown links and html attributes for the future
        require("various-textobjs").setup({ useDefaultKeymaps = false })
      end,
    },
    -- I use this in mappings.lua, to keep all the mapping related stuff in one
    -- place.  This makes them easier to extend, at the cost of getting errors
    -- during refactoring.

    -- see where f/F will take you quickly, so you can plan ahead with ;/,
    {
      'jinh0/eyeliner.nvim',
      event = "VeryLazy",
      config = function()
        require 'eyeliner'.setup {
          highlight_on_key = false, -- show highlights only after keypress
          dim = false,              -- dim all other characters if set to true
        }
      end
    },

    -- better tpope/vim-unimpaired
    {
      'echasnovski/mini.bracketed',
      event = "VeryLazy",
      config = function()
        require('mini.bracketed').setup {
          -- probably don't really use it, but why not
          buffer     = { suffix = 'b', options = {} },
          -- because # is above 3, and / is harder to reach
          comment    = { suffix = '3', options = {} },
          -- I'm excited to try this one
          conflict   = { suffix = 'x', options = {} },
          -- same as <space>n for me
          diagnostic = { suffix = '', options = {} },
          -- no need, plus ]f is for functions
          file       = { suffix = '', options = {} },
          -- might be useful in json
          indent     = { suffix = 'j', options = {} },
          -- don't use this
          jump       = { suffix = '', options = {} },
          -- no need
          location   = { suffix = '', options = {} },
          -- similar enough to <C-O> that I don't really need it
          oldfile    = { suffix = '', options = {} },
          -- wonder if this makes any difference to <space>n
          quickfix   = { suffix = 'q', options = {} },
          -- not sure what this does, but why not
          treesitter = { suffix = 't', options = {} },
          -- can be nice
          undo       = { suffix = '', options = {} },
          -- don't think I use it, but that's ok for now
          window     = { suffix = 'w', options = {} },
          -- can be nice
          yank       = { suffix = 'y', options = {} },
        }
      end
    },

    -- lastplace
    -- maintain the last cursor position in files you opened before
    {
      'ethanholz/nvim-lastplace',
      lazy = false,
      config = function()
        require('nvim-lastplace').setup {}
      end
    },

}
