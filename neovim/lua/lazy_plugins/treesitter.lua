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

    -- autopair for html using treesitter
    -- could be simple_editor.lua, but relies on treesitter so it stays here
    {
      'windwp/nvim-ts-autotag',
      event = "VeryLazy",
      config = function()
        require('nvim-ts-autotag').setup()
      end,
      dependencies = 'nvim-treesitter/nvim-treesitter',
    },

    -- show current function, class, etc if its definition is not currently visible
    -- could be ux.lua, but relies on treesitter so it stays here
    {
      'nvim-treesitter/nvim-treesitter-context',
      event = "VeryLazy",
      config = function()
        -- jump to context, often handled by treesitter parent node, depending on
        -- the mode setting below
        -- vim.keymap.set("n", "[c", function()
        --   require("treesitter-context").go_to_context()
        -- end, { silent = true })
        -- setup
        require('treesitter-context').setup {
          line_numbers = false, -- I can jump there with [p (treesitter parent node)
          separator = ' ',      -- easier on my eyes
          mode = 'topline',     -- provide only the context not in view, rather than changing with the cursor
          max_lines = 7,
          trim_scope = 'outer', -- provide the most relevant context
        }
      end,
      dependencies = 'nvim-treesitter/nvim-treesitter',
    },

    -- better folds using treesitter
    -- could be ux.lua, but relies on treesitter so it stays here
    {
      'kevinhwang91/nvim-ufo',
      event = "VeryLazy",
      dependencies = {
        'kevinhwang91/promise-async',
        'nvim-treesitter/nvim-treesitter',
      },
      config = function()
        require('ufo').setup({
          provider_selector = function()
            return { 'treesitter', 'indent' }
          end
        })
      end
    },

    -- highlight code blocks
    -- could be in ux.lua, but relies on treesitter so it stays here
    {
      "atusy/tsnode-marker.nvim",
      event = "VeryLazy",
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          group = vim.api.nvim_create_augroup("tsnode-marker-markdown", {}),
          pattern = "markdown",
          callback = function(ctx)
            require("tsnode-marker").set_automark(ctx.buf, {
              target = { "code_fence_content" }, -- list of target node types
              hl_group = "CursorLine",           -- highlight group
            })
          end,
        })
      end
    },

}
