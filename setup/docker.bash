# We use docker-desktop at work, and this will likely remain the default for
# most.  I started to switch to kind, which is experimentally working much
# better, but not yet fully stable.
# https://kind.sigs.k8s.io/

# this script should work without issue at setting up docker-desktop, mostly
# following the wiki
# https://wiki.archlinux.org/title/Docker

# install docker
sudo pacman -S docker --noconfirm
sudo pacman -S docker-buildx --noconfirm

# make it runnable from non-root
yay -S docker-rootless-extras --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu
echo "$(whoami):165536:65536" | sudo tee /etc/subuid
echo "$(whoami):165536:65536" | sudo tee /etc/subgid
gpasswd -a "${whoami}" docker

# I sometimes have trouble with the internet part here
echo 'At this point you should be able to run docker with sudo and ping the internet'
echo 'After a restart you should be able to do the same without sudo'
sudo docker run -it --rm archlinux bash -c "ping ping.archlinux.org"

# install kubernetes tools, if you haven't yet
sudo pacman -S k9s --noconfirm
sudo pacman -S kubectl --noconfirm
sudo pacman -S kubectx --noconfirm

# if you want to use kind, just install that instead
# and skip the everything else below
# yay -S kind --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu

# install prerequesites for docker-desktop
sudo pacman -S gnome-terminal --noconfirm
sudo pacman -S qemu-full --noconfirm

# download docker desktop and install
# currently version 4.15 - you have to update the version number with every
# update, but at least you won't install a breaking change without knowing it,
# so it's not all bad.
yay -S docker-desktop

# reboot and starting instructions
echo 'After a system restart, you should be able to start docker desktop and set it up'
echo 'Use "sudo systemctl start docker-desktop", or enable it if you prefer'
echo 'Adjust its resources and install the k8s extension, then you should be able to run k8s fine'
