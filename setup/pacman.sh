# --- basics
# update system
sudo pacman -Syu
# command line emulator
sudo pacman -S alacritty
# cli search
sudo pacman -S fzf
sudo pacman -S ack
sudo pacman -S ripgrep
sudo pacman -S ripgrep-all
# command line editors
sudo pacman -S vim
sudo pacman -S neovim
sudo pacman -S helix
# other cli
sudo pacman -S git
sudo pacman -S newsboat
sudo pacman -S zip
sudo pacman -S unzip
# tui related stuff
sudo pacman -S starship
sudo pacman -S ttf-nerd-fonts-symbols-2048-em
# other editors
sudo pacman -S code
# languages
sudo pacman -S python
sudo pacman -S rustup
sudo pacman -S rust-analyzer
# package managers
sudo pacman -S python-pip  # will install python as well
sudo pacman -S yay
sudo pacman -S npm
sudo pacman -S flatpak
# graphical stuff
sudo pacman -S vivaldi
sudo pacman -S signal-desktop
sudo pacman -S mupdf
# gaming, uncomment for any system I want that on
# sudo pacman -S steam

# from AUR
# yay -S nerd-fonts-complete
# package managers
yay -S nvim-packer-git
# misc
yay -S whatsdesk-bin

# from node
sudo npm install -g n
sudo npm install -g @angular/cli
sudo npm install -g typescript
sudo npm install -g ts-node


# --- docker desktop and kubernetes setup

# docker, or for docker-desktop
sudo pacman -S docker
sudo pacman -S gnome-terminal
sudo pacman -S qemu-full
sudo yay -S docker-rootless-extras
username=$(whoami)
sudo echo "$username:165536:65536" > /etc/subuid
sudo echo "$username:165536:65536" > /etc/subgid
wget --output-document='~/Downloads/docker-desktop.pkg.tar.zst' --tries=3 --output-file='/tmp/wget-docker-log' https://desktop.docker.com/linux/main/amd64/docker-desktop-4.12.0-x86_64.pkg.tar.zst?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64
sudo pacman -U ~/Downloads/docker-desktop.pkg.tar.zst
# kubernetes
sudo pacman -S k9s
sudo pacman -S kubectl
sudo pacman -S kubectx
