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
ln --symbolic --verbose $vimCD/config/init.vim ~/.config/nvim/init.vim

#-- tmux

print "setting up tmux"

ln --symbolic --verbose $vimCD/config/.tmux.conf ~/.tmux.conf

#-- easyeffects

print "easyeffects ... you may need to import them from the gui"

ln --symbolic --verbose $vimCD/config/my_easyeffects.json ~/.config/easyeffects/output/my_easyeffects.json

#-- other misc

print "miscellaneous configs"

# this is a WIP for adjusting my keyboard layout
ln --symbolic --verbose $vimCD/config/swap.xmodmap ~/.config/swap.xmodmap
echo "#!/usr/bin/bash" >> /usr/bin/xswap
echo "# activating my xmodmap modifications" >> /usr/bin/xswap
echo "xmodmap ~/.config/swap.xmodmap" >> /usr/bin/xswap
chmod +x /usr/bin/xswap

### --- vim related submodules/packs

#-- helptags
cd ~
vim -u NONE -c 'helptags ALL|q'
nvim -u NONE -c 'helptags ALL|q'

#-- language client
# this requires running a script before use
cd $vimCD/pack/vendor/start/LanguageClient-neovim
source install.sh
