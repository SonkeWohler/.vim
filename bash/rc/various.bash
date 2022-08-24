
### --- package manager
# I should (eventually) adapt this to work on any package manager and use some way to detect the correct one.  Not now though.

#-- package managers and installation stuff

# flatpak in three letters
alias fpk='flatpak'
# install but update before you do
alias install='sudo pacman -Syu && yay -Syu && sudo pacman -S'
# update the whole thing
alias update-myself='sudo pacman -Syu && yay -Syu && sudo flatpak update'
