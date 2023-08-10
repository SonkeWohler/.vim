### stuff used throughout by bashrc files
# I'll also throw options in here, since they affect all of bash
# at least until I have too many options

### --- paging

# I prefer full paging, because it creates less clutter in my display
alias dlt='delta --paging=always'
# this took me way too long to find and understand
# https://superuser.com/questions/366930/how-do-i-get-the-git-pager-to-clean-up-screen-output-after-exit
# but I prefer pagers to NOT dump their view in the terminal on quit
# pagers are for paging, not for dumping!
# works with delta as well
export LESS=RS
