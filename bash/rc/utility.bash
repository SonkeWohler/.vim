### --- general purpose --- ###

### --- fzf

source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash

### --- bindings

# my new keyboard doesn't have a | or \ key where I like it
bind '"\e`":"|"'
bind '"\ez":"\\"'

# i prefer to type `clear` out and now I found a use for \C-l
# edit: turns out that most shells don't work like git bash for windows
##bind '"\C-l":" | lessx"' 

### --- editor related

# for <C-x-e>
EDITOR="vim"
SUDO_EDITOR="vim"

# vim with fzf
alias vimf='vim -o `fzf`'
alias vif='vimf'

#-- search
ax() {
  ack --color -i "$1" | lessx
}

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

### --- scoop related
# update all
scoopUp() {
  cd $scoopCD

  scoop update
  scoop update *
  cd -
}

### --- workarounds

# reduces issues related to Capslock being mapped to Ctrl
alias exx='sleep 0.25s ; exit' 
# sometimes I like to do it this way
alias :q='exx'

# xclip
alias xclipp='xclip -selection clipboard'

### --- other

#-- Latex
# cleanup compilation files
alias cleanLatex='find . | grep -v ".git" | grep -P "\.pdf|\.aux|\.log|\.out" | xargs rm -v'

