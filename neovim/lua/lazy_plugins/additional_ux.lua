-----------------------------------------
--- UX that adds a significant amount ---
---      like new windows, etc        ---
-----------------------------------------

return {

  -- view markdown
  {
    "ellisonleao/glow.nvim",
    event = "VeryLazy",
    config = function()
      require("glow").setup {}
    end
  },

  -- color picker and displayer
  -- I don't use this very often, but nice to have
  {
    'uga-rosa/ccc.nvim',
    event = "VeryLazy",
    config = function()
      require("ccc").setup {
        highlighter = {
          auto_enable = true
        }
      }
    end
  },

  -- like tmux zoom, but even more user friendly
  {
    'nyngwang/NeoZoom.lua',
    event = "VeryLazy",
    config = function()
      require('neo-zoom').setup {
        top_ratio = 1,
        left_ratio = 1,
        width_ratio = 1,
        height_ratio = 1,
        border = 'double',
        disable_by_cursor = true,   -- zoom-out/unfocus when you click anywhere else.
        exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
        popup = {
          enabled = true,
          exclude_filetypes = {},
          exclude_buftypes = {},
        },
      }
      vim.keymap.set('n', '<BS>', function() vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
      vim.keymap.set('n', '|', function() vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
      vim.keymap.set('n', '<C-W><CR>', function() vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
    end
  },

}
