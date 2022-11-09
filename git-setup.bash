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
librariesCD="~/libraries"
vimCD="$librariesCD/.vim"

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

#-- final default git config
echo 'would you like to use the default git config?'
echo 'this sets the default git user.name and user.email'
read -n 1 yesNo
if [ $yesNo = "y" ]; then
    git config --global user.name sonke
    git config --global user.email sonke.a.wohler@gmail.com
else
    echo 'you should setup your git user.name and user.email'
    echo 'this is an example command:'
    echo 'git config --global user.name sonke'
    echo 'git config --global user.email sonke.does.git@somewhere.com'
fi

cd $vimCD/setup
echo '--------------------------'
echo '--- git setup is done! ---'
echo '--------------------------'
