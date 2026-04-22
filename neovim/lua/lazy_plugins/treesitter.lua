--------------------------------------
--- anything related to treesitter ---
--------------------------------------

return {

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = "VeryLazy",
    branch = "main",
    config = function()
      require("nvim-treesitter-textobjects").setup {
        select = {
          lookahead = true,
        },
        move = {
          set_jumps = true,
        },
      }

      local select = require "nvim-treesitter-textobjects.select"
      vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@function.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@function.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ae", function() select.select_textobject("@parameter.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ie", function() select.select_textobject("@parameter.inner", "textobjects") end)

      local move = require "nvim-treesitter-textobjects.move"
      vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@statement.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]e", function() move.goto_next_start("@parameter.inner", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]l", function() move.goto_next_start("@loop.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]i", function() move.goto_next_start("@conditional.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]z", function() move.goto_next_start("@fold.outer", "fold") end)
      vim.keymap.set({ "n", "x", "o" }, "]r", function() move.goto_next_start("@return.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]'", function() move.goto_next_start("@comment.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]F", function() move.goto_next_end("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@statement.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]E", function() move.goto_next_end("@parameter.inner", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]C", function() move.goto_next_end("@class.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]L", function() move.goto_next_end("@loop.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]I", function() move.goto_next_end("@conditional.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]Z", function() move.goto_next_end("@fold.outer", "fold") end)
      vim.keymap.set({ "n", "x", "o" }, "]R", function() move.goto_next_end("@return.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, ']"', function() move.goto_next_end("@comment.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@statement.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[e", function() move.goto_previous_start("@parameter.inner", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[l", function() move.goto_previous_start("@loop.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[i", function() move.goto_previous_start("@conditional.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[z", function() move.goto_previous_start("@fold.outer", "fold") end)
      vim.keymap.set({ "n", "x", "o" }, "[r", function() move.goto_previous_start("@return.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "['", function() move.goto_previous_start("@comment.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[F", function() move.goto_previous_end("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@statement.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[E", function() move.goto_previous_end("@parameter.inner", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[C", function() move.goto_previous_end("@class.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[L", function() move.goto_previous_end("@loop.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[I", function() move.goto_previous_end("@conditional.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[Z", function() move.goto_previous_end("@fold.outer", "fold") end)
      vim.keymap.set({ "n", "x", "o" }, "[R", function() move.goto_previous_end("@return.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, '["', function() move.goto_previous_end("@comment.outer", "textobjects") end)

      -- make these repeatable with ';' and ',', just like the builtins
      local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    end,
  },

  -- the main treesitter config
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'drybalka/tree-climber.nvim',
    },
    config = function()
      local function start_ts(buf)
        if pcall(vim.treesitter.start, buf) then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
        if vim.bo[buf].filetype == "markdown" then
          -- run vim regex highlighting alongside treesitter for markdown
          vim.bo[buf].syntax = "on"
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args) start_ts(args.buf) end,
      })

      -- also handle any buffer already open when the plugin loads
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype ~= "" then
          start_ts(buf)
        end
      end
    end,
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
        line_numbers = false,   -- I can jump there with [p (treesitter parent node)
        separator = ' ',        -- easier on my eyes
        mode = 'topline',       -- provide only the context not in view, rather than changing with the cursor
        max_lines = 7,
        trim_scope = 'outer',   -- provide the most relevant context
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
            target = { "code_fence_content" },   -- list of target node types
            hl_group = "CursorLine",             -- highlight group
          })
        end,
      })
    end
  },

}
