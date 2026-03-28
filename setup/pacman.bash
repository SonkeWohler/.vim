#!/usr/bin/bash

# --- enable multilib
echo '' | sudo tee -a /etc/pacman.conf
echo '# enable multilib' | sudo tee -a /etc/pacman.conf
echo '[multilib]' | sudo tee -a /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' | sudo tee -a /etc/pacman.conf
# --- basics
# update system
sudo pacman -Syu --noconfirm
sudo pacman -S pacman-contrib --noconfirm
# packages not present in a basic arch install, but normally assumed to be
# present on any system
sudo pacman --noconfirm -S \
curl \
curl \
wget \
git \
vi \
vim \
less \
man-db \
man-pages \
texinfo \
openssh \
openssl \
bluetui \
bluez-util \
bluez
# system package managers
sudo pacman --noconfirm -S \
python-pip \
npm \
flatpak
# keyboard stuff
sudo pacman -S keyd --noconfirm
# languages and other build/compile/etc
# sudo pacman -S python --noconfirm  # already installed by python-pip
sudo pacman --noconfirm -S \
rustup \
rust-analyzer \
go \
ts-node \
luarocks \
cmake
# command line emulator
sudo pacman --noconfirm -S \
alacritty \
tmux
# cli search
sudo pacman --noconfirm -S \
fd \
fzf \
ripgrep \
ripgrep-all \
repgrep \
jq \
yq \
gitui \
tree \
pv
# cli paging and formatting
sudo pacman --noconfirm -S \
bat \
bat-extras \
git-delta \
prettier \
shfmt \
python-black \
ruff
# cli nice things
sudo pacman -S neovim --noconfirm \
starship \
ttf-iosevka-nerd \
otf-droid-nerd
# other cli
sudo pacman --noconfirm -S \
newsboat \
xclip \
zip \
unzip \
glow \
aspell aspell-en \
just \
github-cli
# docker, kubernetes, etc
sudo pacman --noconfirm -S \
docker \
docker-buildx \
k9s \
kubectl \
kubectx
# other editors
flatpak install flathub com.vscodium.codium
# tools from cargo
# sudo pacman -S postgresql --noconfirm
# cargo install cargo-update
# cargo install diesel_cli --no-default-features --features postgres
# cargo install diesel_cli_ext
# diesel completions bash | sudo tee /etc/bash_completion.d/diesel
# communication and similar stuff
flatpak install flathub com.brave.Browser
sudo pacman --noconfirm -S \
vivaldi \
signal-desktop \
obsidian
# office stuff
sudo pacman --noconfirm -S \
7zip \
pandoc \
texlive \
mupdf \
skanlite \
libreoffice-still \
libreoffice-still-ro \
libreoffice-still-de \
kate \
okular
# keys, passwords, file-synch, etc
sudo pacman --noconfirm -S \
nextcloud-client \
keepassxc \
tailscale
# games and other
sudo pacman --noconfirm -S \
steam
flatpak install com.github.tchx84.Flatseal com.heroicgameslauncher.hgl

# from node
# these are annoying to update regularly, because it can interfere with the
# system packages.  Only update right after system update, never before.
# creating/editing/managing angular components
sudo npm install --global @angular/cli
# pretty print json from kubernetes logs
sudo npm install --global pino-pretty
# github copilot, we use it at work, I wouldn't for personal use
sudo npm install --global @github/copilot

# rustup

rustup toolchain install stable

# we started using `uv` at work
cargo install --locked uv

# various, e.g. rmatrix
cargo install r-matrix
cargo install rusty-rain
cargo install --git https://github.com/lhvy/pipes-rs
