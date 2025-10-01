vim.opt.spell = true
-- autoindent after formatting
nmap('==', 'mhgqip=ip`h')
-- hyphens are weird in markdown, since they also denote list items
-- imap(' - ', ' &ndash; ')
nmap('--', 'a&ndash; ')
imap('-- ', '&ndash; ')
-- break undo at (half-)sentences
-- imap('.  ', '.  <c-g>u')
-- imap(', ', ', <c-g>u')
-- imap('! ', '! <c-g>u')
-- imap('?  ', '?  <c-g>u')
