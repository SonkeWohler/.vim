-------------------------------
--- integrating neovim with ---
---    other programs       ---
-------------------------------

return {

  -- use nvim inside your browser
  {
    'glacambre/firenvim',
    event = "VeryLazy",
    build = function() vim.fn['firenvim#install'](0) end,
    config = function()
      vim.g.firenvim_config = {
        globalSettings = { alt = "all" },
        localSettings = {
          [".*"] = {
            cmdline  = "firenvim",
            content  = "text",
            priority = 0,
            takeover = "never",
          }
        }
      }
    end,
  },

  -- interacting with obsidian
  -- I don't really use it yet, but I use obsidian, so this stays for now
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    ft = "markdown",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        ui = {
          enable = false,
        },
        dir = "~/nextcloud/sync/vault",
        mappings = {},
        -- Whether to add the output of the node_id_func to new notes in autocompletion.
        -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
        -- https://github.com/epwalsh/obsidian.nvim/pull/406#issue-2140673715
        wiki_link_func = function(opts)
          if opts.id == nil then
            return string.format("[[%s]]", opts.label)
          elseif opts.label ~= opts.id then
            return string.format("[[%s|%s]]", opts.id, opts.label)
          else
            return string.format("[[%s]]", opts.id)
          end
        end,
        completion = {
          -- If using nvim-cmp, otherwise set to false
          nvim_cmp = true,
          -- Trigger completion at 2 chars
          min_chars = 2,
        },
        -- Where to put new notes created from completion. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        new_notes_location = "current_dir",
        open_app_foreground = true,
        finder = "telescope.nvim",
        sort_by = "modified",
        sort_reversed = true,
        open_notes_in = "vertical"
        -- see below for full list of options 👇
      })
    end,
  },

}
