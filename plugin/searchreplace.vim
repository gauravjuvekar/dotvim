" Search highlighting
set showmatch
set incsearch
" Keymap to toggle highlight
nnoremap <F4> :set hlsearch!<CR>

"Ignore case while searching
set ignorecase

" Use S for substitution with smart capitalization
cnoreabbrev S Subvert

if executable('ag')
    let g:ackprg='ag --vimgrep'
endif
