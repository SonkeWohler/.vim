# I have to have docker-desktop for work, but on non-work machines this is not
# that necessary.

# Either way, it is a bit of a hassle and I am not 100% sure this script works
# without issues yet.  I'll keep it here and if it turns out to work fine I
# might add it back to the end of pacman.bash

# https://wiki.archlinux.org/title/Docker

# install docker
sudo pacman -S docker --noconfirm

# make it runnable from non-root
yay -S docker-rootless-extras --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu
echo "$(whoami):165536:65536:" | sudo tee /etc/subuid
echo "$(whoami):165536:65536:" | sudo tee /etc/subgid
gpasswd -a "${whoami}" docker
# at this point it might be nice to run some tests to see if docker runs as
# intended.  It is easier to sort out with basic docker, than if you constantly
# have to wait for docker-desktop>

# install prerequesites for docker-desktop
sudo pacman -S gnome-terminal --noconfirm
sudo pacman -S qemu-full --noconfirm

# download docker desktop and install
# currently version 4.15 - you have to update the version number with every
# update, but at least you won't install a breaking change without knowing it,
# so it's not all bad.
wget --output-document=/tmp/docker-desktop.pkg.tar.zst https://desktop.docker.com/linux/main/amd64/docker-desktop-4.20.1-x86_64.pkg.tar.zst
sudo pacman -U /tmp/docker-desktop.pkg.tar.zst

# install kubernetes tools
sudo pacman -S k9s --noconfirm
sudo pacman -S kubectl --noconfirm
sudo pacman -S kubectx --noconfirm

# reboot and starting instructions
echo 'You will have to restart the system to run docker-desktop as non-root user.'
echo 'Afterwards, try running the following to test your docker works as intended.'
echo 'docker info'
echo 'docker run -it --rm archlinux bash -c "echo hello world"'
echo ' '
echo 'and when that works you can start docker-desktop:'
echo 'Run ` systemctl start docker-desktop ` when you are done.'
