vim.opt.spell = true
-- autoindent after formatting
nmap('==', 'mhgqip=ip`h')
-- break undo at (half-)sentences
imap('.  ', '.  <c-g>u')
imap(', ', ', <c-g>u')
imap('! ', '! <c-g>u')
imap('?  ', '?  <c-g>u')
