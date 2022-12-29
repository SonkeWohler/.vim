-- ## commands

cmd('PP', 'PackerSync', {desc = 'run PackerSync'} )
cmd('FF', 'Files', {desc = 'run fzf :Files'} )
cmd('LL', 'BLines', {desc = 'run fzf :BLines, the default is inside the current buffer'} )
cmd('LB', 'Lines', {desc = 'run fzf :Lines, not in Buffer'} )
cmd('RR', 'Rg', {desc = 'run fzf :Rg, in the working directory'} )
cmd('RG', 'Rg', {desc = 'run fzf :Rg, in the working directory'} )
cmd('Q', 'q!', {desc = 'force quit'})
cmd('Qa', 'qa!', {desc = 'force quit all buffers'})
