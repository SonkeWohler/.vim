# My command Line Configuration

This is my commandline configuration. Everything necessary to setup the commandline tools and anything related the way I like it is either backed up or described here.

To set this up first clone this repo to your home folder, usually reffered to as `~`. This `~/.vim` is also where you would put your vim plugins, since that was a convenient place for me to put this. If you have your own folder you can create a subfolder like `~/foreinConfiguration` and you replace any occurance of `~` with that instead. 

No guarantee that this will work on linux. I usually use windows, but setup git to change linendings, so the files are compatible in principle.

## Setup

Obviously, your first step should be to install the softwares listed [below](#software), some of which may be optional.

Clone this repository with `git clone --recursive <link>`, or clone it normally and follow that with:

```
git submodule init
```

And:

```
git submodule update
```

This will clone the submodules for vim [plugins](#plugins).

You want to then prepare the configuration files following the [instructions below](configuration-files), depending on the OS you are using.

Lastly there are the *AutoHotkey* files, with some important considerations about these in the `hotkeysOnStartup` subfolder. To deploy these run `source hotkeysOnStartup/copyHotkeys.sh` and ensure your system startup routine links to `~/hotkeysOnStartup/startHotkeys.sh`. In windows (while using a bash emulator), you can simply navigate to `~/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup` and execute `echo "source ~/hotkeysOnStartup/startHotkeys.sh" > startHotkeys.sh` and ensure that `.sh` is associated with a program.

Now you should be done. Try it out. Use some aliases, open a plugin in vim, use some commands from my `.vimrc`, see if the *chrome* hotkeys work.

## Software

These are links to the softwares I use, mostly so they are neatly in one place when I have to seup a new machine.

* [Git Bash for Windows](https://git-scm.com/downloads)
* [Vim for Windows](https://www.vim.org/download.php)
* [AutoHotkey](https://www.autohotkey.com/). I don't have an equivalent for Linux yet, maybe in the future.
* [sdkman](https://sdkman.io/)
  - note that installing this will add some lines to the `.bashrc` containing absolute paths. These lines should be moved to `~/.sdkman/sourceSDK`.  Since sdkman is probably not in use that often, having to source it manually first should be ok.
* *unfinished list...*

## Configuration Files

I moved my configuration files into this folder, to make them part of this repository. Of course that means there has to be a link from where the programs look for the files (in `~`) to where they actually are (here, which I will assume is `~/.vim/`).

Symlinks in most linux shells are of the form `ln [target] [link]`, while on windows it is `mklink [link] [target]`. Since the git bash for windows that I use is [unable to create symlinks](https://github.com/git-for-windows/git/wiki/Symbolic-Links), and other emulators may have a similar problem, you should check the created files are truly links with `ls -al [file]` when you're done. It should look something like `.bashrc --> .vim/.bashrc`.

Link the bash initialisation script from within your `~/`:

```
ln -sv .vim/.bashrc .bashrc
```

Or:

```
mklink ".bashrc" ".vim/.bashrc"
```

Then there is the same for vim. In windows `.vimrc` is called `_vimrc`, so it should be this instead from within your `~/`

```
ln -sv .vim/.vimrc _vimrc
```

Or:

```
mklink ".vimrc" ".vim/.vimrc"
```

## plugins

Plugins are added with `git submodules add <link to clone repository>`. They are then listed in the `.gitmodules` file.

As recommended by (some) guides introducing you to vim, I am not using a plugin manager yet. I try to follow [this](https://vimways.org/2018/from-vimrc-to-vim/) pretty good guide on how to organise plugins with this system, except that I can't use `vimfiles` and have to use the `.vim` folder, for some reason (investigations are inconclusive thus far).

## License

Any content here covered by another license due to being based on work of said license, such as anything covered by the [vim license](https://www.gnu.org/licenses/vim-license.txt), remains under such license and I will mark such content as clearly as possible. Any such content is and will be licensed in a spirit similar to the GNU free software phylosophy. Any other content is published here under the [GNU General Public License v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html).
