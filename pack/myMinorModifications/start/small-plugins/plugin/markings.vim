""" --- setting marks at convenient times --- """
" It often annoys me when an operation moves the cursor and I have to navigate
" back. This should help

" allows returning to mark with `h, why is this not out of the box?
nnoremap ? mh?
nnoremap / mh/
" these don't work if cursor is at end of line, but that requires more logic
nnoremap << mh<<`hhh
nnoremap >> mh>>`hll
