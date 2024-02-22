------------------------------------------------------
---    stuff that affects the way things look      ---
--- except colorschemes, which have their own file ---
------------------------------------------------------

return {

  -- improved ui interfaces
  {
    'stevearc/dressing.nvim',
    event = "VeryLazy",
    config = function()
      require('dressing').setup {
        -- insert_only = false,
        mappings = {
          n = {
            ['<esc>'] = 'Close',
            ['<c-q>'] = 'Close',   -- doesn't seem to work as intended
            ['<c-j>'] = 'Confirm', -- this is a bit of a problem due to my remaps
            ['<c-m>'] = 'Confirm',
          },
          i = {
            ['<c-c>'] = 'Close',
            ['<c-q>'] = 'Close',   -- doesn't seem to work as intended
            ['<c-j>'] = 'Confirm', -- this is a bit of a problem due to by remaps
            ['<c-m>'] = 'Confirm',
            ["<Up>"] = "HistoryPrev",
            ["<Down>"] = "HistoryNext",
          }
        }
      }
    end
  },

  -- nerd fonds, should be part of requirements in other plugins as well anyway
  {
    'kyazdani42/nvim-web-devicons',
    lazy = false,
    config = function()
      require('nvim-web-devicons').setup {
        default = true,
      }
    end
  },

}
