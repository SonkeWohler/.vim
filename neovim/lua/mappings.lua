---- insert mode ----
-- not sure why nvim breaks undo with these by default, but I really prefer
-- without that.
imap('<c-w>', '<c-w>')
imap('<c-u>', '<c-u>')
-- in autopairs there is an auto-move-right, but then I have to remember what
-- pair has been autoclosed.  This is more of a universial move-right
-- it looks useless but helps me a lot
imap('<C-l>', '<Right>')
-- move cursor right, just as in GNU readline
-- especially useful when autopairs are active, because by the time I get to
-- close the pair I forgot what kind of pair it is
imap('<C-f>', '<Right>')

----- inter-buffer navigation -----
-- alt-file, go back and forth by one file
-- similar to <c-o> and <c-i> combined, but for files and only one
nmap('<m-o>', '<c-^>')
-- similar window controls are defined in the hydra-<C-W>
-- faster left and right, since that is the most common for me
nmap('<c-h>', '<c-w>h')
nmap('<c-l>', '<c-w>l')
nmap('<c-k>', '<c-w>w')
-- commands save and load
nmap('<c-s>', ':wa<CR>')
imap('<c-s>', '<esc>:wa<CR>')
nmap('<c-w>e', ':e<CR>')
-- most <M- mappings are on tmux, but not this one, or I would close my vim tab
-- way too often
-- close tab, like I have it in browser
nmap('<m-x>', '<Cmd>tabclose<CR>')
-- arrange tabs left or right
nmap('<m-.>', '<Cmd>tabmove +1<CR>')
nmap('<m-,>', '<Cmd>tabmove -1<CR>')
-- splilt current buffer into new tab, I use it similar to tmux zoom
nmap('<c-w>t', '<Cmd>tab split<CR>')
nmap('<m-t>', '<Cmd>tab split<CR>')
-- more like tmux new "tab"
nmap('<c-w>c', '<Cmd>tab split<CR>')
-- next/prev tab
nmap('<c-w>n', '<Cmd>tabnext<CR>')
nmap('<c-w>N', '<Cmd>tabprevious<CR>')
-- go to tab number
-- this doesn't yet work with just <C-1>, hence <c-w>1 instead
-- ??? wtf ???
nmap('<c-w>1', '1gt')
nmap('<c-w>2', '2gt')
nmap('<c-w>3', '3gt')
nmap('<c-w>4', '4gt')
nmap('<c-w>5', '5gt')
nmap('<c-w>6', '6gt')
nmap('<c-w>7', '7gt')
nmap('<c-w>8', '8gt')
nmap('<c-w>9', '9gt')
nmap('<c-w>0', '10gt')
-- I keep hitting ` instead of 1
nmap('`gt', '1gt')
-- neozoom is defined in plugin, since it doesn't work here
-- resize this buffer
nmap('<c-w><', ':lua require("smart-splits").resize_left(3)<CR>')
nmap('<c-w>>', ':lua require("smart-splits").resize_right(3)<CR>')
nmap('<c-w>=', ':lua require("smart-splits").resize_up(3)<CR>')
nmap('<c-w>-', ':lua require("smart-splits").resize_down(3)<CR>')
nmap('<c-w>+', '<c-W>=')
-- more window controls are defined in the hydra-<C-W>

