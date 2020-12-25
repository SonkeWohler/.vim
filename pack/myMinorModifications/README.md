# My Minor Modifications

This is where I put small `*.vim` files that are slightly larger than I like in my `.vimrc`, or that I might want to keep separate for any other reason.

Most of them I probably put under `start` to load them automatically, but another way of doing things is to put them under `opt` and put `runtime /path/to/file.vim` in the `.vimrc` , which then additionally creates a record of the change in the `.vimrc` where most people would look for it.

## More Black Holes

Like many other people, I don't like how every single modification of the text is saved in the unnamed register. I know this is by design, but it interferes with yank and pasting operations all the time.

The result of this vim file is that I copy text using visual mode, so have to start with `v`, then select (e.g. `3w`), then press `d` last. I think that is no less convenient than deleting from normal mode, but it tells vim explicitly to store the deleted content in `""` and `"*`.

It also allows deleting text into `"_` with `x` or `X` in normal or visual mode.`

## Split Buffers Vertically

This is a functionality requested so commonly it exists as a [patch](https://github.com/chrisbra/vim-mq-patches/blob/master/verstplit), but not in the default vim compilation. I instead chose to add an implementation from [here](https://www.reddit.com/r/vim/comments/2irn8j/vertical_split_by_default/) to my vimfiles.
