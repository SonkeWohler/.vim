
### --- package manager
# I should (eventually) adapt this to work on any package manager and use some way to detect the correct one.  Not now though.

#-- pacman

# install but update before you do
alias install='sudo pacman -Syu && sudo pacman -S '
