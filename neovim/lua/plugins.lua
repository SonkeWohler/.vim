-------------------------------------------------------------------
--------------       import and manage plugins       --------------
-------------------------------------------------------------------
--------------  this includes settings and mappings  --------------
--------------   for specific plugins, except hydra  --------------
-------------------------------------------------------------------

----------------------------------------------
------         bootstrap lazy           ------
------ install if not installed already ------
----------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- TODO, remove if
-- while I do my migration I can use this
-- to toggle between old and new setup
if false then
  require("lazy").setup(
    "lazy_plugins",
    {
      install = {
        missing = true,
        -- colorscheme = { 'bamboo' },  # doesn't seem to work
      },
      checker = {
        enabled = false,
        notify = false,
        frequency = 86400,
      },
      change_detection = {
        notify = true,
      },
    }
  )
  return
end

----------------------------------------------
------            old setup             ------
----------------------------------------------

require('lazy').setup({
    ------ meta ------

    ------ looks ------

    -- [migration:: done]
    -- nerd fonds, should be part of requirements in other plugins as well anyway
    {
      'kyazdani42/nvim-web-devicons',
      event = "VeryLazy",
      config = function()
        require('nvim-web-devicons').setup {
          default = true,
        }
      end
    },

    -- [migration:: TODO] # requires telescope
    -- pretty notifications
    {
      'rcarriga/nvim-notify',
      event = "VeryLazy",
      -- "folke/noice.nvim",
      -- "MunifTanjim/nui.nvim",
      config = function()
        require("notify").setup {
          stages = 'slide',
        }
        require('telescope').load_extension('notify')
        vim.notify = require("notify")
      end,
      dependencies = 'telescope.nvim',
    },

    -- [migration:: done]
    -- improved ui interfaces
    {
      'stevearc/dressing.nvim',
      config = function()
        require('dressing').setup {
          -- insert_only = false,
          mappings = {
            n = {
              ['<esc>'] = 'Close',
              ['<c-q>'] = 'Close',   -- doesn't seem to work as intended
              ['<c-j>'] = 'Confirm', -- this is a bit of a problem due to my remaps
              ['<c-m>'] = 'Confirm',
            },
            i = {
              ['<c-c>'] = 'Close',
              ['<c-q>'] = 'Close',   -- doesn't seem to work as intended
              ['<c-j>'] = 'Confirm', -- this is a bit of a problem due to by remaps
              ['<c-m>'] = 'Confirm',
              ["<Up>"] = "HistoryPrev",
              ["<Down>"] = "HistoryNext",
            }
          }
        }
      end
    },

    -- smooth scrolling, not sure yet
    --[[ use {
  'karb94/neoscroll.nvim',
  config = function()
  require('neoscroll').setup(){
  easing_function = 'circular'
  }
  end
  } ]]

    -- color schemes

    -- use {
    --   'tanvirtin/monokai.nvim',
    --   config = function()
    --     require('monokai').setup {
    --       palette = require('monokai').soda
    --     }
    --   end
    -- }

    -- use {
    --   'Shatur/neovim-ayu',
    --   config = function()
    --     require('ayu').setup({
    --       mirage = false,
    --       overrides = {},
    --     })
    --   end
    -- }

    -- use 'xXTgamerXx/everforest-neovim'

    -- {
    --   'shaunsingh/nord.nvim',
    --   config = function()
    --     vim.g.nord_borders = true
    --     vim.g.nord_contrast = true
    --     -- vim.g.nord_disable_background = true
    --   end
    -- },

    -- [migration:: done]
    {
      'ribru17/bamboo.nvim',
      event = "VeryLazy",
      config = function()
        require('bamboo').setup {}
        require('bamboo').load()
      end
    },

    -- {
    --   "phha/zenburn.nvim",
    --   config = function() require("zenburn").setup() end
    -- }

    ------ commands ------

    -- [migration:: done]
    -- better . use
    {
      'tpope/vim-repeat',
      lazy = false,
    },
    -- more <C-A>
    {
      'tpope/vim-speeddating',
      lazy = false,
    },
    {
      'zef/vim-cycle',
      lazy = false,
    },
    --[[ use {
  'monaqa/dial.nvim',
  version = 'v0.3.0',
  config = function()
  require('dial.map').setup{}
  end
  } ]]

    -- [migration:: TODO]
    -- quick diff between files
    -- using telescope
    {
      "jemag/telescope-diff.nvim",
      dependencies = 'telescope.nvim',
      config = function()
        require("telescope").load_extension("diff")
      end
    },

    ------ buffers ------

    -- [migration:: done]
    -- close unused buffers
    {
      "chrisgrieser/nvim-early-retirement",
      event = "VeryLazy",
      config = function()
        require("early-retirement").setup {
          -- close as early as possible
          -- since I have a tendency to use tabs if there is any way I will still
          -- use them
          -- that's why I need this plugin
          retirementAgeMins = 1,
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

    -- [migration:: done]
    -- I could add it to my own autocommands, or use off the shelf
    -- honestly, which is better?
    {
      "cappyzawa/trim.nvim",
      event = "VeryLazy",
      config = function()
        require("trim").setup({})
      end
    },

    -- [migration:: done]
    -- lastplace
    -- maintain the last cursor position in files you opened before
    {
      'ethanholz/nvim-lastplace',
      lazy = false,
      config = function()
        require('nvim-lastplace').setup {}
      end
    },

    -- [migration:: done]
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

    -- [migration:: done]
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

    -- [migration:: done]
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

    -- [migration:: done]
    -- better resizing
    {
      'mrjones2014/smart-splits.nvim',
      event = "VeryLazy",
      config = function()
        require('smart-splits').setup {}
      end
    },

    -- [migration:: done]
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

    -- [migration:: done]
    -- like tmux zoom, but even more user friendly
    {
      'nyngwang/NeoZoom.lua',
      event = "VeryLazy",
      config = function()
        require('neo-zoom').setup {
          top_ratio = 1,
          left_ratio = 1,
          width_ratio = 1,
          height_ratio = 1,
          border = 'double',
          disable_by_cursor = true, -- zoom-out/unfocus when you click anywhere else.
          exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
          popup = {
            enabled = true,
            exclude_filetypes = {},
            exclude_buftypes = {},
          },
        }
        vim.keymap.set('n', '<BS>', function() vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
        vim.keymap.set('n', '|', function() vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
        vim.keymap.set('n', '<C-W><CR>', function() vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
      end
    },

    ------ search ------

    -- [migration:: TODO]  # requires telescope
    -- better string conversions
    -- a bit like tpope's vim-abolish, but with telescope integration
    {
      'johmsalas/text-case.nvim',
      event = "VeryLazy",
      dependencies = 'telescope.nvim',
      config = function()
        require('textcase').setup {}
        require('telescope').load_extension('textcase')
      end
    },

    -- [migration:: done]
    -- better search for multiple words under cursor
    {
      "dvoytik/hi-my-words.nvim",
      event = "VeryLazy",
      config = function()
        require("hi-my-words").setup {}
        nmap('*', ':HiMyWordsToggle<CR>n')
        nmap('<space>*', ':HiMyWordsClear<CR>:noh<CR>')
      end
    },

    -- [migration:: done]
    -- fuzzy finding with fzf
    -- NOTE: requires fzf and ripgrep installed on the system.
    {
      'junegunn/fzf.vim',
      event = "VeryLazy",
    },

    -- [migration:: done]
    -- telescope and related
    {
      'nvim-telescope/telescope.nvim',
      version = '0.1.*',
      event = "VeryLazy",
      dependencies = {
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
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },

    ------ motions ------

    -- [migration:: skip]
    -- visual feedback on undo/redo
    -- this currently has a problem with cmp, but otherwise is awesome
    -- https://github.com/tzachar/highlight-undo.nvim/issues/2
    {
      'tzachar/highlight-undo.nvim',
      event = "VeryLazy",
      config = function()
        require('highlight-undo').setup({
          hlgroup = 'HighlightUndo',
          duration = 300,
          keymaps = {
            { 'n', 'u',     'undo', {} },
            { 'n', '<C-r>', 'redo', {} },
          }
        })
      end
    },

    -- [migration:: done]
    -- better word based movement
    {
      "chrisgrieser/nvim-spider",
      event = "VeryLazy",
    },


    -- [migration:: done]
    -- see where f/F will take you quickly, so you can plan ahead with ;/,
    {
      'jinh0/eyeliner.nvim',
      event = "VeryLazy",
      config = function()
        require 'eyeliner'.setup {
          highlight_on_key = false, -- show highlights only after keypress
          dim = false,              -- dim all other characters if set to true
        }
      end
    },

    -- [migration:: done]
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    },

    -- [migration:: done]
    -- better tpope/vim-unimpaired
    {
      'echasnovski/mini.bracketed',
      event = "VeryLazy",
      config = function()
        require('mini.bracketed').setup {
          -- probably don't really use it, but why not
          buffer     = { suffix = 'b', options = {} },
          -- because # is above 3, and / is harder to reach
          comment    = { suffix = '3', options = {} },
          -- I'm excited to try this one
          conflict   = { suffix = 'x', options = {} },
          -- same as <space>n for me
          diagnostic = { suffix = '', options = {} },
          -- no need, plus ]f is for functions
          file       = { suffix = '', options = {} },
          -- might be useful in json
          indent     = { suffix = 'j', options = {} },
          -- don't use this
          jump       = { suffix = '', options = {} },
          -- no need
          location   = { suffix = '', options = {} },
          -- similar enough to <C-O> that I don't really need it
          oldfile    = { suffix = '', options = {} },
          -- wonder if this makes any difference to <space>n
          quickfix   = { suffix = 'q', options = {} },
          -- not sure what this does, but why not
          treesitter = { suffix = 't', options = {} },
          -- can be nice
          undo       = { suffix = '', options = {} },
          -- don't think I use it, but that's ok for now
          window     = { suffix = 'w', options = {} },
          -- can be nice
          yank       = { suffix = 'y', options = {} },
        }
      end
    },

    -- [migration:: TODO]
    -- readline commands everywhere
    -- this is sort of the basic emacs shortcuts
    {
      'linty-org/readline.nvim',
      event = "VeryLazy",
    },

    ------ edit actions ------

    -- [migration:: done]
    -- so far the best autopair I've tried.  I used to have reservations
    {
      "windwp/nvim-autopairs",
      event = "VeryLazy",
      config = function()
        require("nvim-autopairs").setup {
          check_ts = true,
          break_undo = false,
          map_c_h = true,
          map_c_w = true,
        }
      end
    },

    -- [migration:: skip]
    -- print as action
    {
      'rareitems/printer.nvim',
      event = "VeryLazy",
      config = function()
        require('printer').setup({
          keymap = "<space>p" -- Plugin doesn't have any keymaps by default
        })
      end
    },

    -- [migration:: done]
    -- comments as actions
    {
      'numToStr/Comment.nvim',
      event = "VeryLazy",
      config = function()
        require('Comment').setup()
      end
    },

    -- [migration:: TODO]
    -- color picker and stuff
    {
      'uga-rosa/ccc.nvim',
      event = "VeryLazy",
      config = function()
        require("ccc").setup {
          highlighter = {
            auto_enable = true
          }
        }
      end
    },

    -- [migration:: TODO]
    -- tmux integration for registers
    {
      'tpope/vim-tbone',
      event = "VeryLazy",
      init = function()
        vmap('<C-T>', ':Tyank<CR>')
        nmap('<C-T>', 'V:Tyank<CR>')
      end
    },

    ---- python specific

    -- [migration:: skip]
    -- python indent
    {
      'Vimjas/vim-python-pep8-indent',
      event = "VeryLazy",
    },

    -- [migration:: skip]
    -- python f-string
    {
      "roobert/f-string-toggle.nvim",
      event = "VeryLazy",
      config = function()
        require("f-string-toggle").setup {
          key_binding = "<space>S"
        }
      end,
    },

    ------ git ------

    -- [migration:: done]
    -- view git messages
    {
      'rhysd/git-messenger.vim',
      event = "VeryLazy",
      config = function()
        vim.g.git_messenger_no_default_mappings = false
        nmap('gm', '<Plug>(git-messenger)')
      end,
    },

    -- [migration:: done]
    -- in line git display
    {
      'lewis6991/gitsigns.nvim',
      event = "VeryLazy",
      dependencies = 'nvim-lua/plenary.nvim',
      config = function()
        require('gitsigns').setup()
      end
    },

    -- [migration:: skip]
    -- a bit like fugitive in lua
    {
      'TimUntersberger/neogit',
      event = "VeryLazy",
      config = function()
        require('neogit').setup {}
      end
    },

    ------ hints ------

    -- [migration:: done]
    -- cheatsheet, except for hydras
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      config = function()
        require("which-key").setup {}
      end
    },

    ----------- TreeSitter -----------

    -- [migration:: TODO]
    -- the main treesitter config
    -- those listed here under required are interconnected in their config, so
    -- they are to me part of the main treesitter installation, not just an extension
    {
      'nvim-treesitter/nvim-treesitter',
      event = "VeryLazy",
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'drybalka/tree-climber.nvim',
      },
      config = function()
        require 'nvim-treesitter.configs'.setup {
          highlight = {
            enable = true,
            -- obsidian suggests this
            additional_vim_regex_highlighting = { "markdown" },
          },
          indent = {
            enable = true,
          },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = false,
              -- node_incremental = '[[',
              -- node_decremental = ']]',
              scope_incremental = '[[',
              scope_decremental = ']]',
            }
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

    -- [migration:: TODO]
    -- autopair for html using treesitter
    {
      'windwp/nvim-ts-autotag',
      event = "VeryLazy",
      config = function()
        require('nvim-ts-autotag').setup()
      end,
      dependencies = 'nvim-treesitter/nvim-treesitter',
    },

    -- [migration:: TODO]
    -- show current function, class, etc if its definition is not currently visible
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

    -- [migration:: TODO]
    -- better folds using treesitter
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

    -- [migration:: TODO]
    -- highlight code blocks
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

    ------ various/awesome ------

    -- [migration:: TODO]
    -- -- interacting with obsidian
    -- -- lets see how awesome this one is
    -- {
    --   "epwalsh/obsidian.nvim",
    --   event = "VeryLazy",
    --   dependencies = {
    --     -- Required.
    --     "nvim-lua/plenary.nvim",
    --     -- see below for full list of optional dependencies 👇
    --   },
    --   config = function()
    --     require("obsidian").setup({
    --       dir = "~/nextcloud/sync/vault",
    --       mappings = {},
    --       completion = {
    --         -- If using nvim-cmp, otherwise set to false
    --         nvim_cmp = true,
    --         -- Trigger completion at 2 chars
    --         min_chars = 2,
    --         -- Where to put new notes created from completion. Valid options are
    --         --  * "current_dir" - put new notes in same directory as the current buffer.
    --         --  * "notes_subdir" - put new notes in the default notes subdirectory.
    --         new_notes_location = "current_dir",
    --         -- Whether to add the output of the node_id_func to new notes in autocompletion.
    --         -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
    --         prepend_note_id = true
    --       },
    --       open_app_foreground = true,
    --       finder = "telescope.nvim",
    --       sort_by = "modified",
    --       sort_reversed = true,
    --       open_notes_in = "vertical"
    --       -- see below for full list of options 👇
    --     })
    --   end,
    -- },

    -- [migration:: TODO]
    -- use nvim inside browser
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

    -- [migration:: done]
    -- a bunch of textobjects, but not treesitter dependent
    -- I was expecting this as part of a treesitter plugin, but we will see if
    -- that will come around as well.  And if it will be better.
    {
      "chrisgrieser/nvim-various-textobjs",
      event = "VeryLazy",
      config = function()
        -- I only use subword from here so far, so I use manual mappings
        -- consider markdown links and html attributes for the future
        require("various-textobjs").setup({ useDefaultKeymaps = false })
      end,
    },

    -- [migration:: TODO]
    -- view markdown
    {
      "ellisonleao/glow.nvim",
      event = "VeryLazy",
      config = function()
        require("glow").setup {}
      end
    },

    -- [migration:: TODO]
    -- hydras are awesome, they have their own lua file in my setup
    -- unfortunately, they are mostly awesome in theory.  Not sure why
    {
      'anuvyklack/hydra.nvim',
      event = "VeryLazy",
      dependencies = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
    },

    -- [migration:: TODO]
    -- move to new setup done
    -- indentation guides
    {
      'lukas-reineke/indent-blankline.nvim',
      event = "VeryLazy",
      config = function()
        -- these are colorscheme specific - maybe I will create a command at some
        -- point
        -- nord
        -- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#2E3440 gui=nocombine]]
        -- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#323845 gui=nocombine]]
        -- bamboo
        vim.cmd [[highlight IndentBlanklineIndent1 guibg=#252623 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent2 guibg=#2f312c gui=nocombine]]
        require("ibl").setup {
          indent = {
            char = "",
            highlight = {
              "IndentBlanklineIndent1",
              "IndentBlanklineIndent2",
            },
          },
          scope = {
            enabled = true,
            show_start = true,
            show_end = true,
          },
          whitespace = {
            remove_blankline_trail = false,
            highlight = {
              "IndentBlanklineIndent1",
              "IndentBlanklineIndent2",
            },
          },
        }
      end
    },

    ------- Language Client -----------

    -- [migration:: TODO]
    -- Language Client
    -- lsp and installer for lsp
    {
      -- servers for all manner of things
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- required for lsp stuff
      "neovim/nvim-lspconfig",
      -- better ui for status updates
      "j-hui/fidget.nvim",
      -- configure lua lsp for neovim stuff
      'folke/neodev.nvim',
      lazy = false,
    },

    -- [migration:: TODO]
    {
      'RubixDev/mason-update-all',
      event = "VeryLazy",
      dependencies = 'mason.nvim',
      config = function()
        require('mason-update-all').setup()
      end
    },


    -- [migration:: TODO]
    -- non-lsp lsps, like linters etc
    {
      "jose-elias-alvarez/null-ls.nvim",
      event = "VeryLazy",
      config = function()
        require("null-ls").setup()
      end,
      dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- [migration:: TODO]
    -- pretty list of diagnostics
    {
      "folke/trouble.nvim",
      event = "VeryLazy",
      dependencies = "kyazdani42/nvim-web-devicons",
      config = function()
        require('trouble').setup {
          action_keys = {
            jump_close = { 'o', '<c-j>', 'enter' }
          }
        }
      end
    },

    -- pretty in line visalisation of diagnostics
    --[[ use({
"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
config = function()
require("lsp_lines").setup()
end,
}) ]]

    -- [migration:: TODO]
    -- Completions of various kinds
    { -- more setup at the bottom
      -- lsp
      'hrsh7th/cmp-nvim-lsp',
      -- commands (:)
      'hrsh7th/cmp-cmdline',
      -- words in this or other open buffers
      'hrsh7th/cmp-buffer',
      -- filepaths
      'hrsh7th/cmp-path',
      -- the core plugin
      'hrsh7th/nvim-cmp',
      -- items with underscore are not at the top
      'lukas-reineke/cmp-under-comparator',
      -- arguments to functions etc
      'hrsh7th/cmp-nvim-lsp-signature-help',
      -- dictionary
      'uga-rosa/cmp-dictionary',
      event = "VeryLazy",
    },

    -- [migration:: TODO]
    -- I don't use snippets (yet), but cmp requires it for setup
    {
      'dcampos/cmp-snippy',
      'dcampos/nvim-snippy',
      event = "VeryLazy",
      config = function()
        require('snippy').setup {}
      end
    },

    -- [migration:: TODO]
    -- completion for crates
    {
      'saecki/crates.nvim',
      event = "VeryLazy",
      version = 'v0.3.0',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('crates').setup()
      end,
    },

  },
  {
    install = {
      missing = true,
      colorscheme = { 'bamboo' },
    },
    checker = {
      enabled = true,
      notify = true,
      frequency = 86400,
    },
  }
)

----------------------------------------------
-----       setting up the plugins      ------
----------------------------------------------
-- anything that can't go into the plugin definition (config) goes here.
-- a lot of these I am not sure why they don't work under config above,
-- but well...

-- colors
vim.cmd [[ colorscheme bamboo ]]

-- Completion

-- If you want insert `(` after select function or method item
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)

-- the main completion setup function
cmp.setup({
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-<Space>>'] = cmp.mapping.complete(),
    ['<C-Q>'] = cmp.mapping.abort(),
    ['<c-j>'] = cmp.mapping.confirm({ select = false }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources(
  -- these I use all the time
    {
      -- lsp completion
      { name = 'nvim_lsp' },
      -- lsp specific to arguments for functions
      { name = 'nvim_lsp_signature_help' },
      -- { name = 'crates' },
      -- I don't use snippy yet
      -- { name = 'snippy' },
    },
    -- only when the above is not available, use this
    {
      -- words from any visible buffers
      {
        name = 'buffer',
        -- all visible buffers
        option = {
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end
        }
        -- all buffers
        -- option = {
        --   get_bufnrs = function()
        --     return vim.api.nvim_list_bufs()
        --   end
        -- }
      },
      -- dictionary (english right now)
      {
        name = "dictionary",
        keyword_length = 2,
      },
    }
  -- and if none of the above is available maybe I am typing a filepath
  -- ,
  -- this is currenlty breaking dictionary.  I guess I need to do some sorting
  -- or something
  -- {
  --   -- paths
  --   {
  --     name = 'path',
  --     options = {
  --       trailing_slash = false,
  --       label_trailing_slash = false,
  --     },
  --   },
  -- }
  ),
  -- recommended order from
  -- sorting = {
  --   comparators = {
  --     cmp.config.compare.offset,
  --     cmp.config.compare.exact,
  --     cmp.config.compare.score,
  --     require "cmp-under-comparator".under,
  --     cmp.config.compare.kind,
  --     cmp.config.compare.sort_text,
  --     cmp.config.compare.length,
  --     cmp.config.compare.order,
  --   }
  -- }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local dict = require('cmp_dictionary')
dict.setup({
  paths = { '/usr/share/dicts/en.dict' },
  exact_length = 2,  -- default
  first_case_insensitive = true,  -- experimental
})

-- LSP
-- this doesn't seem to work right if setup in config above
--require("nvim-lsp-installer").setup {}
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "angularls",
    "bashls",
    "cmake",
    "dockerls",
    "gopls",
    "html",
    "jdtls",
    "jsonls",
    "lemminx",
    "lua_ls",
    "marksman",
    "pylsp",
    "rust_analyzer",
    "sqlls",
    "texlab",
    "tsserver",
    "yamlls",
  },
  automatic_installation = true,
})
-- capabilities are from the completion plugin above, normally people just leave
-- these empy
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup {
  capabilities = capabilities
}
lspconfig.bashls.setup {
  capabilities = capabilities
}
lspconfig.angularls.setup {
  capabilities = capabilities
}
lspconfig.cmake.setup {
  capabilities = capabilities
}
lspconfig.dockerls.setup {
  capabilities = capabilities
}
lspconfig.gopls.setup {
  capabilities = capabilities
}
lspconfig.html.setup {
  capabilities = capabilities
}
lspconfig.jdtls.setup {
  capabilities = capabilities
}
lspconfig.jsonls.setup {
  capabilities = capabilities
}
lspconfig.lemminx.setup {
  capabilities = capabilities
}
lspconfig.pylsp.setup {
  capabilities = capabilities
}
lspconfig.marksman.setup {
  capabilities = capabilities
}
lspconfig.rust_analyzer.setup {
  capabilities = capabilities
}
lspconfig.sqlls.setup {
  capabilities = capabilities
}
lspconfig.texlab.setup {
  capabilities = capabilities
}
lspconfig.tsserver.setup {
  capabilities = capabilities
}
lspconfig.yamlls.setup {
  capabilities = capabilities
}
