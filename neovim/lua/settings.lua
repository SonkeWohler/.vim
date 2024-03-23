---------------------------------------------------------------
---      Some of these options are default but I choose     ---
---            to explicitly specify them anyway            ---
---------------------------------------------------------------
-- used with obsidian and some other things, but I really don't like it
vim.opt.conceallevel = 0
-- spell, since treesitter now sorts out comments vs code
vim.opt.spell = true
-- case-sensitivity when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- tabs and indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- linebreaks
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.list = true
vim.opt.listchars = { eol = '$', tab = '> ' }
-- other formatting
vim.opt.joinspaces = true
vim.opt.textwidth = 80
vim.opt.foldlevel = 10
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- status displays
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.showmode = true
-- completion
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.completeopt = { 'menu', 'preview', 'noselect' }
-- buffers
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.diffopt = vim.opt.diffopt + 'vertical'
-- use the mouse, sometimes
vim.opt.mouse = 'a'
vim.opt.mousefocus = false
vim.opt.mousehide = true
vim.opt.mousetime = 300
-- these cpoptions are largely default, I just keep things consistent
-- A: set alt-file when :w <path>
-- c: search
-- e: execute straight away with @q
-- f: set buffer filename on read
-- F: set buffer filename on write
-- s: buffer options on enter
-- J: sentences end with double spaces, not single spaces
-- _: cw is more like ciw.  use caw to get the default cw
vim.opt.cpoptions = 'ABcefFsJ_'
-- j: handle spaces when using n_J
-- c: autwrap comments
-- r: insert comment leader in newline
-- o: insert comment leader with n_o
-- q: gq for comments
-- l: don't break in insert mode
-- n: recognize lists when formatting
-- p: don't break at single spaces '. ', since I use cpoptions 'J' this makes sense
vim.opt.formatoptions = 'jcroqlnp'
