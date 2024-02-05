-------------------------------------------------------------------
--------------       import and manage plugins       --------------
-------------------------------------------------------------------
--------------  this includes settings and mappings  --------------
--------------   for specific plugins, except hydra  --------------
-------------------------------------------------------------------

----------------------------------------------
------         bootstrap lazy           ------
------ install if not installed already ------
----------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- TODO, remove if
-- while I do my migration I can use this
-- to toggle between old and new setup
require("lazy").setup(
  "lazy_plugins",
  {
    install = {
      missing = true,
      -- colorscheme = { 'bamboo' },  # doesn't seem to work
    },
    checker = {
      enabled = false,
      notify = false,
      frequency = 86400,
    },
    change_detection = {
      notify = true,
    },
  }
)
return
