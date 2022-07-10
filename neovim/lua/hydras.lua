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
    {'T', '"_cT', { exit = true }},
    {'a', '"_ca', { exit = true }},
    {'f', '"_cf', { exit = true }},
    {'F', '"_cF', { exit = true }},
    {'c', '"_cc', { exit = true }},
    {'w', '"_cw', { exit = true }},
    {'W', '"_cW', { exit = true }},
    {'e', '"_ce', { exit = true }},
    {'E', '"_cE', { exit = true }},
    {'1', '"_c1', { exit = true }},
    {'2', '"_c2', { exit = true }},
    {'3', '"_c3', { exit = true }},
    {'4', '"_c4', { exit = true }},
    {'5', '"_c5', { exit = true }},
    {'6', '"_c6', { exit = true }},
    {'7', '"_c7', { exit = true }},
    {'8', '"_c8', { exit = true }},
    {'9', '"_c9', { exit = true }},
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
    {'w', ':w<CR>', { desc = 'save buffer' }},
    {'e', ':e<CR>', { desc = 'reload buffer' }},
    {'n', '<Cmd>tabnext<CR>', { desc = 'next tab' }},
    {'N', '<Cmd>tabprevious<CR>', { desc = 'previous tab' }},
    {'>', '<Cmd>BufferMoveNext<CR>', { desc = 're-order forward' }},
    {'<', '<Cmd>BufferMovePrevious<CR>', { desc = 're-order backward' }},
    {'p', '<Cmd>BufferPin<CR>', { desc = 'pin this buffer' }},
    {'x', '<Cmd>BufferClose<CR>', { desc = 'close this tab' }},
    {'X', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', { desc = 'close all but this or pinned' }},
    {'t', '<Cmd>tab split<CR>', { desc = 'buffer to new tab (split)' }},
    {'T', '<Cmd>BufferPick<CR>', { desc = 'pick buffer letter based' }},
    {'1', '<Cmd>BufferGoto 1<CR>', { desc = 'go to buffer 1' }},
    {'2', '<Cmd>BufferGoto 2<CR>', { desc = 'go to buffer 2' }},
    {'3', '<Cmd>BufferGoto 3<CR>', { desc = 'go to buffer 3' }},
    {'4', '<Cmd>BufferGoto 4<CR>', { desc = 'go to buffer 4' }},
    {'5', '<Cmd>BufferGoto 5<CR>', { desc = 'go to buffer 5' }},
    {'6', '<Cmd>BufferGoto 6<CR>', { desc = 'go to buffer 6' }},
    {'7', '<Cmd>BufferGoto 7<CR>', { desc = 'go to buffer 7' }},
    {'8', '<Cmd>BufferGoto 8<CR>', { desc = 'go to buffer 8' }},
    {'9', '<Cmd>BufferGoto 9<CR>', { desc = 'go to buffer 9' }},
    {'0', '<Cmd>BufferGoto 10<CR>', { desc = 'go to buffer 10' }},
    {'+', '<c-W>=', { desc = 'equalize buffer sizes' }},
    {'<', ':lua require("smart-splits").resize_left(3)<CR>', { desc = 'move vertical split left' }},
    {'>', ':lua require("smart-splits").resize_right(3)<CR>', { desc = 'move vertical split right' }},
    {'=', ':lua require("smart-splits").resize_up(3)<CR>', { desc = 'move horizontal split up' }},
    {'-', ':lua require("smart-splits").resize_down(3)<CR>', { desc = 'move horizontal split down' }},
    {'H', '<c-W>H', { desc = 'move buffer to the left' }},
    {'J', '<c-W>J', { desc = 'move buffer to the bottom' }},
    {'K', '<c-W>K', { desc = 'move buffer to the top' }},
    {'L', '<c-W>L', { desc = 'move buffer to the right' }},
    {'<c-e>', '<c-e>'},
    {'<c-y>', '<c-y>'},
    {'<esc>', nil, { exit = true, desc = 'quit hydra' }},
    {':', ':', { exit = true, desc = 'quit hydra' }},
    -- TODO resize
  }
})
nmap('<c-h>', '<c-w>h')
nmap('<c-l>', '<c-w>l')
