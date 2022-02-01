### --- general purpose --- ###

### --- sudo

#-- aliases
# https://wiki.archlinux.org/title/Sudo#Passing_aliases
alias sudo='sudo '

### --- fzf

# load completions and other useful stuff
# these files may be in slightly different locations on different machines
fzfPath="/usr/share/doc/fzf/examples/key-bindings.bash"
if ! test -f "$fzfPath"; then
  fzfPath=$(echo "$fzfPath" | perl -pe "s/examples\///g")
  if ! test -f "$fzfPath"; then
    fzfPath=$(echo "$fzfPath" | perl -pe "s/doc\///g")
    if ! test -f "$fzfPath"; then
      echo "could not source fzf completion files.  Is it installed?"
    fi
  fi
fi
source "$fzfPath"
fzfPath=$( echo "$fzfPath" | perl -pe "s/key-bindings\.bash/completion.bash/g")
source "$fzfPath"

### --- bindings

# my new keyboard doesn't have a | or \ key where I like it
# I know this should principally happen on a per machine basis (machine local
# bashrc/inputrc) but I got so used to this that I like having it in all my
# systems --- sue me
bind '"\e`":"|"'
bind '"\eq":"|"'
bind '"\ez":"\\"'

# i prefer to type `clear` out and now I found a use for \C-l
# edit: turns out that most shells don't work like git bash for windows
##bind '"\C-l":" | lessx"' 

### --- editor related

# for <C-x-e>
export EDITOR="vim"
export SUDO_EDITOR="vim"

# vim with fzf
# this is only necessary on systems where fzf the vim plugin and fzf the bash
# tool don't play nice
alias vimf='vim -o `fzf`'
alias vif='vimf'

#-- search
# simple ack with less
axx() {
  pattern="$1"
  shift
  ack --color "$pattern" $@ | less -RF
}
# usually I don't like case sensitivity
ax() {
  pattern="$1"
  shift
  ack --color -i "$pattern" $@ | less -RF
}
# search and replace using ack
acks() {
  if test -z "$1" | test -z "$2"; then
    echo "requires non-zero search string and a replace string"
    return 1
  fi
  ack --color "$1" | less -RF
  echo "confirm replace [a]ll or [n]ot"
  read -n 1 yesNo
  if [ "$yesNo" = "n" ];then
    echo "not replacing anything, the end"
    return 0
  fi
  # TODO replace one by one
  ack -l "$1" | xargs perl -pi -E "s/$1/$2/g"
}
# limit the depth for searching files
filegrep() {
  arg1=$1
  shift
  find -maxdepth $arg1 | grep $@
}
alias fgrep='filegrep 1'
faxx() {
  arg1=$1
  shift
  find -maxdepth $arg1 | ack --color --files-from=- $@
}
fax() {
  arg1=$1
  shift
  faxx $arg1 -i $@
}

### --- scoop related
# update all
scoopUp() {
  cd $scoopCD

  scoop update
  scoop update *
  cd -
}

### --- workarounds

# reduces issues related to Capslock being mapped to Ctrl on windows
alias exx='sleep 0.25s ; exit' 
# sometimes I like to do it this way
alias :q='exx'

# xclip
alias xclipp='xclip -selection clipboard'

### --- other

#-- Latex
# cleanup compilation files
alias cleanLatex='find . | grep -v ".git" | grep -P "\.pdf|\.aux|\.log|\.out" | xargs rm -v'

