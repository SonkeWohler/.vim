vim.opt.spell = true
-- autoindent after formatting
nmap('==', 'mhgqip=ip`h')
-- break undo at (half-)sentences
imap('.  ', '.  <c-g>u')
-- imap('(', '(<c-g>u')  -- wish this would work, but my plugin overwrites them
-- imap(')', ')<c-g>u')
imap('<c-l>', '<Right><c-g>u')
imap(', ', ', <c-g>u')
imap('! ', '! <c-g>u')
imap('?  ', '?  <c-g>u')
