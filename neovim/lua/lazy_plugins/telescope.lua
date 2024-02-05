------------------------------------
--- mostly telescope and related ---
------------------------------------

return{

    -- [migration:: TODO]
    -- telescope and related
    {
      'nvim-telescope/telescope.nvim',
      version = '0.1.*',
      event = "VeryLazy",
      dependencies = {
        -- requires fzf and ripgrep installed on the system.
        'junegunn/fzf.vim',
        -- plugin dependency
        { 'nvim-lua/plenary.nvim' },
        ---- addons for this plugin -----
        -- undo tree
        "debugloop/telescope-undo.nvim",
        -- clipboard
        "AckslD/nvim-neoclip.lua",
      },
      dependencies = 'telescope-fzf-native.nvim',
      config = function()
        require('telescope').setup {
          defaults = {
            mappings = {
              -- insert mode
              i = {
                -- mappings go here
                -- I'll play with this soon
                -- I need the readline to work here
                -- * <c-e>
                -- * <c-u>
                -- * possibly more
              }
            }
          },
          extensions = {
            fzf = {
              fuzzy = true,                   -- false will only do exact matching
              override_generic_sorter = true, -- override the generic sorter
              override_file_sorter = true,    -- override the file sorter
              case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
              -- the default case_mode is "smart_case"
            },
            undo = {},
          },
          pickers = {
            find_files = {
              follow = true,
            },
          },
        }
        -- addons
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('undo')
        require('neoclip').setup()
        require('telescope').load_extension('neoclip')
        require('telescope').load_extension('macroscope')
      end
    },
    -- auto-build for the above
    -- required for telescope to work correctly
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
}
