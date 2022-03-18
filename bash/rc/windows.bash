
### --- workarounds

# reduces issues related to Capslock being mapped to Ctrl on windows
alias exx='sleep 0.25s ; exit' 
# sometimes I like to do it this way
alias :q='exx'

### --- scoop related

# update all
scoopUp() {
  cd $scoopCD
  scoop update
  scoop update *
  cd -
}
