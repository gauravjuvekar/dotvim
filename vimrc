" Pathogen
let g:pathogen_disabled = ['gtk-vim-syntax']
syntax on
filetype plugin indent on
call pathogen#infect()
set number
set showmatch
set incsearch

" Alignments and indents
set autoindent
set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set textwidth=80
set colorcolumn=80

set foldmethod=syntax
set foldlevelstart=99

set formatoptions+=t

set scrolloff=4
set laststatus=2

set wildmode=longest,list,full
set wildmenu

"Indent to opening paren
set cindent
set cino+=(0,W1s,u0,U0

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12

"Strip trailing whitespaces on write
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call<SID>StripTrailingWhitespaces()

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

" Make shift tab work
exe 'set t_kB=' . nr2char(27) . '[Z'
" Set it to up so YCM can use it
imap <s-tab> <up>

set t_Co=256
set background=dark
colorscheme solarized

hi link DefinedName Macro
hi link EnumeratorName Type
hi link EnumerationValue Constant
hi link GlobalVariable Identifier


autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufNewFile,BufRead *.sqlite3 set filetype=sql
autocmd BufNewFile,BufRead *.h set filetype=c
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead SCon* set filetype=scons

autocmd BufWritePost *.c :UpdateTypesFile
autocmd BufWritePost *.h :UpdateTypesFile

"Highlight words
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TRWTF', -1) |
				\                        call matchadd('Todo', 'WTF', -1)
augroup END

" vim-pencil
augroup pencil
	autocmd!
	autocmd Filetype markdown,mkd call pencil#init({'wrap': 'soft'})
	autocmd Filetype text         call pencil#init({'wrap': 'soft'})
	autocmd Filetype mail         call pencil#init({'wrap': 'soft'})
augroup END


nnoremap <F4> :set hlsearch!<CR>
cnoreabbrev S Subvert
vmap <Enter> <Plug>(EasyAlign)


" Git gutter config
let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '*'
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed   = '#'


"let g:syntastic_quiet_messages     = { "type" : "style" }
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers    = ['flake8']
let g:syntastic_aggregate_errors   = 1
let g:syntastic_python_pylint_args = [
			\ "\--disable=bad-whitespace",
			\ "\--disable=invalid-name",
			\ "\--disable=superfluous-parens",
			\ "\--disable=missing-docstring",
			\ "\--disable=too-few-public-methods",
			\ "\--disable=too-many-ancestors",
			\ "\--disable=bad-continuation",
			\ "\--disable=no-init",
			\ "\--dummy-variables-rgx=_.*"
			\ ]
" let g:syntastic_python_flake8_args      = "--disable=W0141,E221"
let g:syntastic_html_tidy_ignore_errors = [ 'missing <li>' ]
let g:indent_guides_auto_colors = 0

let g:airline_powerline_fonts = 1

let g:ycm_register_as_syntastic_checker            = 1
let g:Show_diagnostics_ui                          = 1
let g:ycm_enable_diagnostic_signs                  = 1
let g:ycm_enable_diagnostic_highlighting           = 0
let g:ycm_always_populate_location_list            = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags                = 1 "default 1
let g:ycm_global_ycm_extra_conf                    = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf                       = 0
let g:ycm_collect_identifiers_from_tags_files      = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer                  = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax             = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments                     = 1 " Completion in comments
let g:ycm_complete_in_strings                      = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'

nnoremap <F2> :YcmCompleter FixIt<CR>
nnoremap <F3> :YcmCompleter GetDoc<CR>
nnoremap <F5> :YcmDiags<CR>
nnoremap <F6> :pclose<CR>

let g:NERDSpaceDelims = 1

let g:UltiSnipsExpandTrigger="<c-space>"

let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 2

call submode#enter_with('splits', 'n', '', '<C-w>', '<Nop>')
call submode#map('splits', 'n', '', 'l',    '<C-w>l')
call submode#map('splits', 'n', '', 'h',    '<C-w>h')
call submode#map('splits', 'n', '', 'k',    '<C-w>k')
call submode#map('splits', 'n', '', 'j',    '<C-w>j')
call submode#map('splits', 'n', '', 'L',    '<C-w>L')
call submode#map('splits', 'n', '', 'H',    '<C-w>H')
call submode#map('splits', 'n', '', 'K',    '<C-w>K')
call submode#map('splits', 'n', '', 'J',    '<C-w>J')
call submode#map('splits', 'n', '', '+',    '<C-w>+')
call submode#map('splits', 'n', '', '-',    '<C-w>-')
call submode#map('splits', 'n', '', '<lt>', '<C-w><lt>')
call submode#map('splits', 'n', '', '>',    '<C-w>>')

