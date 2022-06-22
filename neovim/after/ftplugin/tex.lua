vim.opt.spell = true

function Compile_LaTeX()
vim.cmd([[
  :w
  let b:pdfFile = expand('%:r') . ".pdf"
  !pdflatex %
]])
end

function Compile_and_view_LaTeX()
  Compile_LaTeX()
  vim.cmd([[
  execute '!mupdf ' . b:pdfFile . ' &>> /tmp/mupdf.log&'
]])
end

cmd('MT', 'lua Compile_and_view_LaTeX()', { desc = 'compile latex and view in mupdf locally' })
cmd('TT', 'lua Compile_LaTeX()', { desc = 'compile latex locally' })
