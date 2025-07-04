------------------------------------
--- navigating between different ---
---     buffers, files, etc      ---
------------------------------------

return {

  -- there is also in telescope.lua
  -- * "jemag/telescope-diff.nvim"

  -- file view as tree, like nerdtree
  {
    'kyazdani42/nvim-tree.lua',
    event = "VeryLazy",
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 60,
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        on_attach = NvimTreeOnAttach,
      }
    end
  },
  -- I find myself using this surprisingly much in some projects, and not at
  -- all in others.
  -- used in commands.lua, where I keep all commands to make them easier
  -- to extend, at the cost of refactoring involving some more errors

  -- close unused buffers
  {
    "chrisgrieser/nvim-early-retirement",
    event = "VeryLazy",
    config = function()
      require("early-retirement").setup {
        retirementAgeMins = 30,
        -- can be nice when checking it works well, but usually don't need (default)
        notificationOnAutoClose = false,
        -- I may change this in the future, but lets not autosave (default)
        ignoreUnsavedChangesBufs = true,
        -- no minimum (default)
        minimumBufferNum = 1,
        -- obviously, I wouldn't want visible buffers closed (default)
        ignoreVisibleBufs = true,
      }
    end,
  },

  -- more intuitive resizing keybindings
  {
    'mrjones2014/smart-splits.nvim',
    event = "VeryLazy",
    config = function()
      require('smart-splits').setup {}
    end
  },

}
