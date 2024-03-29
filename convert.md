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

I will have to remember to add setups for 'TSInstall all' and whatever LSP
requires.

### LSP

Ioi this was a rollercoaster so far.  None of the guides worked out of the box
but I managed to make it work with a mix between a bunch.

#### for setup

I will need to install all the language servers in order for them to be
accessible.  I am not sure if I then also need to run `:LspInstall` for each of
them, but I would presume I do.  And my plugin.lua doesn't seem to fail if the
server is not installed, so that is good.

#### to remember

It was interesting, when I copied the setup from the readme it kept throwing
errors and was't able to install or even uninstall anything.  However, those
servers that were setup correctly before the error would work fine.

What seemed to work in the end was the following.  I would combine the two
plugins in one `use` statement in the corret order (installer first).  Then I
would add a config between the installer and lspconfig (not sure if it would
also work after them, I'll just keep it here).

Now just this would at least clear the warnings and allow me to run
`:LspInstall`.  But none of the servers would start unless they were setup.  The
things is that setting them up inside the packer function would break everything
and lead to all those errors.  So I simply don't.  I run
`lspconfig.<pluginname>.setup {}` at the bottom.

And this took me several hours to fix up.

Also, and this didn't take me that long to figure out, but nice to know, people
have talked about how to disable the `undefined global vim` and `undefined
global use` inside your vim configuration.  But you know what, sumneko lua is
better than that.  You can use a code action `Mark vim as defined global` on one
of the warnings and it creates a `.luarc.json` inside your directory.  It is
much simpler than fiddling with your lua files and having the `lsp-config` and
the `lsp-installer` interfere.
