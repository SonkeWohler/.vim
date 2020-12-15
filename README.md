# My command Line Configuration

This is my commandline configuration. Everything necessary to setup the commandline tools and anything related the way I like it is either backed up or described here.

To set this up first clone this repo to your home folder, usually reffered to as `~`. This `~/.vim` is also where you would put your vim plugins, since that was a convenient place for me to put this. If you have your own folder you can create a subfolder like `~/foreinConfiguration` and you replace any occurance of `~` with that instead. 

No guarantee that this will work on linux. I usually use windows, but setup git to change linendings, so the files are compatible.

## Software

These are links to the softwares I use, mostly so they are neatly in one place when I have to seup a new machine.

* [Git Bash for Windows](https://git-scm.com/downloads)
* [Vim for Windows](https://www.vim.org/download.php)
* [AutoHotkey](https://www.autohotkey.com/). I don't have an equivalent for Linux yet, maybe in the future.
* *unfinished list...*

## Configuration Files

I moved my configuration files into this folder, so I can back them up easily. Of course that means there has to be a symlink from where the programs look for the files to where they actually are.

Symlinks in most linux shells are of the form `ln [target] [link]`, while on windows it is `mklink [link] [target]`. Keep in mind that some linux shell emulators in windows are [unable to create symlinks](https://github.com/git-for-windows/git/wiki/Symbolic-Links) and you should check the created files are truly links with `ls -al [file]`. In most cases the Windows Subsystem for Linux (wsl) should work, or cmd.

Link the bash initialisation script from within your `~/`:

```
ln -sv .vim/.bashrc .bashrc
```

Then there is the same for vim. In windows `.vimrc` is called `_vimrc`, so it should be this instead from within your `~/`

```
ln -sv .vim/.vimrc _vimrc
```

Lastly, I use [AutoHotkey](https://www.autohotkey.com/) to remap some keys in certain contexts. This is specific to windows, although there appear to be [analogues in linux](https://unix.stackexchange.com/questions/165124/autohotkey-equivalent#:~:text=There's%20a%20port%20of%20AutoHotKey,unix%20systems%20is%20the%20shell.). Instead of creating a symlink I like to keep a *development* and a *production* version of these scripts, so that when I tinker with them and anything gets messed up the messed up files aren't also loaded on system startup, should I, for any reason, be forced to restart. 

Details on that are in the `hotkeysOnStartup` folder.

## plugins

Plugins are added with `git submodules add <link to clone repository>`.
