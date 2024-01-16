" Global clip board as +
" Mouse buffer is *
set clipboard=unnamedplus


" https://superuser.com/a/321726/252728
" delete or visual paste without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap p "_dP
vnoremap <leader>p p