---- intra-buffer navigation or motion ----
-- better word definitions that take CamelCase, snake_case, etc, into account
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
vim.keymap.set({ "o", "x" }, "aw", '<cmd>lua require("various-textobjs").subword("outer")<CR>')
vim.keymap.set({ "o", "x" }, "iw", '<cmd>lua require("various-textobjs").subword("inner")<CR>')
-- redefine large words with previous vim definition of words
-- I don't think I need W motions as much as w motions, but the above "subword"
-- motions I need even more
vim.keymap.set({ "n", "o", "x" }, "W", "w", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "E", "e", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "B", "b", { desc = "Spider-b" })
vim.keymap.set({ "o", "x" }, "aW", 'aw')
vim.keymap.set({ "o", "x" }, "iW", 'iw')
vim.keymap.set({ "o", "x" }, "aR", 'aW')
vim.keymap.set({ "o", "x" }, "iR", 'iW')
-- vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
-- indentation
vim.keymap.set({ "o", "x" }, "ii", '<cmd>lua require("various-textobjs").indentation("inner", "inner")<CR>')
vim.keymap.set({ "o", "x" }, "ai", '<cmd>lua require("various-textobjs").indentation("outer", "inner")<CR>')
-- I prefer the cursor at the end of a paste, usually
nmap('p', 'gp')
nmap('P', 'gP')
nmap('gp', 'p')
nmap('gP', 'P')
-- navigating/selecting last edit - easier to reach
nmap('\'"', '\'[')
nmap('\'\'', '\']')
nmap('gv', '\'[v\']V')
-- treesitter based - can be nice for ifs with many branches
-- this can be a little counter-intuitive, where each `elif` is a child of the
-- `if`, but the contents of the first branch of the `if` is also a
-- child of that same if.  Each expression is a child of the branch it is a
-- child of (every foo = bar, try:...except:..., etc)
-- Just takes a little getting used to.
nmap(']n', ":lua require('tree-climber').goto_next()<CR>")
nmap('[n', ":lua require('tree-climber').goto_prev()<CR>")
nmap(']p', ":lua require('tree-climber').goto_child()<CR>")
nmap('[p', ":lua require('tree-climber').goto_parent()<CR>")
-- emacs navigation in command mode
-- this plugin has been removed, and I haven't found a replacement :(
-- <C-d> for <DEL> is already taken by indentation, but I can use <C-l><C-h>
-- stead, since I got <C-l> anyway (from the way I use auto-pair)
-- -- local readline = require 'readline'
-- -- vim.keymap.set('!', '<M-f>', readline.forward_word)
-- -- vim.keymap.set('!', '<M-b>', readline.backward_word)
-- -- vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
-- -- vim.keymap.set('!', '<C-e>', readline.end_of_line)
-- -- vim.keymap.set('!', '<M-d>', readline.kill_word)
-- -- vim.keymap.set('!', '<C-w>', readline.backward_kill_word)
-- -- vim.keymap.set('!', '<M-BS>', readline.unix_word_rubout)
-- -- vim.keymap.set('!', '<C-k>', readline.kill_line)
-- -- vim.keymap.set('!', '<C-u>', readline.backward_kill_le)
-- arrow keys
-- I only use these when my hands aren't properly on the keyboard, so it can
-- be quite comfortable to keep just one hand near the arrow keys sometimes
-- faster but gentle scrolling
nmap('<Up>', '5<c-y>')
nmap('<Down>', '5<c-e>')
-- page up and down
nmap('<Left>', '<c-u>')
nmap('<Right>', '<c-d>')

----- LSP -----
-- I am not 100% sure whether I prefer g or l as the leader here
-- g for 'go to', but l for 'lsp'...
-- either way these mappings are experimental and I have to figure out which I
-- prefer
-- next/prev/list error
nmap('<space>n', ':lua vim.diagnostic.goto_next()<cr>')
nmap('<space>N', ':lua vim.diagnostic.goto_prev()<cr>')
nmap('<space>T', '<cmd>Telescope diagnostics<CR>')
nmap('gT', '<cmd>Telescope diagnostics<CR>') -- trouble
-- go to definition, references or implementations
local goToDefinition = '<cmd>Telescope lsp_definitions<CR>'
nmap('<space>d', goToDefinition)
local goToReferences = '<cmd>Telescope lsp_references<CR>'
nmap('<space>D', goToReferences) -- opposite of definition
nmap('<space>i', '<cmd>Telescope lsp_implementations<CR>')
nmap('<space>t', '<cmd>Telescope lsp_type_definitions<CR>')
-- nmap('gt', '<cmd>Telescope lsp_type_definitions<CR>')  -- already taken by tab navigation
-- show docs and signatures
nmap('<space>k', ':lua vim.lsp.buf.hover()<cr>')          -- not sure why I picked k, but that is what I use
nmap('<space>K', ':lua vim.lsp.buf.signature_help()<cr>') -- similar(-ish) to hover
nmap('K', ':lua vim.lsp.buf.hover()<cr>')
-- code action
nmap('<space>l', ':lua vim.lsp.buf.code_action()<CR>')
-- rename
nmap('<space>r', ':lua vim.lsp.buf.rename()<cr>')
-- document symbols
nmap('<space>o', require('telescope.builtin').lsp_document_symbols)
nmap('<space>w', require('telescope.builtin').lsp_dynamic_workspace_symbols)
-- format buffer
nmap('<space>F', vim.lsp.buf.format)

