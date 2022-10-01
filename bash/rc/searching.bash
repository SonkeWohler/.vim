# some things related to searching for filenames, filetypes, file contents, or any such thing

### --- aliases

alias gg='grep'
alias gv='grep -v'

### --- inside files

# configure ripgrep
export RIPGREP_CONFIG_PATH="$vimCD/config/ripgreprc"

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
faxx() {
  arg1=$1
  shift
  find -maxdepth $arg1 -type f | ack --color --files-from=- $@
}
fax() {
  arg1=$1
  shift
  faxx $arg1 -i $@
}

### --- filenames

# this is mostly a chain of functions building on each other
# but this way I can also make use of any one of them individually

# I now started using fd
alias ff='fd --hidden --type f'

# prettify output of find
listfiles() {
  if test -z "$1" ; then
      arg1='-h'
  else
      arg1=$1
  fi
  if [ $arg1 = "-h" ]; then
      echo 'listfiles <depth>'
      echo ''
      echo 'list all files in and below this directory and clean the output up a little'
      echo 'listing goes <depth> levels deep (1 is just here)'
      return
  fi
  find -maxdepth $@ | sed 's/^\.\///g' | grep -v "^\.$"
}
# grep for a search term
filegrep() {
  if test -z "$1" ; then
      arg1='-h'
  else
      arg1=$1
  fi
  if [ $arg1 = "-h" ]; then
      echo 'filegrep <depth> <grep-term>'
      echo ''
      echo 'search for <grep-term> in the filenames in and below this directory'
      echo 'search goes <depth> levels deep (1 is just here, 0 is nothing)'
      return
  fi
  shift
  listfiles $arg1 | grep $@ --color=always
}
# use less for display
ffgrep() {
  filegrep $@ | less -RF
}
# exrtra simple for just the current directory
alias fgrep='ffgrep 1'
alias flist='listfiles 1'

but() {
    if test -z "$1"; then
        echo 'list all files but the specified pattern'
        echo 'usage:'
        echo 'but $1 $2'
        echo '$1 is a grep/perl pattern to filter out of the file list'
        echo '$2 is optional and defines the maxdepth for find'
        return
    fi
    maxdepth=1
    if test -n "$2"; then
        maxdepth=$2
    fi
    find . -maxdepth "$maxdepth" | grep -v '^\.$' | grep -vP $1
}
