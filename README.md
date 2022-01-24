# My command Line Configuration

This is my command line configuration. Everything necessary to setup the
command line tools and anything related the way I like it is either backed up
or described here.

This won't quite work on Windows, though with WSL2 there should be quite a bit
that can be done.

## Setup

I have started a script that should take care of setting things up for me.
Installing packages, setting up config files, all that shebang.

I am planning to *support* (if you can call it that) Debian-based (Debian,
Ubuntu, Kali, Mint), Alpine (not sure why, but android UserLAnd offers it, so
why not) and, most importantly for me, Arch-based (Garuda for my main, Manjaro
should work fine too, Arch itself after the machine is set up also).

Run this script from within your home directory (this is important).  It is
best practice to download it and inspect it before executing, especially with
`sudo`.

```
cd ~
wget https://raw.githubusercontent.com/SonkeWohler/.vim/master/setup/install.bash
less install.bash

```

When you have convinced yourself that the file is not malicious, the correct
version and all that, execute it as root, still within your home directory.

```
chmod +x install.bash
sudo $PWD/install.bash
```

This only does the installation bit that requires root privileges and refers
you to the next step.  Just follow the instructions, which eventually take you
to [the non-root setup
file](https://github.com/SonkeWohler/.vim/blob/master/setup/setup.bash) to
finish things off, including setting up these dotfiles.

After this you should be operational at least from a command line perspective.
I will add further setups for password manager, browser (bookmarks) and Desktop
Environment over time.

Remember to checkout a new branch before committing to the dotfiles.  See
[below](#branches-and-history) for details.

## Git

### Branches And History

Since this is just me keeping track of this across multiple machines, branches
are usually split accordingly.  Each machine gets its own branch and most
commits are made straight to that branch.  Now and then I will merge those
changes into master so I can pull them into the other machine's branches.

Since most changes are small tweaks I usually don't keep the history very
clean.  One exception was the auto setup recently, which I squashed after the
fact rather than using a feature branch (this made testing a little more
convenient at the time, and it was also my first `git push
--force-with-lease`).

The only rule is that I don't usually push to branches unless I am on that
machine, and that I don't use the same branch across multiple machines in
general.

Virtual machines, containers etc. all count as a machine and need their own
branch.  This allows me, for example, to keep windows specific things out of
linux or wsl more easily until I refine the tweaks.

### Git Submodules as vim Plugins

Vim plugins are usually added as git submodules with `git submodules add
<link-to-clone-repository>` inside the directory the module should be added to,
for example [pack/vendor/start](pack/vendor/start). They are then listed in the
[`.gitmodules`](.gitmodules) file. Read up on submodules
[here](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

#### After installing a plugin

If the plugin has helptags run `:helptags` from inside its directory location
or `:helptags ALL` from anywhere, after installing it.

#### Plugin Manager

As recommended by (some) guides introducing you to vim, I am not using a plugin
manager yet. I try to follow
[this](https://vimways.org/2018/from-vimrc-to-vim/) pretty good guide on how to
organise plugins with this system.

I keep such plugins organised in three categories under `pack/`.

#### Vendor

These are plugins from other people that I add as dependencies.  I won't be
editing these, they are simply added with `git submodule add <link>` and
updated every time I run `git submodule update   git submodule update --init
--revursive --remote`.  Beyond this nothing should be happening with them
unless it is required by that specific plugin.

#### Native

This is where I keep most of what people normally keep in their vimrc.  I find
it easier to work with them when they are organized in multiple files.  These
are version controlled in the default and not part of any submodules.

#### Mine

These are plugins that I write myself.  There aren't many right now, may never
be, but they have to be treated differently.  To edit them I go into the
submodule and check checkout out the branches I work on, I test them around
etc.  When these changes go back to the master branch I can go back to master
and copy them in using by updating all submodules as above.

This is the real reason why I chose to use git submodules instead of a plugin
manager as I thought I might make more use of this.  Plus the fact that I
refused to use a plugin manager outright as mentioned above.

#### Filetype Plugins

Filetype plugins, counterintuitively, are usually best placed inside `start`,
usually `pack/vendor/start`, rather than `opt`.  **But only when the plugin is
setup correctly**.  If the plugins contains a `plugin/` folder vim will load it
on startup irrespective of the filetype.  A correctly setuo plugin will have
its files instead in `ftplugin` instead, so look for that.

You don't need to edit `.vim/ftplugin` or `.vim/ftdetect` if your filetype
plugins are setup correctly because vim will source `pack/*/start/**/ftdetect`
files on startup and then source `pack/*/start/**/ftplugin` accordingly.

## Traditional Setup

This is the outdated setup that is deprecated at this point.  Soon I can remove
this part entirely.

---

This should be cloned into your `~/.vim` folder and any instructions will
assume that that is the location of this repo.

### Software

These are links to the software I use, mostly so they are neatly in one place
when I have to setup a new machine.

#### Windows

Remember that `~` is usually somewhere like `C:\Users\<username>`.

The setup scripts won't work correctly on windows and may never, use WSL2
instead.

* [Git Bash for Windows](https://git-scm.com/downloads)
  - I like to use the `gruvbox` theme in the settings because it works with my
  vim color scheme
* [AutoHotkey](https://www.autohotkey.com/). 
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

Deprecated, use [auto setup](#setup) instead or read through what it does.

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

#### Other Config Files

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

### Other Stuff

Some additional setup steps.

Follow
[this](https://askubuntu.com/questions/454649/how-can-i-change-the-default-editor-of-the-sudoedit-command-to-be-vim)
stackoverflow to ensure that `sudoedit` uses vim.

### Done

Now you should be done. Try it out. Use some aliases, open a plugin in vim, use
some commands from my `.vimrc`, see if the *chrome* hotkeys from AutoHotkey
work.

## License

[General Public License v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
