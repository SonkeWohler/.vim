local Hydra = require('hydra')

----- LSP -----
Hydra({
  name = 'hydra-lsp',
  mode = 'n',
  body = ',,',
  config = {
    foreign_keys = nil,
    invoke_on_body = true,
  },
  heads = {
    {'n', ':lua vim.diagnostic.goto_next()<cr>', { desc = 'go to next diagnostic' }},
    {'N', ':lua vim.diagnostic.goto_prev()<cr>', { desc = 'go to last diagnostic' }},
    {'d', '<cmd>Telescope lsp_definitions<CR>', {
      exit = true,
      desc = 'go to definition',
    }},
    {'D', '<cmd>Telescope lsp_references<CR>', {
      exit = true,
      desc = 'view references' ,
    }},
    {'t', '<cmd>Telescope lsp_type_definitions<CR>', {
      exit = true,
      desc = 'go to type definition',
    }},
    {'T', '<cmd>Telescope diagnostics<CR>', {
      exit = true,
      desc = 'diagnostics',
    }},
    {'I', '<cmd>Telescope lsp_implementations<CR>', { exit = true, desc = 'view implementation' }},
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
    {';', nil, { exit = true, desc = 'quit' }},
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

-- -- mappings to complement the hydra
-- -- nmap('gd', ':lua vim.lsp.buf.definition()<cr>')
-- nmap('gd', '<cmd>Telescope lsp_definitions<CR>')
-- nmap('gD', ':lua vim.lsp.buf.type_definition()<cr>')
-- nmap('gi', ':lua vim.lsp.buf.implementation()<cr>')
-- --nmap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
-- nmap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
-- -- nmap('gr', ':lua vim.lsp.buf.references()<cr>')
-- nmap('gr', '<cmd>Telescope lsp_references<CR>')
-- nmap('K', ':lua vim.lsp.buf.hover()<cr>')
-- -- nmap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
-- -- nmap('L', ':lua vim.lsp.buf.code_action()<cr>')
-- -- nmap('R', ':lua vim.lsp.buf.rename()<cr>')

----- Windows -----
Hydra({
  name = 'hydra-<C-W>',
  mode = 'n',
  body = '<c-w><c-w>',
  config = {
    foreign_keys = 'warn',
    invoke_on_body = true,
  },
  heads = {
    -- move across buffers
    {'h', '<c-W>h', { desc = 'left buffer' }},
    {'l', '<c-W>l', { desc = 'right buffer' }},
    {'k', '<c-W>k', { desc = 'up buffer' }},
    {'j', '<c-W>j', { desc = 'down buffer' }},
    -- commandds quit, save and load
    {'q', ':q<CR>', { desc = 'close buffer' }},
    {'w', ':w<CR>', { desc = 'save buffer' }},
    {'e', ':e<CR>', { desc = 'reload buffer' }},
    -- simple spllit buffer
    {'v', ':vsplit<CR>', { desc = 'vertical split' }},
    {'s', ':split<CR>', { desc = 'horizontal buffer' }},
    -- splilt current buffer into new tab, effectively similar to tmux zoom
    {'t', '<Cmd>tab split<CR>', { desc = 'buffer to new tab (split)' }},
    -- next/prev tab
    {'n', '<Cmd>tabnext<CR>', { desc = 'next tab' }},
    {'N', '<Cmd>tabprevious<CR>', { desc = 'previous tab' }},
    -- specific buffer
    {'T', '<Cmd>Buffers<CR>', { desc = 'pick buffer from fzf' }},
    {'1', 'gt1', { desc = 'go to buffer 1' }},
    {'2', 'gt2', { desc = 'go to buffer 2' }},
    {'3', 'gt3', { desc = 'go to buffer 3' }},
    {'4', 'gt4', { desc = 'go to buffer 4' }},
    {'5', 'gt5', { desc = 'go to buffer 5' }},
    {'6', 'gt6', { desc = 'go to buffer 6' }},
    {'7', 'gt7', { desc = 'go to buffer 7' }},
    {'8', 'gt8', { desc = 'go to buffer 8' }},
    {'9', 'gt9', { desc = 'go to buffer 9' }},
    {'0', 'gt10', { desc = 'go to buffer 10' }},
    -- move/pin buffer on tabline
    {'.', ':+tabmove<CR>', { desc = 're-order forward' }},
    {',', ':-tabmove<CR>', { desc = 're-order backward' }},
    -- {'p', '<Cmd>BufferPin<CR>', { desc = 'pin this buffer' }},
    -- close buffer(s) and remove from tablilne
    {'x', ':tabclose<CR>', { desc = 'close this tab' }},
    {'X', ':tabclose!<CR>', { desc = 'force close this tab' }},
  -- resize this buffer
    {'<', ':lua require("smart-splits").resize_left(3)<CR>', { desc = 'move vertical split left' }},
    {'>', ':lua require("smart-splits").resize_right(3)<CR>', { desc = 'move vertical split right' }},
    {'=', ':lua require("smart-splits").resize_up(3)<CR>', { desc = 'move horizontal split up' }},
    {'-', ':lua require("smart-splits").resize_down(3)<CR>', { desc = 'move horizontal split down' }},
    {'+', '<c-W>=', { desc = 'equalize buffer sizes' }},
    -- move buffer
    {'H', '<c-W>H', { desc = 'move buffer to the left' }},
    {'J', '<c-W>J', { desc = 'move buffer to the bottom' }},
    {'K', '<c-W>K', { desc = 'move buffer to the top' }},
    {'L', '<c-W>L', { desc = 'move buffer to the right' }},
    -- allow basic intra-buffer navigation while in hydra
    {'<c-e>', '<c-e>'},
    {'<c-y>', '<c-y>'},
    -- exit the hydra
    {'<esc>', nil, { exit = true, desc = 'quit hydra' }},
    {':', ':', { exit = true, desc = 'quit hydra' }},
    -- TODO resize
  }
})

--[[ ----- GitSigns ------
Hydra({
  name = 'hydra-git',
  mode = 'n',
  body = ';;',
  config = {
    foreign_keys = 'warn',
    invoke_on_body = true,
  },
  heads = {
    {'n', ':lua require("gitsigns").next_hunk()<CR>', { desc = 'next hunk' } },
    {'N', ':lua require("gitsigns").prev_hunk()<CR>', { desc = 'previous hunk' } },
    {'s', ':lua require("gitsigns").stage_hunk()<CR>', { desc = 'stage hunk' } },
    {'u', ':lua require("gitsigns").undo_stage_hunk()<CR>', { desc = 'unstage hunk' } },
    {'<c-e>', '<c-e>'},
    {'<c-y>', '<c-y>'},
    {'<Esc>', nil, { exit = true, desc = 'quit' }},
    {'q', nil, { exit = true, desc = 'quit' }},
  }
}) ]]
