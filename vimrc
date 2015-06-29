syntax on
filetype plugin indent on
call pathogen#infect()
set number
set showmatch
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4
set textwidth=79
set foldmethod=syntax
set formatoptions+=t
set colorcolumn=79
set scrolloff=4
set laststatus=2
let g:secure_modelines_allowed_items = [
	\ "textwidth",   "tw",
	\ "softtabstop", "sts",
	\ "tabstop",     "ts",
	\ "shiftwidth",  "sw",
	\ "expandtab",   "et",   "noexpandtab", "noet",
	\ "colorcolumn",
	\ "filetype",    "ft",
	\ "foldmethod",  "fdm",
	\ "readonly",    "ro",   "noreadonly", "noro",
	\ "rightleft",   "rl",   "norightleft", "norl",
	\ "cindent",     "cin",  "nocindent", "nocin",
	\ "smartindent", "si",   "nosmartindent", "nosi",
	\ "autoindent",  "ai",   "noautoindent", "noai",
	\ "spell",
	\ "spelllang"
	\ ]

set clipboard=unnamedplus

set t_Co=256
set background=dark
colorscheme solarized

autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufWritePost *.c :UpdateTypesFile
autocmd BufWritePost *.h :UpdateTypesFile


"Highlight words
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TRWTF', -1) | call matchadd('Todo', 'WTF', -1)
augroup END



nmap <F5> :SCCompile<CR>
nmap <F6> :SCCompileRun<CR>
nmap <F4> :set hlsearch!<CR>

vmap <Enter> <Plug>(EasyAlign)
    
"let g:syntastic_quiet_messages          = { "type" : "style" }
let g:syntastic_aggregate_errors        = 1
let g:syntastic_python_pylint_args      = "--disable=bad-whitespace --disable=W0141" 
let g:syntastic_html_tidy_ignore_errors = [ 'missing <li>' ] 
let g:indent_guides_auto_colors = 0

let g:airline_powerline_fonts = 1

let g:ycm_global_ycm_extra_conf                    = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf                       = 0
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

