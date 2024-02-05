-----------------------------------------------
---      basic UX improvements that         ---
--- are not just looks, but also functional ---
-----------------------------------------------

return{

    -- cheatsheet, except for hydras
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      config = function()
        require("which-key").setup {}
      end
    },

    -- tabline
    {
      'kdheepak/tabline.nvim',
      event = "VeryLazy",
      dependencies = {
        { 'nvim-lualine/lualine.nvim' },
        { 'kyazdani42/nvim-web-devicons' }
      },
      config = function()
        require('tabline').setup {
          options = {
            show_filename_only = false,
            show_tabs_always = true,
            show_tabs_only = false,
          },
        }
      end
    },

    -- statusline
    {
      'nvim-lualine/lualine.nvim',
      event = "VeryLazy",
      dependencies = {
        -- plugin dependency
        { 'kyazdani42/nvim-web-devicons' },
        -- add on for this plugin
        "roobert/node-type.nvim",
      },
      config = function()
        require("node-type").setup()
        require('lualine').setup {
          options = {
            theme = 'auto',
          },
          sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'diff', 'diagnostics' },
            lualine_c = {
              {
                'filename',
                file_status = true,
                path = 1,
              }
            },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            -- lualine_x = { require("node-type").statusline,  'encoding', 'fileformat', 'filetype'  },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
              {
                'filename',
                file_status = true,
                path = 1,
              }
            },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
          },
        }
      end
    },

    -- better cursor line behaviour, especially for inactive buffers
    {
      'tummetott/reticle.nvim',
      event = "VeryLazy",
      config = function()
        require('reticle').setup {
          -- set default, just in case it changes in the future
          follow = {
            cursorline = true,
            cursorcolumn = true,
          },
          -- I can still tell where the cursor is in the other files, it is just
          -- less distracting now
          always_highlight_number = true,
        }
      end
    },

}
