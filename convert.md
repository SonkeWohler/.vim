# Converting

To convert my setup to neovim, lua and all that, I need to

## Native

For the most part anything using functions and the like can go away.  I can use
this to clean things up a little.

For remaps I can define a macro and it should do all of that for me.

I might just pipe all these files into one file, run the macros, delete what I
don't need and split that file up again in the end.

## Plugins

I'll switch to Packer, so submodules goes away.

Most packages can go because they are related to languages, which will be
handled by treesitter and lsp.

Those that don't go away are:
* fzf
  - not sure why there are two of them.
* repeat
* surround
* a bunch of tpope's stuff
