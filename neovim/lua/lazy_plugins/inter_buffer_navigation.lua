------------------------------------
--- navigating between different ---
---     buffers, files, etc      ---
------------------------------------

return{

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

}
