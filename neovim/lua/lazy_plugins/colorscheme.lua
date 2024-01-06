---------------------------------
--- color schemes and related ---
---------------------------------

return {

  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {}
      require('bamboo').load()
      vim.cmd [[highlight IndentBlanklineIndent1 guibg=#252623 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guibg=#2f312c gui=nocombine]]
      vim.cmd [[ colorscheme bamboo ]]
    end
  },

  -- indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    event = "VeryLazy",
    config = function()
      -- highlight colors need to adjust every time the colorscheme changes
      -- they are also colorscheme specific
      local ibl_hooks = require("ibl.hooks")
      ibl_hooks.register(ibl_hooks.type.HIGHLIGHT_SETUP, function()
        local colorscheme = vim.g.colors_name
        if colorscheme == "bamboo" then
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#252623" })
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#2f312c" })
        elseif colorscheme == "nord" then
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#2E3440" })
          vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#323845" })
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
