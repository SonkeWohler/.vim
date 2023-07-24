# #!/usr/bin/bash
# After required software has been installed, setting up the github ssh, repos etc

### --- formatting etc

print() {
  echo "   +++   $1"
}

print "this setup configures git, its ssh connection to github and downloads my dotfiles"
print "Sonke (sonki) Wohler --- https://github.com/SonkeWohler/.vim"
print "=============="

### --- setting ssh for GitHub

cd ~
dotfilesURL="git@github.com:SonkeWohler/.vim.git"

cd ~

# ssh keys, taking notes from GitHub
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh

if [ -f ~/.ssh/id_ed25519.pub ]; then
  print "found an existing ssh key to add to GitHub"
else
  print "generating new ssh key to authenticate this machine..."
  mkdir --parents --verbose ~/.ssh
  sleep 1
  ssh-keygen -t ed25519 -C "sonke.a.wohler@gmail.com"
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
echo 'notesCD="$librariesCD/notes' >> locationsForCD.bash
librariesCD="~/libraries"
vimCD="$librariesCD/.vim"
notesCD="$librariesCD/notes"

#-- dotfiles and other basic repos

cd ~
print "setting up repos"
mkdir libraries --parents --verbose
cd libraries
print "cloning dotfiles into ~/libraries"
git clone $dotfilesURL
git config --global core.excludesFile "$vimCD/config/gitignore"
print "cloning journal and related writing stuff (private)"
git clone git@github.com:SonkeWohler/writingLibrary.git
print "setting up notes"
mkdir notes
echo '# Local Temporary Notes' > notes/tmp.md

echo 'setting default git username and email for now, so you can continue'
echo 'these will later be overwritten with the dotfiles with setup/config.bash'
git config --global user.name sonke
git config --global user.email sonke.a.wohler@gmail.com

cd ~/libraries/.vim/setup
echo '--------------------------'
echo '--- git setup is done! ---'
echo '--------------------------'
