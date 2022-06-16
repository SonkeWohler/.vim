vim.opt.ignorecase = true
vim.opt.smartcase = true
-- these cpoptions are largely default, I just keep things consistent
-- a:
-- A:
-- c: search
-- e: execute straight away with @q
-- f: set buffer filename on read
-- F: set buffer filename on write
-- s: buffer options on enter
-- J: sentences end with double spaces, not single spaces
-- _: cw is more like ciw.  use caw to get the default cw
vim.opt.cpoptions = 'aABcefFsJ_'
vim.opt.joinspaces = true
vim.opt.textwidth = 80
-- vim.opt.colorcolumn = '+1'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.formatoptions = 'roqlnjp'
vim.opt.formatoptions = 'jcroql'
-- j: handle spaces when using n_J
-- c: autwrap comments
-- r: insert comment leader in newline
-- o: insert comment leader with n_o
-- q: gq for comments
-- l: don't break in insert mode
-- n: recognize lists when formatting
-- p: don't break at single spaces '. ', since I use cpoptions 'J' this makes sense
vim.opt.formatoptions = 'jcroqlnp'
-- this is the default
--vim.opt.formatlistpat = '^\s*\d\+[\]:.)}\t ]\s*'
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.list = true
vim.opt.listchars = { eol = '$', tab = '> ' }
vim.opt.foldlevel = 10
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.showmode = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
--vim.opt.completefunc = ''
vim.opt.completeopt = { 'menu', 'preview', 'noselect' }

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.diffopt = vim.opt.diffopt + 'vertical'
