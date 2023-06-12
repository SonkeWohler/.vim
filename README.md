# My command Line Configuration

This is my command line configuration. Everything necessary to setup the
command line tools and anything related the way I like it is either backed up
or described here.

This is tailored to an Arch-based install (EndeavourOS, currently), so will need
some tweaks for any other distro.

## Setup

The majority of my setup is automated.  There are some manual things noted at
the end of this section, and you may wish to do the kde setup first, before
copying in the kde files (before sourcing the `setup/kde.bash` script).  It
should be fine if you don't.

The first thing to do is to setup git.  This and the cloning of the dotfiles can
be done with a script.  Run the commands below and that script will take you
through the steps of registering this machine with GitHub and will take care of
everything else.

```
cd /tmp
wget https://raw.githubusercontent.com/SonkeWohler/.vim/master/git-setup.bash
chmod +x git-setup.bash
./git-setup.bash
```

This should drop you inside the `setup/` folder containing the remaining
scripts.  Since they each mess with some system related things you may wish to
run them manually, check everything is ok (which not too rarely requires a
restart) and then come back to run the next one.

You will need to authenticate as sudo as you run them.

However, if you are sure you want to run them all just paste this into your
terminal and hit enter:

```
./pacman.bash
./config.bash
./script.bash
./kde.bash
./docker.bash
./desktop.bash
```

They should just run without further intervention.  They take care of, in the
above order:

* software, like nvim, kubernetes etc.
  - note: Docker Desktop might not work quite right, see below.
  - this doesn't just cover pacman, but also yay, pip and npm, but it is
    Arch-specific
* dotfiles like ~/.bashrc
  - this also runs installs for anything that requires this config to be in
    place for the installation to work properly.  The only one right now is
    neovim, so it will open a few times now.
* useful scripts for keyboard remaps and alacritty
* kde files
  - this is still somewhat experimental, so a few things don't work quite the
    way you might expect.  Stuff like the search preferences in Dolfin, which
    change somewhat regularly.
  - the most important ones here are:
    - keyboard shortcuts
    - plasma widgets
  - sidenote: I don't think autostart is covered here yet.  Not sure what file
    to look at for that.
* setting up docker-desktop to run
  - I still need to test this, but I think it should now run fine after restart.
  - You may want to check the version number, as the download link contains the
    version number.
  - After restart you can test with `docker info`.  Consult [the arch
    wiki](https://wiki.archlinux.org/title/Docker) on common problems like:
    - Bios not allowing hardware virtualisation
    - rootless docker working correctly
    - is `docker.socket` running (`systemctl status docker.socket`)

### The tedious bit

There are some things that you still have to setup manually:
* On any Nvidia cards you have to [install
  drivers](https://wiki.archlinux.org/title/NVIDIA).  EndeavourOS has
  `nvidia-inst` for that which works well in my experience to cover steps 1.* in
  [the Arch Wiki instructions](https://wiki.archlinux.org/title/NVIDIA).
* KDE theme, as this has to be downloaded first.  I use Desert-Global
* Start and setup Vivaldi
  - this is kind of annoying.  After logging into my account and decrypting the
    passwords many things are setup.  And several aren't.
  - keyboard shortcuts are the most annoying.  They need to be set up manually
    until I figure out where the damn file is to copy.
  - theming and other appearance settings also don't seem to sync all the time.
* Autostart i.e. anything I want to start automatically at system start.
* Docker Desktop settings.  You have to wait for it to start up and then restart
  after you adjust the settings:
  - Enable the Kubernetes extension
  - give it as much swap as you want, I usually have plenty
  - CPU and RAM below 4 sometimes causes problems, but you can experiment with
    that
  - you will want to copy over any k8s config to `~/.kube/config`
* KDE has a tendency to make changes to the version controlled files after
  restarts, not just the first time you set this up.  Often they are not really
  functionally different, so you can often just commit those changes.
* Some of the time you may wish to setup conflicting KDE settings on different
  computers, while still sharing the remaining configuration.  This is currently
  annoying, you can play with `~/.gitignore` and that's the end of my ideas so
  far.  I will work on this, at some point.

Depending on the machine this is set up on you may want to adjust some things,
perhaps specific to this machine only.  A common example is to adjust
`/bin/start_alacritty.bash` with `--option font.size=12.0` for laptops - since
the screen I use on my desk is a lot bigger than that on my laptop.

Now it is time to clone work repos and set that stuff up.  Obviously, that is
not part of my dotfiles anymore.

# Notes and explanations

## Git

### Branches And History

I have switched to keeping all my main machines on the master branch.  Every now
and then I may update the stable branch, but I don't really have a use for that
yet, since I probably won't be updating it regularly enough.  It is simply
easier to rebase the local branch regularly and sort out conflicts as they arise
than to put off merging branches and inviting merge conflicts in this way.

I try to stick to [conventional
commits](https://www.conventionalcommits.org/en/v1.0.0/) most of the time.
Sometimes you will find commits with the message `chore(kde): no functional
changes`, these are about my kde settings.  Because kde is not designed to be
backed up the way I do sometimes there are changes to the dotfiles without me
doing anything, and without that having any effect on the kde setup (that I can
tell).  But I still commit them just in case and so they are out of the way.

Beyond this the scope of the conventional commit message can be:
* `bash`, which is anything under `./bash/*`.  This is stuff that gets loaded
  via the `~/.bashrc`, I just have it split up into multiple files for
  cleanliness.
* `setup`, scripts used in the above installation instructions.
* `config`, most things not included in neovim or the above go in here.  Mostly
  these are dotfiles that go under `~/.config/*`, but not exclusively.
* stuff related to neovim I split up, since I commit to this quite often:
    - `map`, is `./neovim/lua/mappings.lua`.  As you can imagine, this is
      any remaps, which in vimscript would be `nnoremap` and stuff.
    - `plug`, `./neovim/lua/plugin.lua`, all the plugins that I have collected
      in this time, plus configuration that doesn't belong in the other files.
    - `cmd`, `./neovim/lua/commands.lua`, anything I call with `:`.
* `readme`, this file
* anything not listed above I don't commit often enough, so there is not
  standard that I try to keep myself to.  For example, tmux stuff you may see
  under `tmux` or you may see under `config`.

The action is usually `fix` and `feat` - which are obvious - `new` when I add
something new, like a new neovim plugin `new(plug)` or a new file to my bashrc
`new(bash)`, you get the idea.  Sometimes I do `ref` for refactors, `doc` for
documentation (which may also just be `feat(readme)`) and I think `clean`, when
it's not really refactoring but more like formatting and the like.

The Issues on GitHub are pretty much dead now and the PRs probably won't be used
anymore either.  The latter used to be convenient when I wanted to merge across
machines while on my phone, but since I don't use different branches for
different machines anymore that won't really be a thing.

### Git Submodules as vim Plugins

I used to use git submodules to maintain vim plugins, since I was managing my
plugins manually as [this](https://vimways.org/2018/from-vimrc-to-vim/) blog
suggested.  This will be fine for if and when I decide to contribute to plugins,
but outside of that it is just so much easier to just use a package manager.

## License

[General Public License v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
