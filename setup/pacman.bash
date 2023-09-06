# --- basics
# update system
sudo pacman -Syyu --noconfirm
# package managers
sudo pacman -S python-pip --noconfirm
sudo pacman -S yay --noconfirm
sudo pacman -S npm --noconfirm
sudo pacman -S flatpak --noconfirm
# languages
# sudo pacman -S python --noconfirm  # already installed by python-pip
sudo pacman -S rustup --noconfirm
sudo pacman -S rust-analyzer --noconfirm
sudo pacman -S go --noconfirm
sudo pacman -S ts-node --noconfirm  # typescript
sudo pacman -S luarocks --noconfirm
# command line emulator
sudo pacman -S alacritty --noconfirm
sudo pacman -S tmux --noconfirm
# cli search
sudo pacman -S fd --noconfirm
sudo pacman -S fzf --noconfirm
sudo pacman -S ripgrep --noconfirm
sudo pacman -S ripgrep-all --noconfirm
sudo pacman -S repgrep --noconfirm
# cli paging and formatting
sudo pacman -S bat  --noconfirm
sudo pacman -S bat-extras  --noconfirm
sudo pacman -S git-delta  --noconfirm
sudo pacman -S prettier  --noconfirm
sudo pacman -S shfmt  --noconfirm
sudo pacman -S python-black  --noconfirm
sudo pacman -S ruff --noconfirm
# cli editors
sudo pacman -S vim --noconfirm
sudo pacman -S neovim --noconfirm
sudo pacman -S helix --noconfirm  # I don't use this usually, but can be nice
# other cli
sudo pacman -S newsboat --noconfirm
sudo pacman -S xclip --noconfirm
sudo pacman -S zip --noconfirm
sudo pacman -S unzip --noconfirm
sudo pacman -S wget --noconfirm
sudo pacman -S glow --noconfirm
sudo pacman -S aspell aspell-en --noconfirm
sudo pacman -S just --noconfirm
sudo pacman -S github-cli --noconfirm
# tui related stuff
sudo pacman -S starship --noconfirm
sudo pacman -S ttf-iosevka-nerd --noconfirm
# other editors
sudo pacman -S code --noconfirm
# tools from cargo
sudo pacman -S postgresql --noconfirm
cargo install cargo-update
cargo install diesel_cli --no-default-features --features postgres
cargo install diesel_cli_ext
diesel completions bash | sudo tee /etc/bash_completion.d/diesel
# communication stuff
sudo pacman -S vivaldi --noconfirm
sudo pacman -S signal-desktop --noconfirm
yay -S whatsdesk-bin
# office stuff
sudo pacman -S pandoc --noconfirm
sudo pacman -S texlive --noconfirm
sudo pacman -S mupdf --noconfirm
sudo pacman -S skanlite --noconfirm
sudo pacman -S libreoffice-still libreoffice-still-ro libreoffice-still-de --noconfirm
# gaming, uncomment for any system I want that on
# sudo pacman -S steam --noconfirm
# sudo pacman -S lutris --noconfirm

# from AUR
# yay -S nerd-fonts-complete --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu
# package managers
yay -S nvim-packer-git --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu
# misc
yay -S whatsdesk-bin --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu

# from node
# sometimes specific node versions are required for stuff
# sudo npm install --global n  # haven't used in a while
# creating/editing/managing angular components
sudo npm install --global @angular/cli
# pretty print json from kubernetes logs
sudo npm install --global pino-pretty

# just to make sure in all this time we didn't add partial upgrades by accident
# this is unlikely, but since each pacman and yay command is separate and takes
# a moment it is theoretically possible
sudo pacman -Syu --noconfirm

# rustup

rustup toolchain install stable
