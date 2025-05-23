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
ln --symbolic --verbose $vimCD/config/alacritty.toml ~/.config/

#-- starship

print "setting up starship"
ln --symbolic --verbose $vimCD/config/starship.toml ~/.config/starship.toml

#-- fish shell - experimental for now
print "setting up fish and fisher"
# fish tends to initialize these on install
if test -e ~/.config/fish/config.fish; then
    rm -vdr ~/.config/fish/config.fish
fi
if test -e ~/.config/fish/fish_variables; then
    rm -vdr ~/.config/fish/fish_variables
fi
if test -e ~/.config/fish/fish_plugins; then
    rm -vdr ~/.config/fish/fish_plugins
fi
if test -e ~/.config/fish/functions; then
    rm -vdr ~/.config/fish/functions
fi
if test -e ~/.config/fish/conf.d; then
    rm -vdr ~/.config/fish/conf.d
fi
if test -e ~/.config/fish/completions; then
    rm -vdr ~/.config/fish/completions
fi
# if test -e ~/.config/fish/themes; then
#     rm -vdr ~/.config/fish/themes
# fi
ln --symbolic --verbose $vimCD/config/fish/c.fish ~/.config/fish/config.fish
ln --symbolic --verbose $vimCD/config/fish/p ~/.config/fish/fish_plugins
ln --symbolic --verbose $vimCD/config/fish/functions ~/.config/fish/functions
ln --symbolic --verbose $vimCD/config/fish/conf.d ~/.config/fish/conf.d
ln --symbolic --verbose $vimCD/config/fish/completions ~/.config/fish/completions
ln --symbolic --verbose $vimCD/config/fish/fish_variables ~/.config/fish/fish_variables
# ln --symbolic --verbose $vimCD/config/fish/themes ~/.config/fish/themes

#-- glow, used for neovim, but can be used independently

print "setting up glow"
mkdir --parents --verbose ~/.config/glow
ln --symbolic --verbose $vimCD/config/glow.yml ~/.config/glow/glow.yml

#-- k9s

print "setting up k9s plugins"
mkdir --parents --verbose ~/.config/k9s
ln --symbolic --verbose $vimCD/config/k9s/p.yml ~/.config/k9s/plugins.yaml
ln --symbolic --verbose $vimCD/config/k9s/c.yml ~/.config/k9s/config.yaml

#-- newsboat, rss reader

print "setting up newsboat - my rss reader"
mkdir --parents --verbose ~/.newsboat
ln --symbolic --verbose $vimCD/config/newsboat ~/.newsboat/config

#-- github cli

print "setting up github cli config"
print "github cli also requires you to go through 'gh auth login'"  # TODO
mkdir --verbose --parents ~/.config/gh
ln --symbolic --verbose $vimCD/config/githubcli.yml ~/.config/gh/config.yml

#-- neovim

print "setting up neovim"

mkdir --parents --verbose ~/.config/nvim
ln --symbolic --verbose $vimCD/neovim/* ~/.config/nvim

nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync' && \
nvim -c 'autocmd User MasonInstallAllComplete quitall' -c 'MasonInstallAll' -c 'Mason' && \
nvim -c 'TSInstallSync all' -c 'quitall' && \
# https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md
# if that moves, here is a commit that added this file
# https://github.com/williamboman/mason-lspconfig.nvim/blob/1d459b6d19118b9944d5313e4439cb361d607366/lua/mason-lspconfig/server_configurations/pylsp/README.md
nvim -c 'PylspInstall pylsp-mypy pyls-isort python-lsp-black pylsp-rope' && \
# https://github.com/glacambre/firenvim/blob/master/TROUBLESHOOTING.md
nvim -c 'call firenvim#install(0)'

#-- keyboard

sudo mkdir /etc/keyd
sudo ln --symbolic --verbose $vimCD/config/keyd.conf /etc/keyd/ && \
sudo systemctl enable keyd --now && \
sudo keyd reload
