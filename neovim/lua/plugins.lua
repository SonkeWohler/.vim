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
      require('nvim-web-devicons').setup{
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
      { 'hoob3rt/lualine.nvim', opt=true },
      {'kyazdani42/nvim-web-devicons', opt = true}
    },
    config = function()
      require('tabline').setup{ }
      cmd('TN', 'TablineTabRename <q-args>', { nargs=1, desc = 'name this tab' })
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup{}
    end
  }
  -- better resizing
  use {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require('smart-splits').setup{}
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
      cmd('LSA', 'NvimTreeFindFile', { desc = 'open NvimTree here' })
      cmd('LSC', 'NvimTreeClose', {desc = 'close NvimTree'})
      cmd('LSX', 'NvimTreeClose', {desc = 'close NvimTree'})
    end
  }
  ------ search ------
  -- better string conversions I still have to get used to
  -- a bit like tpope's vim-abolish
  use{
    'johmsalas/text-case.nvim',
    config = function()
      require('textcase').setup{}
    end
  }
  -- fuzzy finding with fzf
  -- NOTE: requires fzf and ripgrep installed on the system.
  use 'junegunn/fzf.vim'
  ------ motions ------
  -- like tpope's surround but more maintained
  use {
    'machakann/vim-sandwich',
    -- I am still used to the tpope/surround keys
    config = function()
      vim.cmd [[ runtime macros/sandwich/keymap/surround.vim ]]
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
      require('neogit').setup{}
    end
  }
  ------ hints ------
  -- cheatsheet, except for hydras
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup { }
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
  ------ language support ------
  -- better python word objects/motions like functions
  -- maybe some for other languages would be nice
  use {
    'jeetsukumaran/vim-pythonsense',
    setup = function()
      vim.cmd[[
        let g:is_pythonsense_alternate_motion_keymaps = 1
        ]]
    end
  }
  -- Treesitter
  -- better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      local configs = require'nvim-treesitter.configs'
      configs.setup {
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        }
      }
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup{
        separator = ' ',
        -- mode = 'topline',
        -- max_lines = 7,
      }
    end,
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
          return {'treesitter', 'indent'}
        end
      })
    end
  }
  -- Language Client
  -- lsp and installer for lsp
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- pretty list of diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require('trouble').setup{
        action_keys = {
          jump_close = {'o', '<c-j>', 'enter'}
        }
      }
      cmd('TT', 'TroubleToggle', { desc = 'toggle Trouble plugin'} )
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
  use {  -- more setup at the bottom
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
     require('snippy').setup{}
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
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
lspconfig.jedi_language_server.setup {
  capabilities = capabilities
}
-- lspconfig.pylsp.setup {
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
