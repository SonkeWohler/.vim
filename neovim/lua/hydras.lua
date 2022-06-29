local Hydra = require('hydra')

----- LSP -----
Hydra({
  name = 'hydra-lsp',
  mode = 'n',
  body = 'c',
  config = {
    foreign_keys = nil,
    invoke_on_body = true,
  },
  heads = {
    {'n', ':lua vim.diagnostic.goto_next()<cr>', { desc = 'go to next diagnostic' }},
    {'N', ':lua vim.diagnostic.goto_prev()<cr>', { desc = 'go to last diagnostic' }},
    {'d', ':lua vim.lsp.buf.definition()<cr>', {
      exit = true,
      desc = 'go to definition',
    }},
    {'D', ':lua vim.lsp.buf.references()<cr>', {
      exit = true,
      desc = 'view references' ,
    }},
    --{'D', ':lua vim.lsp.buf.type_definition()<cr>', { desc = '' }},
    {'I', ':lua vim.lsp.buf.implementation()<cr>', { exit = true, desc = 'view implementation' }},
    {'k', ':lua vim.lsp.buf.hover()<cr>', { exit = true, desc = 'hover info' }},
    {'K', ':lua vim.lsp.buf.signature_help()<cr>', { exit = true, desc = 'signature info' }},
    {'l', ':lua vim.lsp.buf.code_action()<cr>', {
      exit = true,
      desc = 'code action',
    }},
    {'r', ':lua vim.lsp.buf.rename()<cr>', { exit = true, desc = 'rename under the cursor' }},
    --nmap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
    --{'w', ':lua vim.lsp.buf.workspace_symbol()<cr>', { desc = '' }},
    {'<c-e>', '<c-e>'},
    {'<c-y>', '<c-y>'},
    {'<Esc>', nil, { exit = true, desc = 'quit' }},
    {'q', nil, { exit = true, desc = 'quit' }},
    {'i', '"_ci', { exit = true }},
    {'t', '"_ct', { exit = true }},
    {'a', '"_ca', { exit = true }},
    {'f', '"_cf', { exit = true }},
    {'c', '"_cc', { exit = true }},
    {'w', '"_cw', { exit = true }},
  },
})
-- mappings to complement the hydra
nmap('gd', ':lua vim.lsp.buf.definition()<cr>')
nmap('gD', ':lua vim.lsp.buf.type_definition()<cr>')
nmap('gi', ':lua vim.lsp.buf.implementation()<cr>')
--nmap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nmap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nmap('gr', ':lua vim.lsp.buf.references()<cr>')
nmap('K', ':lua vim.lsp.buf.hover()<cr>')
nmap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nmap('L', ':lua vim.lsp.buf.code_action()<cr>')
nmap('R', ':lua vim.lsp.buf.rename()<cr>')

----- Windows -----
Hydra({
  name = 'hydra-<C-W>',
  mode = 'n',
  body = '<c-w>',
  config = {
    foreign_keys = 'warn',
    invoke_on_body = true,
  },
  heads = {
    {'h', '<c-W>h', { desc = 'left buffer' }},
    {'l', '<c-W>l', { desc = 'right buffer' }},
    {'k', '<c-W>k', { desc = 'up buffer' }},
    {'j', '<c-W>j', { desc = 'down buffer' }},
    {'v', ':vsplit<CR>', { desc = 'vertical split' }},
    {'s', ':split<CR>', { desc = 'horizontal buffer' }},
    {'q', ':q<CR>', { desc = 'close buffer' }},
    {'t', ':tab split<CR>', { desc = 'buffer to new tab (split)' }},
    {'T', ':tabs<CR>', { exit = true, desc = 'select from list of tabs' }},
    {'n', ':tabnext<CR>', { desc = 'next tab' }},
    {'N', ':tabprevious<CR>', { desc = 'previous tab' }},
    {'x', ':tabclose<CR>', { desc = 'close tab nicely' }},
    {'X', ':tabclose!<CR>', { desc = 'force close tab' }},
    {'w', ':w<CR>', { desc = 'save buffer' }},
    {'e', ':e<CR>', { desc = 'reload buffer' }},
    {'H', '<c-W>H', { desc = 'move buffer to the left' }},
    {'J', '<c-W>J', { desc = 'move buffer to the bottom' }},
    {'K', '<c-W>K', { desc = 'move buffer to the top' }},
    {'L', '<c-W>L', { desc = 'move buffer to the right' }},
    {'<', '<c-W><', { desc = 'shrink buffer horizontally' }},
    {'>', '<c-W>>', { desc = 'enlarge buffer horizontally' }},
    {'-', '<c-W>-', { desc = 'shrink buffer vertically' }},
    {'+', '<c-W>+', { desc = 'enlarge buffer vertically' }},
    {'=', '<c-W>=', { desc = 'equalize buffer sizes' }},
    {'<c-e>', '<c-e>'},
    {'<c-y>', '<c-y>'},
    {'<esc>', nil, { exit = true, desc = 'quit hydra' }},
    {':', ':', { exit = true, desc = 'quit hydra' }},
    -- TODO resize
  }
})
nmap('<c-h>', '<c-w>h')
nmap('<c-l>', '<c-w>l')
