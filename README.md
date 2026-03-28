# Dotfiles

Dotfiles and some setup scripts for
[arch](https://wiki.archlinux.org/title/Installation_guide) or [arch
based](https://endeavouros.com) installs.

## Setup

Setup your OS with localization, drives, internet, `sudo` and user.

This assumes `bash` exists under `/usr/bin/bash`.

Ideally, run this without KDE running yet, as the config files will be copied.

* clone this repo.  Normally to `~/Documents/.vim`.
* run `setup/pacman.bash` for software installs
* run `setup/script.bash` for neovim dict at `/usr/share`
* run `setup/config.bash` for dotfile links, including KDE files
* setup docker:
    - [rootless](https://wiki.archlinux.org/title/Docker#Rootless_Docker_daemon)
    - [image location](https://wiki.archlinux.org/title/Docker#Images_location)
    - [kind](https://kind.sigs.k8s.io)
    - potentially [setup DNS](https://kind.sigs.k8s.io)

Copy vivaldi files:
* `~/.config/vivaldi/Default/Extensions*`
* `~/.config/vivaldi/Default/Preferences`
* `~/.config/vivaldi/Default/Shortcuts`

Connect to Nextcloud.

## License

[General Public License
v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html), I guess.
