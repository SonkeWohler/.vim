-- TODO uncomment, because hydra is fine
-- local Hydra = require('hydra')
--
-- -- hydras sounded more cool than they have been for me.  I am not sure why I
-- -- don't seem to be using them, but I suspect it is mostly because when
-- -- something does have a long key-sequence I just never use it.  The fact that
-- -- hydra requires me to only type out that sequence once doesn't help me
-- -- remember it.  Perhaps I'll figure it out one day.
-- --
-- -- An added problem is that I sometimes run across built in keymaps that I just
-- -- never realised existed.  At time of writing the most recent one is comma (,),
-- -- which looks to be the reverse of semi-colon (;).  I have googled for a
-- -- reverse for (;), but couldn't find it, and now I just ran across this reading
-- -- the treesitter-textobjects documentation.
-- --
-- -- So while hydras are vim on steroids, they seem to be a bit too much for me to
-- -- handle right now.  I'll walk before I run.
--
-- ----- Windows -----
-- Hydra({
--   name = 'hydra-<C-W>',
--   mode = 'n',
--   body = '<c-w><c-w>',
--   config = {
--     foreign_keys = 'warn',
--     invoke_on_body = true,
--   },
--   heads = {
--     -- move across buffers
--     { 'h',     '<c-W>h',                                           { desc = 'left buffer' } },
--     { 'l',     '<c-W>l',                                           { desc = 'right buffer' } },
--     { 'k',     '<c-W>k',                                           { desc = 'up buffer' } },
--     { 'j',     '<c-W>j',                                           { desc = 'down buffer' } },
--     -- commandds quit, save and load
--     { 'q',     ':q<CR>',                                           { desc = 'close buffer' } },
--     { 'w',     ':w<CR>',                                           { desc = 'save buffer' } },
--     { 'e',     ':e<CR>',                                           { desc = 'reload buffer' } },
--     -- simple spllit buffer
--     { 'v',     ':vsplit<CR>',                                      { desc = 'vertical split' } },
--     { 's',     ':split<CR>',                                       { desc = 'horizontal buffer' } },
--     -- splilt current buffer into new tab, effectively similar to tmux zoom
--     { 't',     '<Cmd>tab split<CR>',                               { desc = 'buffer to new tab (split)' } },
--     -- next/prev tab
--     { 'n',     '<Cmd>tabnext<CR>',                                 { desc = 'next tab' } },
--     { 'N',     '<Cmd>tabprevious<CR>',                             { desc = 'previous tab' } },
--     -- specific buffer
--     { 'T',     '<Cmd>Buffers<CR>',                                 { desc = 'pick buffer from fzf' } },
--     { '1',     'gt1',                                              { desc = 'go to buffer 1' } },
--     { '2',     'gt2',                                              { desc = 'go to buffer 2' } },
--     { '3',     'gt3',                                              { desc = 'go to buffer 3' } },
--     { '4',     'gt4',                                              { desc = 'go to buffer 4' } },
--     { '5',     'gt5',                                              { desc = 'go to buffer 5' } },
--     { '6',     'gt6',                                              { desc = 'go to buffer 6' } },
--     { '7',     'gt7',                                              { desc = 'go to buffer 7' } },
--     { '8',     'gt8',                                              { desc = 'go to buffer 8' } },
--     { '9',     'gt9',                                              { desc = 'go to buffer 9' } },
--     { '0',     'gt10',                                             { desc = 'go to buffer 10' } },
--     -- move/pin buffer on tabline
--     { '.',     ':+tabmove<CR>',                                    { desc = 're-order forward' } },
--     { ',',     ':-tabmove<CR>',                                    { desc = 're-order backward' } },
--     -- {'p', '<Cmd>BufferPin<CR>', { desc = 'pin this buffer' }},
--     -- close buffer(s) and remove from tablilne
--     { 'x',     ':tabclose<CR>',                                    { desc = 'close this tab' } },
--     { 'X',     ':tabclose!<CR>',                                   { desc = 'force close this tab' } },
--     -- resize this buffer
--     { '<',     ':lua require("smart-splits").resize_left(3)<CR>',  { desc = 'move vertical split left' } },
--     { '>',     ':lua require("smart-splits").resize_right(3)<CR>', { desc = 'move vertical split right' } },
--     { '=',     ':lua require("smart-splits").resize_up(3)<CR>',    { desc = 'move horizontal split up' } },
--     { '-',     ':lua require("smart-splits").resize_down(3)<CR>',  { desc = 'move horizontal split down' } },
--     { '+',     '<c-W>=',                                           { desc = 'equalize buffer sizes' } },
--     -- move buffer
--     { 'H',     '<c-W>H',                                           { desc = 'move buffer to the left' } },
--     { 'J',     '<c-W>J',                                           { desc = 'move buffer to the bottom' } },
--     { 'K',     '<c-W>K',                                           { desc = 'move buffer to the top' } },
--     { 'L',     '<c-W>L',                                           { desc = 'move buffer to the right' } },
--     -- allow basic intra-buffer navigation while in hydra
--     { '<c-e>', '<c-e>' },
--     { '<c-y>', '<c-y>' },
--     -- exit the hydra
--     { '<esc>', nil,                                                { exit = true, desc = 'quit hydra' } },
--     { ':',     ':',                                                { exit = true, desc = 'quit hydra' } },
--     -- TODO resize
--   }
-- })
