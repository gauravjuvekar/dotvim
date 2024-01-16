au VimEnter * if &diff | execute 'windo set wrap' | endif

" 3 way merge commands
nnoremap ml :diffget LOCAL<cr>
nnoremap mb :diffget BASE<cr>
nnoremap mr :diffget REMOTE<cr>
