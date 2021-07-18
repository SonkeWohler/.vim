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
  - I like to use the `gruvbox` theme in te settings because it works with my
  vim color scheme
* [AutoHotkey](https://www.autohotkey.com/). I don't have an equivalent for
  Linux yet, maybe in the future.  I have the feeling, though, that recreating
  this on linux will be significantly easier than expected.
* [Scoop](https://scoop.sh/), and from scoop install
  - `scoop install neovim`
  - `scoop install ack`
  - `scoop install vim`
  - `scoop install latex`
  - `scoop install pandoc`
  - `scoop install tar`
  - java, but it isn't in the default buckets:
    - `scoop bucket add java`
    - `scoop install openjdk`
* *unfinished list...*

#### Linux

I am still distro hopping and selecting a desktop environment, so the
instructions I will record here might not be up to date and are focused on what
will definitely be consistent through any distro/repo/etc.

Install these packages from the package manager:

* `ack`
* `fzf`
* `vim`
* `neovim`
* `texlive-full`
* `pandoc`
* `mupdf`
* `openjdk-16-jdk`
* `maven`
* `htop`
* `ncdu`
* `timeshift`
* `tar`
* `zip`
* `unzip`

Additionally, this software can't be installed via the package manager:

* [Rust](https://www.rust-lang.org/tools/install)

### Cloning

Clone this repository with the `--recursive` flag:

```
git clone --recursive git@github.com:SonkeWohler/.vim.git
```

This will clone the repository along with its submodules. Read up on what
submodules are and how to manage them
[here](https://git-scm.com/book/en/v2/Git-Tools-Submodules). Some more notes on
how I use them [below](#plugins-and-submodules).

You should then generate the helptags by running `:helptags ALL` once inside
vim.  This can be run from anywhere, and only needs to be run once on your
machine.

### AutoHotkey (Windows Specific)

The *AutoHotkey* files and some important considerations if you want to edit
them are detailed in the [hotkeysOnStartup
subfolder](hotkeysOnStartup/README.md).

To deploy them run:

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
you are performing any operations from `~/` with any relative paths.

Symlinks in most linux shells are of the form `ln [target] [link]`, while on
windows it is `mklink [link] [target]`. Since the git bash for windows that I
use is [unable to create
symlinks](https://github.com/git-for-windows/git/wiki/Symbolic-Links), and
other emulators may have a similar problem, you should check the created files
are truly links with `ls -al [file]` when you're done. It should look something
like `.bashrc --> .vim/bash/bashrc`.

You may wish to source some of these from a machine local config file, as I
would recommend for Bash (below).  Aside from bash and perhaps vim I don't
believe it is necessary to do so for any other config files, though.

#### Bash

To synch your `.bashrc` with my *dotfiles* the most sensible way is to keep a
machine local `~/.bashrc` that loads the *dotfiles* by placing the following line
at the end:

```
source ~/.vim/bash/bashrc
```

That way you can overwrite the *dotfiles* with machine local settings as needed
by adding them in after this line, and you get to guarantee the location of the
`.vim` folder.  You also get to keep machine local installation paths like for
*rustup* etc.

Alternatively, you can link the bash initialisation script from within your
`~/`, if you prefer:

```
ln -sv .vim/bash/bashrc .bashrc
```

Or:

```
mklink ".bashrc" ".vim/bash/bashrc"
```

Optionally you can setup my *oversimplified bookmarks* (setup inside
[`.bashrc`](.bashrc)). The `~/locationsForCD.bash` file can be used to detail
the following "*bookmarks*":

* `tempCD` for temp files, use `cdt` 
  - defaults to `/d/temp`
* `vimCD` for this repo location, use `cdv` 
  - defaults to `$HOME/.vim`
* `workCD` for work library, use `cdwork`
  - use `cdihp` to change into `$workCD/iHP`
* `writingCD` for my writing library (private repo for notes and stuff), use
  `cdd` (from `cd diary` used previously)
  - `journalCD` is set to `$writingCD/diary` by default
* `librariesCD` for the default libraries location, use `cdl`
* `wikiCD` for GitHub wikis, use `cdw` 
  - defaults to `$librariesCD/wikis/`

#### Vim

Then there is the same for vim.

```
ln -sv .vim/vimrc .vimrc
```

Or:

```
mklink ".vimrc" ".vim/vimrc"
```

Also, using vim as an application on windows uses `~/vimfiles` rather than
`~/.vim` and `_vimrc` rather than `.vimrc`, so link those together as well.

```
mklink "vimfiles" ".vim"
```

and

```
mklink "_vimrc" ".vimrc"
```

Inside git bash for windows it still uses `.vimrc` as on linux, so if that
and/or WSL are the only places you are planning to use vim you don't need to
bother.

#### Git

Git uses `.gitconfig`, which [doesn't seem to follow
symlinks](https://github.com/SonkeWohler/.vim/issues/3) so you should instead
copy the file regularly with:

```
cp -v .vim/.gitconfig /gitconfig
```

Keep in mind that, on windows, git should automatically adjust the new-line
characters, which by default is set on system level (`git config --system --get
core.autocrlf` should return `true`).  That way the repo will work fine when
cloned into a Linux environment without having to do anything.

You can also keep machine local settings using `git config --global <settings>`, mostly you should setup:


```
TODO
```

#### Other

The remainder of the config files I recommend you simply symlink, without worrying about anything else:

```
ln -sv ~/.vim/config/.tmux.config ./
```

```
ln -sv ~/.vim/config/tridactylrc ./.tridactylrc
```

This one I like to source manually after startup or plugin in a new keyboard.
Use `xmodmap ~/swap.xmodmap`.

```
ln -sv ~/.vim/config/swap.xmodmap ./
```

### Setup

Some additional setup steps.

Follow
[this](https://askubuntu.com/questions/454649/how-can-i-change-the-default-editor-of-the-sudoedit-command-to-be-vim)
stackoverflow to ensure that `sudoedit` uses vim.

## Done

Now you should be done. Try it out. Use some aliases, open a plugin in vim, use
some commands from my `.vimrc`, see if the *chrome* hotkeys from AutoHotkey
work.

## Plugins and Submodules

### Git Submodules

Vim plugins are usually added as git submodules with `git submodules add
<link-to-clone-repository>` inside the directory the module should be added to,
for example [pack/vendor/start](pack/vendor/start). They are then listed in the
[`.gitmodules`](.gitmodules) file. Read up on submodules
[here](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

### After installing a plugin

If the plugin has helptags run `:helptags` from inside its directory location
or `:helptags ALL` from anywhere, after installing it.

### My own munor plugins

I also keep small modifications under
[pack/myMinorModifications](pack/myMinorModifications/). These are
single file modifications that are too small to justify their own repo, but
that I don't want in my `.vimrc`.

### Plugin Manager

As recommended by (some) guides introducing you to vim, I am not using a plugin
manager yet. I try to follow
[this](https://vimways.org/2018/from-vimrc-to-vim/) pretty good guide on how to
organise plugins with this system.

### Filetype Plugins

Filetype plugins, counterintuitively, are usually best placed inside `start`,
usually `pack/vendor/start`, rather than `opt`.  **But only when the plugin is
setup correctly**.  If the plugins contains a `plugin/` folder vim will load it
on startup irrespective of the filetype.  A correctly setuo plugin will have
its files instead in `ftplugin` instead, so look for that.

You don't need to edit `.vim/ftplugin` or `.vim/ftdetect` if your filetype
plugins are setup correctly because vim will source `pack/*/start/**/ftdetect`
files on startup and then source `pack/*/start/**/ftplugin` accordingly.

## License

Any content here covered by another license due to being based on work of said
license, such as anything covered by the [vim
license](https://www.gnu.org/licenses/vim-license.txt), remains under such
license and I will mark such content as clearly as possible. Any such content
is and will be licensed in a spirit similar to the GNU free software
phylosophy. Any other content is published here under the [GNU General Public
License v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html).




