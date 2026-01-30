# --- basics
# update system
sudo pacman -Syyu --noconfirm
# system package managers
sudo pacman -S python-pip --noconfirm
sudo pacman -S yay --noconfirm
sudo pacman -S npm --noconfirm
sudo pacman -S flatpak --noconfirm
# keyboard stuff
sudo pacman -S keyd --noconfirm
# languages
# sudo pacman -S python --noconfirm  # already installed by python-pip
sudo pacman -S rustup --noconfirm
sudo pacman -S rust-analyzer --noconfirm
sudo pacman -S go --noconfirm
sudo pacman -S ts-node --noconfirm  # typescript
sudo pacman -S luarocks --noconfirm
# other language-like dependencies
sudo pacman -S cmake --noconfirm
# command line emulator
sudo pacman -S alacritty --noconfirm
sudo pacman -S tmux --noconfirm
# cli search
sudo pacman -S fd --noconfirm
sudo pacman -S fzf --noconfirm
sudo pacman -S ripgrep --noconfirm
sudo pacman -S ripgrep-all --noconfirm
sudo pacman -S repgrep --noconfirm
sudo pacman -S jq --noconfirm
sudo pacman -S gitui --noconfirm
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
sudo pacman -S otf-droid-nerd --noconfirm
# other editors
flatpak install flathub com.vscodium.codium  # TODO add drawio pluin
# tools from cargo
# sudo pacman -S postgresql --noconfirm
# cargo install cargo-update
# cargo install diesel_cli --no-default-features --features postgres
# cargo install diesel_cli_ext
# diesel completions bash | sudo tee /etc/bash_completion.d/diesel
# communication and similar stuff
sudo pacman -S vivaldi --noconfirm
flatpak install flathub com.brave.Browser
sudo pacman -S signal-desktop --noconfirm
sudo pacman -S obsidian
# office stuff
sudo pacman -S pandoc --noconfirm
sudo pacman -S texlive --noconfirm
sudo pacman -S mupdf --noconfirm
sudo pacman -S skanlite --noconfirm
sudo pacman -S libreoffice-still libreoffice-still-ro libreoffice-still-de --noconfirm
# keys, passwords, file-synch, etc
sudo pacman -S nextcloud-client keepassxc --noconfirm
# recording, debugging, etc
# sudo pacman -S obs-studio --noconfirm

# from AUR
# misc
# yay -S whatsdesk-bin --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu

# from node
# sometimes specific node versions are required for stuff
# sudo npm install --global n  # haven't used in a while
# creating/editing/managing angular components
sudo npm install --global @angular/cli
# pretty print json from kubernetes logs
sudo npm install --global pino-pretty

# rustup

rustup toolchain install stable

# we started using `uv`
# this trusts the curl output, so not exactly best practice
curl -LsSf https://astral.sh/uv/install.sh | sh

# various, e.g. rmatrix
yay -S rmatrix
cargo install rusty-rain
cargo install --git https://github.com/lhvy/pipes-rs
