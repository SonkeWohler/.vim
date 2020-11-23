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

Firstly I have some aliases for my git bash:

```
ln -sv .vim/.bashrc .bashrc
```

Then there is the same for vim. In windows `.vimrc` is called `_vimrc`, so it should be this instead:

```
ln -sv .vim/.vimrc _vimrc
```

Lastly, I use [AutoHotkey](https://www.autohotkey.com/) to remap some keys in certain contexts. This is specific to windows, although there appear to be [analogues in linux](https://unix.stackexchange.com/questions/165124/autohotkey-equivalent#:~:text=There's%20a%20port%20of%20AutoHotKey,unix%20systems%20is%20the%20shell.). I create a symlink such that my ahk script is loaded on system start like this:

```
ln -sv ~/.vim/hotkeysOnStartup.ahk ~/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/hotkeysOnStartup.ahk
```

You'll also have to make sure `.ahk` is registered to run with AutoHotkey in your system.

## plugins

So, I don't like the idea of keeping the plugins that I clone off github or similar inside this repo and essentially republishing them here. Perhaps that would be the best way to do this, and I might decide to do that in the future, but for now I just gitignore any third party plugins. This is a list of those plugins I use, links to the repos to clone them from and anything else I need to keep track of. This works for now because I am a beginner in vim and have no idea if I even will be using a great number of plugins in the future.

* [NerdTree](https://github.com/preservim/nerdtree) (simply follow the readme instructions)
