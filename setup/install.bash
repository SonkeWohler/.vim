#!/bin/bash

# THIS IS A WORK IN PROGRESS AND HAS NOT BEEN TESTED
# you'll probably be fine, but don't rely on this just yet

# RUN FROM YOUR HOME DIRECTORY

# Simple setup preparation for my dotfiles

# While this would be cleaner in multiple files, due to the intended
# usage it is one unreasonably large file

# While you can probably curl this script you should always wget it
# and inspect it before executing it, especially since it needs root
# priviliges.  At least that is the best practice security wise

### --- script location

# since the script is run as root ~ takes us to /root/, rather than the user's ~
cd "$(dirname "$(readlink -f "$0")")"
userHome=$PWD

### --- formatting and stuff

print() {
  echo "   +++   $1"
}

print "this setup installs the packages required for my setup"
print "Sonke (sonki) Wohler --- https://github.com/SonkeWohler/.vim"
print "================"

### --- package adjustments
# this section contains adjustments to be made based on the distro
# and other properties, as well as the lists of packages to be
# installed

# obviously this installation requires different commands on
# different distros from the package manager to the names of some
# packages, to the way that Rust is installed

# I took inspiration for this part from here:
# https://unix.stackexchange.com/questions/46081/identifying-the-system-package-manager

#-- possible package managers
# for the distros I don't have currently installed I used the following links for help:
# https://www.redhat.com/sysadmin/how-manage-packages
# https://wiki.alpinelinux.org/wiki/Package_management
declare -A manager;
manager[/etc/arch-release]=pacman
manager[/etc/debian_version]=apt
manager[/etc/alpine-release]=apk
manager[/etc/SuSE-release]=zypp
manager[/etc/redhat-release]=yum
manager[/etc/gentoo-release]=emerge

#-- command to install new packages
# unfortunately the most efficient way to handle this in the script
# is a one liner.  Maybe I will split this up eventulaly. I also add
# anything like rust that can't be done by the package manager in the
# end
declare -A packageInstallCLI;
packageInstallCLI[pacman]="pacman -S git xclip tmux ack fzf vim neovim texlive-humanities texlive-bibtexextra texlive-fontsextra texlive-formatsextra texlive-latexextra texlive-pictures texlive-science pandoc jdk-openjdk jdk8-openjdk maven htop ncdu timeshift tar zip unzip rustup"
packageInstallCLI[apt]="apt install git xclip tmux ack fzf vim neovim texlive-full pandoc openjdk-16-jdk maven htop ncdu timeshift tar zip unzip && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
# TODO packages for alpine
packageInstallCLI[apk]='print "this is currently unsuported (TODO), the script is failing now" && exit 1'
##packageInstallCLI[apk]="apk add"
# TODO packages for fedora
# check if -y works as exected
packageInstallCLI[yum]='print "this is currently unsuported (TODO), the script is failing now" && exit 1'
##packageInstallCLI[yum]="yum install -y"
# TODO packages for SUSE
packageInstallCLI[zypp]='print "this is currently unsuported (TODO), the script is failing now" && exit 1'
# TODO packages for gentoo
packageInstallCLI[emerge]='print "this is currently unsuported (TODO), the script is failing now" && exit 1'

#-- graphical packages
# stuff like browsers, pdf readers etc aren't very useful in a cli only environment
# these are also more on the leisure side of things, like games and stuff
declare -A packageInstallGUI;
packageInstallGUI[pacman]="pacman -S vivaldi brave steam lutris mupdf"
packageInstallGUI[apt]="apt install vivaldi brave steam lutris mupdf"
packageInstallGUI[apk]="apk install vivaldi brave steam lutris mupdf"
packageInstallGUI[yum]="yum install vivaldi brave steam lutris mupdf"
packageInstallGUI[zypp]='print "this is currently unsuported (TODO), the script is failing now" && exit 1'
packageInstallGUI[emerge]='print "this is currently unsuported (TODO), the script is failing now" && exit 1'

#-- command to update the system
declare -A packageUpdates;
packageUpdates[pacman]="pacman -Syu"
packageUpdates[apk]="apk update && apk upgrade"
packageUpdates[apt]="apt update && apt upgrade"
packageUpdates[yum]="yum update -y"
packageUpdates[zypp]='print "this is currently unsuported (TODO), the script is failing now" && exit 1'
packageUpdates[emerge]='print "this is currently unsuported (TODO), the script is failing now" && exit 1'

### --- getting to know the distro
# here is where the setup really starts, based on the settings from
# above

#-- get the correct package manager

for f in ${!manager[@]}
do
    if [[ -f $f ]];then
        packageManager=${manager[$f]}
    fi
done

print "The package manager appears to be: $packageManager"
print "is this correct [Y/n]?"
read -n 1 yesNo
echo "$yesNo"
# https://stackoverflow.com/questions/2264428/how-to-convert-a-string-to-lower-case-in-bash
yesNo="${yesNo,,}"
if [ $yesNo = "n" ]; then
  print "No?"
  print "this script doesn't handle that yet"
  print "aborting script..."
  # according to man exit 127 may be the correct code, as a utility
  # to be executed (package manager) wasn't found
  exit 127
elif [ $yesNo = "y" ]; then
  print "Good..."
else
  print "invalid answer"
  print "this script doesn't handle that yet"
  print "aborting script..."

  exit 1
fi

sleep 1
printGreat() { print "great, I have a setup for that" ;}
if [ packageManager="pacman" ]; then
  printGreat
elif [ packageManager="apt" ]; then
  printGreat
  print "installing rust now"
else
  print "unfortunately, I don't have a full setup for that"
  print "please install the required packages first, then see if you can ski the package installation"
  exit 1
fi
sleep 1

#-- update and install packages

print ""
print "attempting to update the system"
print ""
sleep 2
# https://stackoverflow.com/questions/2005192/how-to-execute-a-bash-command-stored-as-a-string-with-quotes-and-asterisk
eval ${packageUpdates[$packageManager]}
sleep 2
print ""
print "system upgrade done"
sleep 2

print ""
print "attempting to install cli based packages"
print ""
sleep 1
eval ${packageInstallCLI[$packageManager]}
sleep 2
print ""
print "CLI package installation done"
print ""
sleep 2

print "is this a CLI only system? [Y/n]"
print ""
read -n 1 yesNo
echo ""
yesNo="${yesNo,,}"
if [ $yesNo = "n" ]; then
  print "attempting to install gui based packages"
fi
sleep 2
print ""
print "package installation is done"
print ""
sleep 2

### --- wrapping things up

#-- checking installations

fzf_paths="/usr/share/doc/fzf/examples/ /usr/doc/fzf/examples/ /usr/share/fzf/examples/ /usr/share/doc/fzf/ /usr/doc/fzf/ /usr/share/fzf"
fzf_files="key-bindings.bash completion.bash"

# remember, 0 is true, all else is false
fzf_installed=1
for path in fzf_paths
do
  for file in fzf_files
  do
    location=$path$file
    if [ -f $location ]; then
      fzf_installed=0
    fi
  done
done

if [[ fzf_installed ]]; then
  mkdir --parents --verbose /usr/share/fzf
  cd /usr/share/fzf
  wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash
  wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash
fi

#-- refer to non-root setup files

print "the sudo setup script is done"
print "you should continue setting up github and config files using the setup.bash file"
print "downloading file now from https://raw.githubusercontent.com/SonkeWohler/.vim/asus/setup/setup.bash"
wget https://raw.githubusercontent.com/SonkeWohler/.vim/asus/setup/setup.bash
chmod +x setup.bash
print "run it using:   source setup.bash"
