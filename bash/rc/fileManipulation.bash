### --- anything related to file viewing, manipulating, directories etc --- ###

### --- file manipulation, I like everything verbal

alias mkd='mkdir -vp'
alias rmv='rm -rv'
alias rmd='rm -dv'
alias mvv='mv -v'
alias cpv='cp -rv'
mkcd() { mkdir -vp $1 ; cd $1 ; }

### --- file and directory viewing/changing aliases

# -- ls etc
alias lessx='less -RF'
alias lsa='ls -lAh --color=always'
lsx() { lsa $@ | lessx ; }

# -- cd
# back
alias cd-='cd -' 
# up
alias cd.='cd ..' 
# lsa after cd
cda() { cd $@ && lsa ; }

# -- various
# have to make this specific to windows when I get to it
alias cpwd='echo $PWD | clip'

# shasum
shafile() {
  sum=$(shasum -a $1 $2)
  if [ "$sum" = "$3" ];then
    # I think it is good to print the hash, so you can look at it and convince yourself, if you don't trust my programming
    echo "$sum"
  else
    # the same is not necessary for nay
    echo nay
  fi
}

### --- oversimplified bookmarks

alias cdd='cd $writingCD'
alias cdwork='cd $workCD'
alias cdihp='cd $workCD/IHP'
alias cdt='cd $tempCD'
alias cdv='cd $vimCD'
alias cdl='cd $librariesCD'
alias cdw='cd $wikiCD'
alias cdlatex='cd $librariesCD/latex/'
