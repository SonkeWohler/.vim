#!/usr/bin/bash
# to be executed from setup.bash
# setting up the config files and such

### --- formatting and stuff

print() {
  echo "   +++   $1"
}

print "this is a config file setup for my dotfiles"
print "Sonke (sonki) Wohler --- https://github.com/SonkeWohler/.vim"
print "======================="

### --- basic cli setup

cd ~

#-- bookmarks in place?

if [ -f ~/locationsForCD.bash ]; then
  print "there seems to be a locationsForCD.bash, using this for dotfiles setup"
  source ~/locationsForCD.bash
else
  print "TODO config setup without locationsForCD.bash"
  exit 1
fi

#-- bash

print "setting up bash"

echo "" >> ~/.bashrc
echo "### --- source my version controlled bashrc" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "source $vimCD/bash/bashrc" >> ~/.bashrc

ln --symbolic --verbose $vimCD/bash/inputrc ~/.inputrc

#-- vim

print "setting up vim"

ln --symbolic --verbose $vimCD/vimrc ~/.vimrc
mkdir --parents --verbose ~/.vim/
ln --symbolic --verbose $vimCD/pack ~/.vim/pack

#-- neovim

print "setting up neovim init.vim"

mkdir --parents --verbose ~/.config/nvim
ln --symbolic --verbose $vimCD/neovim/* ~/.config/nvim

#-- tmux

print "setting up tmux"
ln --symbolic --verbose $vimCD/config/.tmux.conf ~/.tmux.conf

#-- alacritty

print "setting up alacritty"
ln --symbolic --verbose $vimCD/config/alacritty.yml

#-- starship

print "setting up starship"
ln --symbolic --verbose $vimCD/config/starship.toml ~/.config/starship.toml

#-- other misc

print "miscellaneous configs"

ln --symbolic --verbose $vimCD/config/swap.xmodmap ~/.config/swap.xmodmap

### --- vim related submodules/packs

print "setting up newsboat config"
ln --symbolic --verbose $vimCD/config/.newsboat/config ~/.newsboat/

#-- rustup

rustup toolchain install stable
