---------------------------------
--- color schemes and related ---
---------------------------------

return {

  --- muted (not too hight contrast) color schemes

  --bamboo
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {}
      -- require('bamboo').load {}
    end
  },

  -- nord
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_borders = true
      vim.g.nord_contrast = true
      vim.g.nord_disable_background = false
      -- require('nord').set()
    end
  },

  -- ayu, where I usually prefer mirage
  {
    'Shatur/neovim-ayu',
    event = "VeryLazy",
    config = function()
      require('ayu').setup({
        mirage = true,
        overrides = {},
      })
    end
  },

  -- everforest
  {
    "neanias/everforest-nvim",
    event = "VeryLazy",
    config = function()
      require("everforest").setup({})
    end,
  },

  -- zenburn,
  -- but this overwrites my settings, so it is disabled
  {
    "phha/zenburn.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("zenburn").setup()
    end
  },

  --- stuff that depends greatly on colorscheme, for now at least

  -- indentation guides
  -- could be in ux.lua, but relies on treesitter so it stays here
  {
    'lukas-reineke/indent-blankline.nvim',
    event = "VeryLazy",
    config = function()
      -- highlight colors need to adjust every time the colorscheme changes
      -- they are also colorscheme specific
      -- however, g:colors_name doesn't seem to capture the sub-scheme
      -- (e.g. bamboo vulgaris vs multiplex), so this could use some improvement
      local ibl_hooks = require("ibl.hooks")
      ibl_hooks.register(ibl_hooks.type.HIGHLIGHT_SETUP, function()
        local colorscheme = vim.g.colors_name
        if colorscheme == "bamboo" then
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#252623" })
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#2f312c" })
        elseif colorscheme == "nord" then
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#2E3440" })
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#323845" })
        elseif colorscheme == "ayu" then
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#1f2430" })
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#191e2a" })
        elseif colorscheme == "everforest" then
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#2d353b" })
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#343f44" })
        elseif colorscheme == "zenburn" then
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#3f3f3f" })
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#434443" })
        elseif colorscheme == "blue" then
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#000087" })
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#005faf" })
        elseif colorscheme == "peachpuff" then
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#ffdab9" })
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#f5c195" })
        else
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#000000" })
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#666666" })
        end
      end)

      -- actual setup
      local highlight = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
      }
      require("ibl").setup {
        indent = {
          char = "",
          highlight = highlight,
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = true,
        },
        whitespace = {
          remove_blankline_trail = false,
          highlight = highlight,
        },
      }
    end
  },

}
