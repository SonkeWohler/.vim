----------------------------------------
--- LSP completion and related setup ---
----------------------------------------
--- this stuff does not work very well with lazy loading, etc.  So it is part of
--- the main setup instead.
--- Put last so even if anything is messed up with it, the rest of the setup is
--- already done and I have all the quality of life stuff I need.

local lsp_zero = require('lsp-zero')

-- prevents me from manually setting up completion
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

--- if you want to know more about lsp-zero and mason.nvim
--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
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
    "rust_analyzer",
    "sqlls",
    "texlab",
    "tsserver",
    "yamlls",
    "pylsp",
    -- "docformatter",
    -- "isort",
  },
  automatic_installation = true,
})

-- local lua_opts = lsp_zero.nvim_lua_ls()
-- require('lspconfig').lua_ls.setup(lua_opts)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- confirm
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<c-j>'] = cmp.mapping.confirm({ select = false }),
    -- different from <esc> by undoing any completion so far
    ['<C-Q>'] = cmp.mapping.abort(),
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
      },
      -- dictionary (english right now)
      {
        name = "dictionary",
        keyword_length = 2,
      },
    }
  ),
})

-- dictionary completion
-- this requires the dictionary to be setup
-- which is currently done in setup/script.bash
local dict = require('cmp_dictionary')
dict.setup({
  paths = { '/usr/share/dicts/en.dict' },
  exact_length = 2,              -- default
  first_case_insensitive = true, -- experimental
})
