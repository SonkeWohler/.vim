# Converting

To convert my setup to neovim, lua and all that, I need to

## Native

For the most part anything using functions and the like can go away.  I can use
this opportunity to clean things up a little.

For remaps I can define a macro and it should do all of that for me.

I might just pipe all these files into one file, run the macros, delete what I
don't need and split that file up again in the end.

### undoings

There are some things I want to undo, like the damn i_<C-W> that neovim added.

## commands

Instead of some of the augroups and stuff i will simply be using commands with
some of these things.
* FF
* HH for vert help
* PP for PackerSync

## Plugins

I'll switch to Packer, so submodules goes away.

Most packages can go because they are related to languages, which will be
handled by treesitter and lsp.

Those that don't go away are:
* fzf
  - not sure why there are two of them.
* repeat, might not actually need this one without surround
* surround, will be replaced by sandwich
* a bunch of tpope's stuff

### subfiles

This will add cleanlyness, but I am not willing to do the whole lua module
thing.  This is too small for that and I am not using more lua elsewhere yet.

I can still use vim plugins, obviously.

## Setup

I have been putting off updating this one for a while.  It would be nice to try
out the thing with files to keep packages more clean.  But barring that I am
saving myself the main thing I have been letting slide recently: language server
and linter stuff for vim.

For the neovim config files I just put this command, followed by PackerSync and
LSP installations.

```
ln -s <.vim_root_git>/neovim/* ~/.config/nvim/
```

It is important that we don't just link `nvim` with `neovim`, becuase `nvim`
will have plugin files from packer in it.  These will be replacing the git
submodule files, while packer code in lua is replacing our gitmodule.
