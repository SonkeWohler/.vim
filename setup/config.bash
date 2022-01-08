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

ln -sv $vimCD/bash/inputrc ~/.inputrc

#-- vim

print "setting up vim"

ln -sv $vimCD/vimrc ~/.vimrc
ln -sv $vimCD ~/.vim

#-- neovim

print "setting up neovim init.vim"

mkdir --parents --verbose ~/.config/nvim
touch ~/.config/nvim/init.vim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> ~/.config/nvim/init.vim
echo "let &packpath = &runtimepath" >> ~/.config/nvim/init.vim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

#-- tmux

print "setting up tmux"

ln -sv $vimCD/config/.tmux.conf ~/.tmux.conf

#-- other misc

print "miscellaneous configs"

# this is a WIP for adjusting my keyboard layout
ln -sv $vimCD/config/swap.xmodmap ~/.config/swap.xmodmap
echo "#!/usr/bin/bash" >> /usr/bin/xswap
echo "# activating my xmodmap modifications" >> /usr/bin/xswap
echo "xmodmap ~/.config/swap.xmodmap" >> /usr/bin/xswap
chmod +x /usr/bin/xswap