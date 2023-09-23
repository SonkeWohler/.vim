-------------------------------------------------------------------
--------------       import and manage plugins       --------------
-------------------------------------------------------------------
--------------  this includes settings and mappings  --------------
--------------   for specific plugins, except hydra  --------------
-------------------------------------------------------------------


----------------------------------------------
------        importing plugins         ------
----------------------------------------------

require('packer').startup(function()
  ------ meta ------

  -- packer itself
  use 'wbthomason/packer.nvim'

  ------ looks ------

  -- nerd fonds, should be part of requirements in other plugins as well anyway
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {
        default = true,
      }
    end
  }

  -- pretty notifications
  use {
    'rcarriga/nvim-notify',
    -- "folke/noice.nvim",
    -- "MunifTanjim/nui.nvim",
    config = function()
      require("notify").setup {
        stages = 'slide',
      }
      require('telescope').load_extension('notify')
      vim.notify = require("notify")
    end,
    after = 'telescope.nvim'
  }

  -- improved ui interfaces
  use {
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
  }

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

  use {
    'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_borders = true
      vim.g.nord_contrast = true
      -- vim.g.nord_disable_background = true
    end
  }

  use {
    'ribru17/bamboo.nvim',
    condif = function()
      require('bamboo').setup {}
      require('bamboo').load()
    end
  }

  -- use {
  --   "phha/zenburn.nvim",
  --   config = function() require("zenburn").setup() end
  -- }

  ------ commands ------

  -- better . use
  use 'tpope/vim-repeat'
  -- more <C-A>
  use 'tpope/vim-speeddating'
  use 'zef/vim-cycle'
  --[[ use {
  'monaqa/dial.nvim',
  tag = 'v0.3.0',
  config = function()
  require('dial.map').setup{}
  end
  } ]]

  -- quick diff between files
  -- using telescope
  use {
    "jemag/telescope-diff.nvim",
    after = 'telescope.nvim',
    config = function()
      require("telescope").load_extension("diff")
    end
  }

  ------ buffers ------

  -- close unused buffers
  use {
    "chrisgrieser/nvim-early-retirement",
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
  }

  -- I could add it to my own autocommands, or use off the shelf
  -- honestly, which is better?
  use({
    "cappyzawa/trim.nvim",
    config = function()
      require("trim").setup({})
    end
  })

  -- lastplace
  -- maintain the last cursor position in files you opened before
  use {
    'ethanholz/nvim-lastplace',
    config = function()
      require('nvim-lastplace').setup {}
    end
  }

  -- tabline
  use {
    'kdheepak/tabline.nvim',
    requires = {
      { 'hoob3rt/lualine.nvim',         opt = true },
      { 'kyazdani42/nvim-web-devicons', opt = true }
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
  }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      -- plugin dependency
      { 'kyazdani42/nvim-web-devicons', opt = true },
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
  }

  -- better cursor line behaviour, especially for inactive buffers
  use {
    'tummetott/reticle.nvim',
    config = function()
      require('reticle').setup {
        -- set default, just in case it changes in the future
        follow = {
          cursorline = true,
          cursorcolumn = true,
        },
        -- I can still tell where the cursor is in the other files, it is just
        -- less distracting now
        always_show_cl_number = true
      }
    end
  }

  -- better resizing
  use {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require('smart-splits').setup {}
    end
  }

  -- file view as tree, like nerdtree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup {
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        on_attach = NvimTreeOnAttach,
      }
    end
  }

  -- like tmux zoom, but even more user friendly
  use {
    'nyngwang/NeoZoom.lua',
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
  }

  ------ search ------

  -- better string conversions
  -- a bit like tpope's vim-abolish, but with telescope integration
  use {
    'johmsalas/text-case.nvim',
    after = 'telescope.nvim',
    config = function()
      require('textcase').setup {}
      require('telescope').load_extension('textcase')
    end
  }

  -- better search for multiple words under cursor
  use {
    "dvoytik/hi-my-words.nvim",
    config = function()
      require("hi-my-words").setup {}
      nmap('*', ':HiMyWordsToggle<CR>n')
      nmap('<space>*', ':HiMyWordsClear<CR>:noh<CR>')
    end
  }

  -- fuzzy finding with fzf
  -- NOTE: requires fzf and ripgrep installed on the system.
  use 'junegunn/fzf.vim'
  -- telescope and related
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.*',
    requires = {
      -- plugin dependency
      { 'nvim-lua/plenary.nvim' },
      ---- addons for this plugin -----
      -- undo tree
      "debugloop/telescope-undo.nvim",
      -- clipboard
      "AckslD/nvim-neoclip.lua",
    },
    after = 'telescope-fzf-native.nvim',
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
          undo = {
          },
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
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  ------ motions ------

  -- visual feedback on undo/redo
  -- this currently has a problem with cmp, but otherwise is awesome
  -- https://github.com/tzachar/highlight-undo.nvim/issues/2
  use {
    'tzachar/highlight-undo.nvim',
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
  }

  -- better word based movement
  use {
    "chrisgrieser/nvim-spider",
  }


  -- see where f/F will take you quickly, so you can plan ahead with ;/,
  use {
    'jinh0/eyeliner.nvim',
    config = function()
      require 'eyeliner'.setup {
        highlight_on_key = false, -- show highlights only after keypress
        dim = false,              -- dim all other characters if set to true
      }
    end
  }

  -- like tpope's surround but more maintained
  use {
    'machakann/vim-sandwich',
    -- I am still used to the tpope/surround keys
    config = function()
      vim.cmd [[ runtime macros/sandwich/keymap/surround.vim ]]
    end
  }

  -- surround built in lua, but not sure it is where I need it to be
  -- use({
  --   "kylechui/nvim-surround",
  --   tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   config = function()
  --     require("nvim-surround").setup({
  --       -- Configuration here, or leave empty to use defaults
  --     })
  --   end
  -- })

  -- better tpope/vim-unimpaired
  use {
    'echasnovski/mini.bracketed',
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
  }

  -- readline commands everywhere
  -- this is sort of the basic emacs shortcuts
  use 'linty-org/readline.nvim'

  ------ edit actions ------

  -- so far the best autopair I've tried.  I used to have reservations
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        check_ts = true,
        break_undo = false,
        map_c_h = true,
        map_c_w = true,
      }
    end
  }

  -- print as action
  use {
    'rareitems/printer.nvim',
    config = function()
      require('printer').setup({
        keymap = "<space>p" -- Plugin doesn't have any keymaps by default
      })
    end
  }

  -- comments as actions
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- color picker and stuff
  use {
    'uga-rosa/ccc.nvim',
    config = function()
      require("ccc").setup {
        highlighter = {
          auto_enable = true
        }
      }
    end
  }

  -- tmux integration for registers
  use {
    'tpope/vim-tbone',
    setup = {
      vmap('<C-T>', ':Tyank<CR>'),
      nmap('<C-T>', 'V:Tyank<CR>')
    }
  }

  ---- python specific

  -- python indent
  use {
    'Vimjas/vim-python-pep8-indent'
  }

  -- python f-string
  use {
    "roobert/f-string-toggle.nvim",
    config = function()
      require("f-string-toggle").setup {
        key_binding = "<space>S"
      }
    end,
  }

  ------ git ------

  -- view git messages
  use {
    'rhysd/git-messenger.vim',
    setup = function()
      vim.g.git_messenger_no_default_mappings = false
    end,
    config = {
      nmap('gm', '<Plug>(git-messenger)')
    }
  }

  -- in line git display
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- a bit like fugitive in lua
  use {
    'TimUntersberger/neogit',
    config = function()
      require('neogit').setup {}
    end
  }

  -- but still need fugitive for some stuff
  use {
    'tpope/vim-fugitive'
  }

  ------ hints ------

  -- cheatsheet, except for hydras
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  ----------- TreeSitter -----------

  -- the main treesitter config
  -- those listed here under required are interconnected in their config, so
  -- they are to me part of the main treesitter installation, not just an extension
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
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
    -- run = ':TSUpdate',
  }

  -- autopair for html using treesitter
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  -- show current function, class, etc if its definition is not currently visible
  use {
    'nvim-treesitter/nvim-treesitter-context',
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
    after = 'nvim-treesitter',
  }

  -- better folds using treesitter
  use {
    'kevinhwang91/nvim-ufo',
    requires = {
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
  }

  -- highlight code blocks
  use {
    "atusy/tsnode-marker.nvim",
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
  }

  ------ various/awesome ------

  -- interacting with obsidian
  -- lets see how awesome this one is
  use({
    "epwalsh/obsidian.nvim",
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require("obsidian").setup({
        dir = "~/nextcloud/sync/vault",

        mappings = {},
        completion = {
          -- If using nvim-cmp, otherwise set to false
          nvim_cmp = true,
          -- Trigger completion at 2 chars
          min_chars = 2,
          -- Where to put new notes created from completion. Valid options are
          --  * "current_dir" - put new notes in same directory as the current buffer.
          --  * "notes_subdir" - put new notes in the default notes subdirectory.
          new_notes_location = "current_dir",

          -- Whether to add the output of the node_id_func to new notes in autocompletion.
          -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
          prepend_note_id = true
        },
        open_app_foreground = true,
        finder = "telescope.nvim",
        sort_by = "modified",
        sort_reversed = true,
        open_notes_in = "vertical"

        -- see below for full list of options 👇
      })
    end,
  })

  -- note taking
  -- lets see how awesome this is
  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.summary"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/nextcloud/sync/notes/main",
                work = "~/nextcloud/sync/notes/work",
                loc = "~/libraries/notes",
              },
              default_workspace = "work",
            },
          },
        },
      }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
  }

  -- use nvim inside browser
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end,
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
  }

  -- better open files from terminals inside neovim
  use {
    'willothy/flatten.nvim',
    config = function()
      require('flatten').setup {
        window = {
          open = "tab",
          diff = "tab_vsplit",
          focus = "first",
        }
      }
    end
  }

  -- a bunch of textobjects, but not treesitter dependent
  -- I was expecting this as part of a treesitter plugin, but we will see if
  -- that will come around as well.  And if it will be better.
  use {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      -- I only use subword from here so far, so I use manual mappings
      -- consider markdown links and html attributes for the future
      require("various-textobjs").setup({ useDefaultKeymaps = false })
    end,
  }

  -- view markdown
  use {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup {}
    end
  }

  -- hydras are awesome, they have their own lua file in my setup
  -- unfortunately, they are mostly awesome in theory.  Not sure why
  use { 'anuvyklack/hydra.nvim',
    requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
  }

  -- indentation guides
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      -- these are colorscheme specific - maybe I will create a command at some
      -- point
      -- nord
      -- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#2E3440 gui=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#323845 gui=nocombine]]
      -- bamboo
      vim.cmd [[highlight IndentBlanklineIndent1 guibg=#252623 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guibg=#2f312c gui=nocombine]]
      require("indent_blankline").setup {
        char = "",
        show_current_context = true,
        show_current_context_start = true,
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
        },
        space_char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
        },
        show_trailing_blankline_indent = false,
      }
    end
  }

  -- terminal.  Not that I use it often, but as nvim becomes more like an IDE
  -- it can be useful sometimes.
  use {
    "akinsho/toggleterm.nvim",
    tag = '2.3.*',
    config = function()
      require("toggleterm").setup {
        size = 100,
        direction = 'vertical',
      }
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>q]], opts)
      end
    end
  }

  ------- Language Client -----------

  -- Language Client
  -- lsp and installer for lsp
  use {
    -- servers for all manner of things
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- required for lsp stuff
    "neovim/nvim-lspconfig",
    -- better ui for status updates
    "j-hui/fidget.nvim",
    -- configure lua lsp for neovim stuff
    'folke/neodev.nvim',
  }

  use {
    'RubixDev/mason-update-all',
    after = 'mason.nvim',
    config = function()
      require('mason-update-all').setup()
    end
  }


  -- non-lsp lsps, like linters etc
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- pretty list of diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require('trouble').setup {
        action_keys = {
          jump_close = { 'o', '<c-j>', 'enter' }
        }
      }
    end
  }

  -- pretty in line visalisation of diagnostics
  --[[ use({
"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
config = function()
require("lsp_lines").setup()
end,
}) ]]

  -- Completions of various kinds
  use { -- more setup at the bottom
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
  }

  -- I don't use snippets (yet), but cmp requires it for setup
  use {
    'dcampos/cmp-snippy',
    'dcampos/nvim-snippy',
    config = function()
      require('snippy').setup {}
    end
  }

  -- completion for crates
  use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  ------- experiment

  use {
    'sk1418/HowMuch',
  }
end)

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
dict.setup({})
dict.switcher({
  spelllang = {
    en = "/usr/share/dicts/en.dict"
  }
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
