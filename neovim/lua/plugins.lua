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
        default = true;
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
  use 'tomasr/molokai'
  use 'tanvirtin/monokai.nvim'
  use 'Shatur/neovim-ayu'
  use 'altercation/vim-colors-solarized'
  use 'xXTgamerXx/everforest-neovim'
  use 'shaunsingh/nord.nvim'
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
  ------ buffers ------
  -- tab and status lines
  use {
    'kdheepak/tabline.nvim',
    requires = {
      { 'hoob3rt/lualine.nvim', opt = true },
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
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
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
        view = {
          adaptive_size = true,
          mappings = {
            list = {
              { key = "o", action = "edit_no_picker" },
              { key = "O", action = "edit" },
              { key = "v", action = "vsplit" },
              { key = "s", action = "split" },
              { key = "t", action = "tabnew" },
              { key = "i", action = "toggle_file_info" },
            },
          },
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      }
    end
  }
  ------ search ------
  -- better string conversions I still have to get used to
  -- a bit like tpope's vim-abolish
  use {
    'johmsalas/text-case.nvim',
    config = function()
      require('textcase').setup {}
    end
  }
  -- fuzzy finding with fzf
  -- NOTE: requires fzf and ripgrep installed on the system.
  use 'junegunn/fzf.vim'
  -- telescope and related
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
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
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      }
      require('telescope').load_extension('fzf')
    end
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  ------ motions ------
  -- like tpope's surround but more maintained
  use {
    'machakann/vim-sandwich',
    -- I am still used to the tpope/surround keys
    config = function()
      vim.cmd [[ runtime macros/sandwich/keymap/surround.vim ]]
    end
  }

  -- color picker and stuff
  use {
    'uga-rosa/ccc.nvim',
    config = function()
      require("ccc").setup{
        highlighter = {
          auto_enable = true
        }
      }
    end
  }

  -- readline commands everywhere
  -- this is sort of the basic emacs shortcuts
  use 'linty-org/readline.nvim'

  -- print as action
  use {
    'rareitems/printer.nvim',
    config = function()
      require('printer').setup({
        keymap = "gp" -- Plugin doesn't have any keymaps by default
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

  -- tmux integration for registers
  use {
    'tpope/vim-tbone',
    setup = {
      vmap('<C-T>', ':Tyank<CR>'),
      nmap('<C-T>', 'V:Tyank<CR>')
    }
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
  -- like fugitive in lua
  use {
    'TimUntersberger/neogit',
    config = function()
      require('neogit').setup {}
    end
  }

  ------ hints ------
  -- cheatsheet, except for hydras
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  ------ various/awesome ------
  -- hydras are awesome, they have their own lua file in my setup
  use { 'anuvyklack/hydra.nvim',
    requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
  }
  -- better sessions, also useful (apparently) for tmux sessions
  use {
    'tpope/vim-obsession',
  }
  -- so far the best autopair I've tried.  I used to have reservations
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
      }
    end
  }
  use {"ellisonleao/glow.nvim"}

  -- Treesitter
  -- better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    -- run = ':TSUpdate',
    config = function()
      local configs = require 'nvim-treesitter.configs'
      configs.setup {
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'false',
            node_incremental = '[[',
            node_decremental = ']]',
            scope_incremental = '{{',
            scope_decremental = '}}',
          }
        }
      }
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
  }

  -- more textobjects
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  }

  -- show current function, class, etc if its definition is not currently visible
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        line_numbers = true,
        separator = ' ',
        -- mode = 'topline',
        -- max_lines = 7,
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
  -- indentation guides
  -- use 'lukas-reineke/indent-blankline.nvim'

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
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
  }
  -- I don't use snippets (yet), but cmp requires it
  use {
    'dcampos/cmp-snippy',
    'dcampos/nvim-snippy',
    config = function()
      require('snippy').setup {}
    end
  }
  -- terminal.  Not that I use it often, but as nvim becomes more like an IDE in
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
end)

----------------------------------------------
-----       setting up the plugins      ------
----------------------------------------------
-- anything that can't go into the plugin definition (config) goes here.
-- a lot of these I am not sure why they don't work under config above,
-- but well...

-- colors
require('ayu').setup({
    mirage = false,
    overrides = {},
})
require('monokai').setup{ palette = require('monokai').soda }
-- require('molokai').setup{}
vim.g.nord_borders = true
vim.g.nord_contrast = true
-- vim.g.nord_disable_background = true
-- vim.cmd [[ colorscheme monokai_soda ]]
-- vim.cmd [[ colorscheme ayu ]]
vim.cmd [[ colorscheme nord ]]

-- Completion
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
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
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
      { name = 'buffer' },
    }),
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP
-- this doesn't seem to work right if setup in config above
--require("nvim-lsp-installer").setup {}
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "bashls",
    "angularls",
    "bashls",
    "cmake",
    "dockerls",
    "gopls",
    "html",
    "jdtls",
    "jsonls",
    "lemminx",
    "jedi_language_server",
    "marksman",
    "rust_analyzer",
    "sqlls",
    "texlab",
    "tsserver",
    "yamlls",
  }
})
-- capabilities are from the completion plugin above, normally people just leave
-- these empy
local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup {
  capabilities = capabilities
}
lspconfig.bashls.setup {
  capabilities = capabilities
}
lspconfig.angularls.setup {
  capabilities = capabilities
}
lspconfig.bashls.setup {
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
-- lspconfig.jedi_language_server.setup {
--   capabilities = capabilities
-- }
lspconfig.pylsp.setup {
  capabilities = capabilities
}
-- lspconfig.pyright.setup {
--   capabilities = capabilities
-- }
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
