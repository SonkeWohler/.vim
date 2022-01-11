# #!/usr/bin/bash
# After required software has been installed, setting up the github ssh, repos etc

### --- formatting etc

print() {
  echo "   +++   $1"
}

print "this setup configures git, its ssh connection to github and downloads my dotfiles"
print "Sonke (sonki) Wohler --- https://github.com/SonkeWohler/.vim"
print "=============="

### --- setting up dotfiles

cd ~
dotfilesURL="git@github.com:SonkeWohler/.vim.git"

#-- git config
# while copying the .gitconfig file is better for most settings, since I am
# about to use git to clone my dotfiles which contain these config files some
# settings are better set now.  What is set here will be limited to those
# settings unlikely to ever change.

print ""
print "setting up gitcofig"
print ""

cd ~

if [ -f ~/.gitconfig ]; then
  print "gitconfig seems to exist already"
  print "you can leave the existing file untouched (n), add to it (a) or replace it (r)"
  print "if you choose to replace a backup of the original will be located at ~/.gitconfig.old"
  read -n 1 yesNo
else
  yesNo='a'
  touch .gitconfig
fi

yesNo="${YesNo,,}"
if [ $yesNo = "r" ]; then
  mv -v .gitconfig .gitconfig.old
  touch .gitconfig
  yesNo=a
fi

if [ $yesNo = "a" ]; then
  echo "[core]" >> .gitconfig
  echo "  editor = vim" >> .gitconfig
  echo "[user]" >> .gitconfig
  echo "  name = new Sonki Linux" >> .gitconfig
  echo "  email = sonke.a.wohler@gmail.com" >> .gitconfig
  echo "[diff]" >> .gitconfig
  echo "  tool = vimdiff" >> .gitconfig
  echo "[color]" >> .gitconfig
  echo "  ui = true" >> .gitconfig
fi

# ssh keys, taking notes from GitHub
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh

if [ -f ~/.ssh/id_ed25519.pub ]; then
  print "found an existing ssh key to add to GitHub"
else
  print "generating new ssh key to authenticate this machine..."
  mkdir --parents --verbose ~/.ssh
  sleep 1
  ssh-keygen -t ed25519 -C "sonke.a.wohler@gmail.com" -f "~/.ssh/id_ed25519"
fi
print ""
print "adding ssh key to the ssh-agent"
print ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
print "now you need to add this ssh key to your GitHub"
xclip ~/.ssh/id_ed25519.pub -select clipboard
print "the ssh key should be in your clipboard now, but will be printed below again:"
cat ~/.ssh/id_ed25519.pub
print "please go to https://github.com/settings/keys and add the ssh key"
print "further instructions here:"
print "https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account"
print ""
print "press any key to continue..."
read -n 1 yesNo
print "the git setup is complete, we are about to setup your library and clone your basic repos"
sleep 2

#-- locations

# simlified bookmarks

cd ~
print "basic bookmarks are being setup"
touch locationsForCD.bash
echo 'tempCD="/tmp"' >> locationsForCD.bash
echo 'librariesCD="$HOME/libraries"' >> locationsForCD.bash
echo 'writingCD="$librariesCD/writingLibrary"' >> locationsForCD.bash
echo 'vimCD="$librariesCD/.vim"' >> locationsForCD.bash
librariesCD="~/libraries"
vimCD="$librariesCD/.vim"

#-- dotfiles and other basic repos

cd ~
print "setting up repos"
mkdir libraries --parents --verbose
cd libraries
print "cloning dotfiles into ~/libraries"
git clone --recursive $dotfilesURL
print "cloning small projects library"
git clone git@github.com:SonkeWohler/smallProjectsLibrary.git
print "cloning journal and related writing stuff (private)"
git clone git@github.com:SonkeWohler/writingLibrary.git

### --- handing over to dotfiles scripts

cd $vimCD/setup
print "git related setup is done, moving on to config files"
print ""
source config.bash

### --- finishing things up

cd ~