-- TODO uncomment these, because gitsigns is fine
----- GitSigns -----
--- keep in mind that I use git from bash a lot, so this is limited
local gitsigns = require 'gitsigns'
-- next/prev hunk
nmap('gn', gitsigns.next_hunk)
-- nmap('<space>g', gitsigns.next_hunk)
nmap('gN', gitsigns.prev_hunk)
nmap('GN', gitsigns.prev_hunk)
nmap('GG', 'G') -- because of the above command
-- nmap('<space>G', gitsigns.prev_hunk)
nmap('gS', gitsigns.stage_buffer)
nmap('gs', gitsigns.stage_hunk)
-- I don't use the default gu or gU in normal mode, only really in visual mode
nmap('gU', gitsigns.reset_hunk)
nmap('gu', gitsigns.undo_stage_hunk)
nmap('gl', ':Gitsigns')
-- most of the above in visual mode too
vmap('gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vmap('gU', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vmap('gu', function() gitsigns.undo_stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vmap('gl', ':Gitsigns')

----- Telescope -----
-- find files
nmap('<c-w>f', ':lua require("telescope.builtin").find_files()<CR>')
nmap('<space>f', require("telescope.builtin").find_files)
-- undo tree
nmap('<space>u', ':lua require("telescope").extensions.undo.undo()<cr>')
-- yank history
nmap('<space>y', ':Telescope neoclip <cr>')
nmap('<space>m', ':Telescope macroscope <cr>')
-- fuzzy find in current buffer
nmap('//', ':FH<cr>')
-- convert text case
-- this may be one of the cases where creating mappings for each command is not
-- a good idea, because I don't use it often enough to remember them well.
-- Luckily this has a telescope integration, so I don't even have to do any work
nmap('<space>s', '<cmd>TextCaseOpenTelescope<CR>')
vmap('<space>s', '<cmd>TextCaseOpenTelescope<CR>')
-- notification history
nmap('<space>q', ':lua require("telescope").extensions.notify.notify()<CR>')

----- Obsidian -----
--- these are some wrapper functions that overwrite my normal settings,
--- conditional on whether I am inside my obsidian vault and inside
--- also markdown file
local whichKey = '<cmd>WhichKey<CR>'
local isInObsidianVault = function()
  if nil == string.find(vim.fn.getcwd(), 'nextcloud/sync/vault') then
    return false
  end
  if vim.bo.filetype ~= 'markdown' then
    return false
  end
  return true
end
-- follow links
vim.keymap.set("n", "<space>d", function()
  if not isInObsidianVault() then
    return goToDefinition
  end
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return goToDefinition
  end
end, { noremap = false, expr = true })
-- get pages linking to this one
vim.keymap.set("n", "<space>D", function()
  if not isInObsidianVault() then
    return goToReferences
  end
  return "<cmd>ObsidianBacklinks<CR>"
end, { noremap = false, expr = true })
-- open in obsidian
vim.keymap.set("n", "<space>g", function()
  if not isInObsidianVault() then
    return whichKey
  end
  return "<cmd>ObsidianOpen<CR>"
end, { noremap = false, expr = true })

---- fixes to remember the cursor position ----
-- when searching
nmap('?', 'mh?')
nmap('/', 'mh/')
-- for commands e.g. :%s/
nmap(':', 'mg:')
-- when auto-indenting a line or paragraph
nmap('==', 'mh==`h')
nmap('=ip', 'mh=ip`h')
-- when manually indenting or unindenting a line
nmap('<<', 'mh<<`hhh')
nmap('>>', 'mh>>`hll')
-- when formatting a line or a paragraph
nmap('gqq', 'mhgqq`h')
nmap('gqip', 'mhgqip`h')

---- various ----
-- select the surrounding {} block including its definition (on the same line)
-- assumes the `for () {/newline` format, rather than `for () /newline {`
nmap('va{', 'va{V')
-- swap the two keys under the cursor
nmap('sx', '"xx"xp')
-- fold less => zl, asopposed to fold more => zm
-- this shouldn't have an uppercase version because zL is already in use
nmap('zl', 'zr')

---- registers ----
-- yank into system register
-- keep in mind "+ and "* are different system registers
vmap('""', 'y:CopyMainYankToSystemClipboard<CR>')
nmap('""', 'yy:CopyMainYankToSystemClipboard<CR>')
nmap('++', '"+p')
vmap('++', 'x"+P')
imap('"++', '<C-R>+')
-- by default use black hole register rather than unnamed
nmap('d', '"_d')
nmap('D', '"_D')
nmap('c', '"_c')
nmap('C', '"_C')
nmap('s', '"_s')
nmap('S', '"_S')
nmap('x', '"_x')
nmap('X', '"_X')
-- for visual mode as well, except 'd'
vmap('x', '"_x')
vmap('X', '"_X')
vmap('c', '"_c')
vmap('C', '"_C')
vmap('s', '"_s')
vmap('S', '"_S')
-- also, don't need C, D, Y in visual, and S seems to be the same as cc
nmap('S', '"_ddP')
vmap('C', '"_xP')

---- tabs ----
-- new tab with current buffer
nmap('<C-W>T', ':tab split<CR>')
nmap('gT', ':tab split<CR>')
-- goto next/previous tab
-- nmap('gt', ':tabnext<CR>')  -- this is in by default, even with a count
nmap('gh', ':tabprevious<CR>')
-- nicely/force close tab
nmap('gx', ':tabclose<CR>')
nmap('gX', ':tabclose!<CR>')
-- rename current tab
-- waits for argument in command mode
nmap('gr', ':TablineTabRename ')

---- selection ----
-- select the line, without the newline character
-- then I can copy it to different registers, or whatever
nmap('vv', '0v$h')

---- line ----
-- start insert mode with a new line above or below while maintaining indent
nmap('o', 'ox<BS>')
nmap('O', 'Ox<BS>')
-- insert newline above the cursor, cursor stays on current line
nmap('<C-j>', 'Ox<BS><Esc>0"_d$j')
-- insert new line below the cursor and move cursor to new line
nmap('<C-m>', 'ox<BS><Esc>0"_d$')
nmap('<Enter>', 'ox<BS><Esc>0"_d$')
-- insert newline at the cursor and exit insert mode
imap('<C-j>', '<C-G>u<CR>x<BS><Esc>')
-- insert newline at the cursor and keep typing
imap('<C-m>', '<C-G>u<CR>x<BS><C-G>u')
-- break the line at the last space before the cursor
-- defaults to cursor if there is no space before the cursor on this line
nmap('<M-j>', 'F<Space>i<Enter><Esc>k$')
-- join this line with the next while maintaining cursor position
-- breaks use of [count]J, but I don't usually use that anyway
nmap('J', 'mJJ`J')
-- move this line up/down, one at a time
-- will behave weird when used with count
nmap('<m-p>', 'V"pdk"pP')
nmap('<m-n>', 'V"pd"pp')

---- spelling ----
-- choose the first suggestion for the word under the cursor
nmap('zz', 'z=1<CR><CR>')
-- choose the first suggestion for the last misspelled word (before the cursor)
-- also returns the cursor to its original position
nmap('zs', 'ms[sz=1<CR><CR>`s')

---- temporary fixes ----
-- I should try to keep this list empty whenever possible, but that may require
-- some investigation
-- here I keep any mappings that exist solely to fix issues that I cannot
-- explain.  Like if '%' suddenly stops working in visual mode I can fix that
-- here, but I also need to investigate why it suddenly stopped working.  Once I
-- figured that out and fixed it I can remove it from here.

--- % broken in visual mode ---
-- started:
-- not sure, definitely broken 28.03.2023, but I think I saw it before this point
-- description:
-- In visual mode % doesn't do anything anymore
-- notes:
-- this is not working as a fix, which tells me this is broken by something
-- after this file is loaded
-- running the lua below in manually will 'fix' the issue
-- vmap('%', '%')
