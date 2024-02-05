--------------------------------------
--- anything related to treesitter ---
--------------------------------------

return{

    -- the main treesitter config
    -- those listed here under dependencies are interconnected in their config, so
    -- they are to me part of the main treesitter installation, not just an extension
    {
      'nvim-treesitter/nvim-treesitter',
      build = ":TSUpdate",
      event = "VeryLazy",
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'drybalka/tree-climber.nvim',
      },
      config = function()
        require 'nvim-treesitter.configs'.setup {
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
          },
          indent = {
            enable = true,
          },
          textobjects = {
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ae"] = "@parameter.outer",
                ["ie"] = "@parameter.inner",
              },
            },
            move = {
              enable = true,
              set_jumps = true,
              goto_next_start = {
                ["]f"] = "@function.outer",
                ["]]"] = "@call.outer",
                ["]e"] = "@parameter.inner",
                ["]c"] = "@class.outer",
                ["]l"] = "@loop.outer",
                ["]i"] = "@conditional.outer",
              },
              goto_next_end = {
                ["]F"] = "@function.outer",
                ["]["] = "@call.outer",
                ["]E"] = "@parameter.inner",
                ["]C"] = "@class.outer",
                ["]L"] = "@loop.outer",
                ["]I"] = "@conditional.outer",
              },
              goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[["] = "@call.outer",
                ["[e"] = "@parameter.inner",
                ["[c"] = "@class.outer",
                ["[l"] = "@loop.outer",
                ["[i"] = "@conditional.outer",
              },
              goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[]"] = "@call.outer",
                ["[E"] = "@parameter.inner",
                ["[C"] = "@class.outer",
                ["[L"] = "@loop.outer",
                ["[I"] = "@conditional.outer",
              },
            },
          },
        }
        -- make these repeatable with ';' and ',', just like the builtins
        -- taken from treesitter-textobjects
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
      end,
      -- build = ':TSUpdate',
    },

}
