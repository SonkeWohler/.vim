vim.opt.spell = true
-- autoindent after formatting
nmap('==', 'mhgqip=ip`h', {noremap = true, buffer = true})
-- hyphens are weird in markdown, since they also denote list items
-- imap(' - ', ' &ndash; ')
nmap('--', 'a&ndash; ', {noremap = true, buffer = true})
imap('-- ', '&ndash; ', {noremap = true, buffer = true})
-- break undo at (half-)sentences
-- imap('.  ', '.  <c-g>u')
-- imap(', ', ', <c-g>u')
-- imap('! ', '! <c-g>u')
-- imap('?  ', '?  <c-g>u')
