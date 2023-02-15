### --- anything related to file viewing, manipulating, directories etc --- ###

### --- file manipulation, I like everything verbal

alias mkd='mkdir -vp'
alias rmv='rm -rvi'
alias rmd='rm -dv'
alias mvv='mv -v'
alias cpv='cp -rv'
mkcd() { mkdir -vp $1 ; cd $1 ; }

### --- file and directory viewing/changing aliases

# -- ls etc
alias lessx='less -RF'
alias lsa='ls -l --almost-all --classify --human-readable --color=always'
lsx() { lsa $@ | lessx ; }

# -- cd
# back
alias cd-='cd -' 
# up
alias cd.='cd ..' 
# lsa after cd
cda() { cd $@ && lsa ; }

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

# mupdf
mpdf() {
  mupdf "$1" &>> /tmp/mu.log &
}

# like above but more general, experimental
backs() {
  $($1 "$2") &>> /tmp/backs.log &
}

##alias open='xdg-open'
open() {
  xdg-open $1 &>> /tmp/xdg-open.log
}

### --- oversimplified bookmarks

alias cdd='cd $writingCD'
alias cdw='cd $workCD'
alias cdt='cd $tempCD'
alias cdv='cd $vimCD'
alias cdl='cd $librariesCD'
alias cdn='cd $notesCD'
alias cdwiki='cd $wikiCD'
alias cdlatex='cd $librariesCD/latex/'
