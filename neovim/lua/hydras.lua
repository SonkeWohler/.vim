local Hydra = require('hydra')

----- LSP -----
Hydra({
  name = 'hydra-lsp',
  mode = 'n',
  body = 'c',
  config = {
    --foreign-keys = nil,
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
    {'w', ':lua vim.lsp.buf.workspace_symbol()<cr>', { desc = '' }},
    {'<c-e>', '<c-e>'},
    {'<c-y>', '<c-y>'},
    {'<Esc>', nil, { exit = true, desc = 'quit' }},
    {'q', nil, { exit = true, desc = 'quit' }},
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
