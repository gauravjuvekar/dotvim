syntax on
filetype plugin indent on
call pathogen#infect()
set number
set background=dark
set showmatch
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set textwidth=79
set formatoptions+=t
set colorcolumn=79
set scrolloff=4
set laststatus=2

set clipboard=unnamedplus

set t_Co=256

au BufNewFile,BufRead *.html set filetype=htmldjango

nmap <F5> :SCCompile<CR>
nmap <F6> :SCCompileRun<CR>
nmap <F4> :set hlsearch!<CR>

vmap <Enter> <Plug>(EasyAlign)
    
"let g:syntastic_quiet_messages          = { "type" : "style" }
let g:syntastic_aggregate_errors        = 1
let g:syntastic_python_pylint_args      = "--disable=bad-whitespace --disable=missing-docstring" 
let g:syntastic_html_tidy_ignore_errors = [ 'missing <li>' ] 
let g:indent_guides_auto_colors = 0

let g:airline_powerline_fonts = 1

let g:ycm_global_ycm_extra_conf                    = '~/.vim/ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files      = 1 " Let YCM read tags from Ctags file"
let g:ycm_use_ultisnips_completer                  = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax             = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments                     = 1 " Completion in comments
let g:ycm_complete_in_strings                      = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_insertion = 1

call submode#enter_with('splits', 'n', '', '<C-w>', '<Nop>')
call submode#map('splits',        'n', '', 'l',     '<C-w>l')
call submode#map('splits',        'n', '', 'h',     '<C-w>h')
call submode#map('splits',        'n', '', 'l',     '<C-w>l')
call submode#map('splits',        'n', '', 'h',     '<C-w>h')
call submode#map('splits',        'n', '', 'k',     '<C-w>k')
call submode#map('splits',        'n', '', 'j',     '<C-w>j')
call submode#map('splits',        'n', '', '+',     '<C-w>+')
call submode#map('splits',        'n', '', '-',     '<C-w>-')
call submode#map('splits',        'n', '', '<lt>',  '<C-w><lt>')
call submode#map('splits',        'n', '', '>',     '<C-w>>')

