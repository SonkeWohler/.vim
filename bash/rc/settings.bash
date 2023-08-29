### --- variables and settings --- ###

# path for cargo install
PATH=$PATH:$HOME/.cargo/bin

# for <C-x-e>
export EDITOR="nvim"
# for sudoedit
export SUDO_EDITOR="nvim"

# this took me way too long to find and understand
# https://superuser.com/questions/366930/how-do-i-get-the-git-pager-to-clean-up-screen-output-after-exit
# but I prefer pagers to NOT dump their view in the terminal on quit
# pagers are for paging, not for dumping!
# works with delta as well
export LESS=RS
