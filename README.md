# My command Line Configuration

This is my command line configuration. Everything necessary to setup the
command line tools and anything related the way I like it is either backed up
or described here.

No guarantee that this will work on linux. I usually use windows, but setup git
to change linendings, so the files are compatible in principle.

## Setup

This should be cloned into your `~/.vim` folder and any instructions will
assume that that is the location of this repo.

### Software

These are links to the software I use, mostly so they are neatly in one place
when I have to setup a new machine.

#### Windows

* [Git Bash for Windows](https://git-scm.com/downloads)
* [Vim](https://www.vim.org/download.php)
* [AutoHotkey](https://www.autohotkey.com/). I don't have an equivalent for
  Linux yet, maybe in the future.
* [sdkman](https://sdkman.io/)
  - note that installing this will add some lines to the `.bashrc` containing
    absolute paths. These lines should be moved to `~/.sdkman/sourceSDK`.
    Since sdkman is probably not in use that often, having to source it
    manually first should be ok.
* *unfinished list...*

#### Linux

Todo for the future.

### Cloning

Clone this repository with the `--recursive` flag:

```
git clone --recursive git@github.com:SonkeWohler/.vim.git
```

This will clone the repository along with its submodules. Read up on what submodules are and how to manage them
[here](https://git-scm.com/book/en/v2/Git-Tools-Submodules). Some more notes on how I use them [below](#plugins-and-submodules).

### AutoHotkey (Windows Specific)

There are the *AutoHotkey* files, with some important considerations about
these in the [hotkeysOnStartup subfolder](hotkeysOnStartup/README.md). To
deploy these run:

```
source ~/.vim/hotkeysOnStartup/copyHotkeys.sh
```

and ensure your system startup routine links to
`~/hotkeysOnStartup/startHotkeys.sh`. In windows (while using a bash emulator),
you can simply navigate to `~/AppData/Roaming/Microsoft/Windows/Start\
Menu/Programs/Startup` and execute 

```
echo "source ~/hotkeysOnStartup/startHotkeys.sh" > startHotkeys.sh
```

and ensure that `.sh` is associated with an appropriate program.

### Configuration Files

I moved my configuration files into this folder, to make them part of this
repository. Of course that means there has to be a link from where the programs
look for the files (in `~/`) to where they actually are (here, which I will
assume is `~/.vim/`).

Keep in mind that if you are using cmd `~/` is `C:/Users/<user-name>`. I assume
you are performing any operations from `~/` with many relative paths.

Symlinks in most linux shells are of the form `ln [target] [link]`, while on
windows it is `mklink [link] [target]`. Since the git bash for windows that I
use is [unable to create
symlinks](https://github.com/git-for-windows/git/wiki/Symbolic-Links), and
other emulators may have a similar problem, you should check the created files
are truly links with `ls -al [file]` when you're done. It should look something
like `.bashrc --> .vim/.bashrc`.

#### Bash

Link the bash initialisation script from within your `~/`:

```
ln -sv .vim/.bashrc .bashrc
```

Or:

```
mklink ".bashrc" ".vim/.bashrc"
```

Optionally you can setup my *oversimplified bookmarks* (setup inside
[`.bashrc`](.bashrc)). The `~/locationsForCD.bash` file can be used to detail
the following "*bookmarks*":

* `tempCD` for temp files, use `cdt` - defaults to `/d/temp`
* `vimCD` for this repo location, use `cdv` - defaults to `$HOME/.vim`
* `journalCD` for diary, use `cdd`
* `workCD` for work repo, use `cdw`

#### Vim

Then there is the same for vim. If you are using vim as an application on
windows `.vimrc` is called `_vimrc`. If you prefer to use vim inside git bash
it still uses `.vimrc`. Feel free to link them all together from within your
`~/`

```
ln -sv .vim/.vimrc .vimrc
```

Or:

```
mklink ".vimrc" ".vim/.vimrc"
```

Also, using vim as an application on windows uses `~/vimfiles` rather than
`~/.vim`, so link those together as well.

#### Git

Git uses `.gitconfig`, which [doesn't seem to follow
symlinks](https://github.com/SonkeWohler/.vim/issues/3) so you should instead
copy the file regularly with:

```
cp -v .vim/.gitconfig /.gitconfig
```

Now you should be done. Try it out. Use some aliases, open a plugin in vim, use
some commands from my `.vimrc`, see if the *chrome* hotkeys from AutoHotkey
work.

## Plugins and Submodules

Vim plugins are usually added as submodules. I also keep small modifications under
[pack/myMinorModifications](pack/myMinorModifications/README.md). These are
single file modifications that are too small to justify their own repo, but
that I don't want in my `.vimrc`.

As recommended by (some) guides introducing you to vim, I am not using a plugin
manager yet. I try to follow
[this](https://vimways.org/2018/from-vimrc-to-vim/) pretty good guide on how to
organise plugins with this system.

This does require me to adapt filetype plugins to my setup like I [did with vim-markdown for example](https://github.com/plasticboy/vim-markdown/commit/b93b0b4881872d3a1e46a84547e3df490b82b57b). They are then cloned into [`.vim/pack/.../opt`] where they are loaded from with [`.vim/ftplugin`](ftplugin/) with [a small script](ftplugin/markdown.vim). I also copy over any filetype detect to [`.vim/ftdetect`](ftdetect).

Submodules are added to the current directory with `git submodules add <link to clone repository>`. They
are then listed in the `.gitmodules` file. Read up on submodules [here](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

## License

Any content here covered by another license due to being based on work of said
license, such as anything covered by the [vim
license](https://www.gnu.org/licenses/vim-license.txt), remains under such
license and I will mark such content as clearly as possible. Any such content
is and will be licensed in a spirit similar to the GNU free software
phylosophy. Any other content is published here under the [GNU General Public
License v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html).




