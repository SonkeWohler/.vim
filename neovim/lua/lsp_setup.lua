----------------------------------------
--- LSP completion and related setup ---
----------------------------------------
--- this stuff does not work very well with lazy loading, etc.  So it is part of
--- the main setup instead.
--- Put last so even if anything is messed up with it, the rest of the setup is
--- already done and I have all the quality of life stuff I need.

-- snippy is required for cmp
-- I could set it up in its lazy file, or here, where it is needed
require('snippy').setup {}

-- the main completion engine
local cmp = require('cmp')

-- for '()' after insert
cmp.event:on(
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)

-- the main completion setup function
-- this is pretty long, but needs to come first
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

-- dictionary completion
-- this requires the dictionary to be setup
-- which is currently done in setup/script.bash
local dict = require('cmp_dictionary')
dict.setup({
  paths = { '/usr/share/dicts/en.dict' },
  exact_length = 2,  -- default
  first_case_insensitive = true,  -- experimental
})

-- LSP manager
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

-- connect completion with lsp and make them play nice
local capabilities = require('cmp_nvim_lsp').default_capabilities()
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
