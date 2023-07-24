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

#-- git

mv --verbose ~/.gitconfig ~/gitconfig.old
ln --symbolic --verbose $vimCD/config/gitconfig ~/.gitconfig
ln --symbolic --verbose $vimCD/config/gitignore ~/gitignore

#-- bash

print "setting up bash"

echo "" >> ~/.bashrc
echo "### --- starship" >> ~/.bashrc
echo 'eval "$(starship init bash)"' >> ~/.bashrc
echo "" >> ~/.bashrc
echo "### --- source my version controlled bashrc" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "source $vimCD/bash/bashrc" >> ~/.bashrc

ln --symbolic --verbose $vimCD/bash/inputrc ~/.inputrc

#-- tmux

print "setting up tmux"
ln --symbolic --verbose $vimCD/config/tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

#-- alacritty

print "setting up alacritty"
ln --symbolic --verbose $vimCD/config/alacritty.yml ~/.config/

#-- starship

print "setting up starship"
ln --symbolic --verbose $vimCD/config/starship.toml ~/.config/starship.toml

#-- glow, used for neovim, but can be used independently

print "setting up glow"
mkdir --parents --verbose ~/.config/glow
ln --symbolic --verbose $vimCD/config/glow.yml ~/.config/glow/glow.yml

#-- k9s

print "setting up k9s plugins"
mkdir --parents --verbose ~/.config/k9s
ln --symbolic --verbose $vimCD/config/k9s/plugin.yml ~/.config/k9s/plugin.yml

#-- newsboat, rss reader

print "setting up newsboat - my rss reader"
mkdir --parents --verbose ~/.newsboat
ln --symbolic --verbose $vimCD/config/newsboat ~/.newsboat/config

#-- neovim

print "setting up neovim"

mkdir --parents --verbose ~/.config/nvim
ln --symbolic --verbose $vimCD/neovim/* ~/.config/nvim

nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync' && \
nvim -c 'autocmd User MasonInstallAllComplete quitall' -c 'MasonInstallAll' -c 'Mason' && \
nvim -c 'TSInstallSync all' -c 'quitall' && \
# https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md
nvim -c 'PylspInstall pylsp-mypy pyls-isort python-lsp-black pylsp-rope' && \
# https://github.com/glacambre/firenvim/blob/master/TROUBLESHOOTING.md
nvim -c 'call firenvim#install(0)'
