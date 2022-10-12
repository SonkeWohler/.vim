# --- basics
# update system
sudo pacman -Syu --noconfirm
# command line emulator
sudo pacman -S alacritty --noconfirm
sudo pacman -S tmux --noconfirm
# cli search
sudo pacman -S fzf --noconfirm
sudo pacman -S ack --noconfirm
sudo pacman -S ripgrep --noconfirm
sudo pacman -S ripgrep-all --noconfirm
# command line editors
sudo pacman -S vim --noconfirm
sudo pacman -S neovim --noconfirm
sudo pacman -S helix --noconfirm
# other cli
sudo pacman -S git --noconfirm
sudo pacman -S newsboat --noconfirm
sudo pacman -S zip --noconfirm
sudo pacman -S unzip --noconfirm
# tui related stuff
sudo pacman -S starship --noconfirm
sudo pacman -S ttf-nerd-fonts-symbols-2048-em --noconfirm
# other editors
sudo pacman -S code --noconfirm
# languages
sudo pacman -S python --noconfirm
sudo pacman -S rustup --noconfirm
sudo pacman -S rust-analyzer --noconfirm
# package managers
sudo pacman -S python-pip --noconfirm  # will install python as well --noconfirm
sudo pacman -S yay --noconfirm
sudo pacman -S npm --noconfirm
sudo pacman -S flatpak --noconfirm
# graphical stuff
sudo pacman -S vivaldi --noconfirm
sudo pacman -S signal-desktop --noconfirm
sudo pacman -S mupdf --noconfirm
# gaming, uncomment for any system I want that on
# sudo pacman -S steam --noconfirm

# from AUR
# yay -S nerd-fonts-complete --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu
# package managers
sudo yay -S nvim-packer-git --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu
# misc
sudo yay -S whatsdesk-bin --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu

# from node
sudo npm install -g n
sudo npm install -g @angular/cli
sudo npm install -g typescript
sudo npm install -g ts-node


# --- docker desktop and kubernetes setup

# docker, or for docker-desktop
sudo pacman -S docker --noconfirm
sudo pacman -S gnome-terminal --noconfirm
sudo pacman -S qemu-full --noconfirm
sudo yay -S docker-rootless-extras --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu
echo "$(whoami):165536:65536: | sudo tee /etc/subuid
echo "$(whoami):165536:65536: | sudo tee /etc/subgid
wget --output-document='~/Downloads/docker-desktop.pkg.tar.zst' --tries=3 --output-file='/tmp/wget-docker-log' https://desktop.docker.com/linux/main/amd64/docker-desktop-4.12.0-x86_64.pkg.tar.zst?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64
sudo pacman -U ~/Downloads/docker-desktop.pkg.tar.zst --noconfirm
# kubernetes
sudo pacman -S k9s --noconfirm
sudo pacman -S kubectl --noconfirm
sudo pacman -S kubectx --noconfirm
