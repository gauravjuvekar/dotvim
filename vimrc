set nocompatible

if has('python3')
    " Force loading python3 so that python2 isn't used depending on plugin load
    " order. The 'has('python3')' check itself will force load python3, no need
    " for the below 1 + 1
    "
    " py3 1 + 1
endif

if !has('nvim')
    set viminfo+=n~/.local/state/vim/viminfo
endif

let g:cachedir_config = {
\   'test': {
\       'global': 1
\   }
\}

lua require('rc_lsp')
lua require('rc_conform')

" Disable mouse as it prevents select->mouse buffer copy
set mouse=

syntax on
filetype plugin indent on

" Because we are too lazy to hit shift.
nnoremap ; :
vnoremap ; :

" Line numbering
set number
set relativenumber

" Search highlighting
set showmatch
set incsearch
" Keymap to toggle highlight
nnoremap <F4> :set hlsearch!<CR>

" Alignments and indents
" set autoindent
" set smarttab
" set softtabstop=4
" set tabstop=4
" set shiftwidth=4
set expandtab
set textwidth=80
set colorcolumn=80,100,120

au VimEnter * if &diff | execute 'windo set wrap' | endif

" Code folding
set foldmethod=syntax
set foldlevelstart=99


set formatoptions+=t


" Keep these many context lines visible above or below current line
set scrolloff=4

set laststatus=2


" Sets tab behavior for lists
set wildmode=longest,list,full
set wildmenu


" How should multiple backspaces behave
set backspace=indent,eol,start


"Ignore case while searching
set ignorecase

"Dont automatically change to project roo
let g:rooter_manual_only = 1
let g:rooter_patterns = ['Rakefile', '.git/', '.root']
set autochdir


set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13
" Required as underscores appear as space in gvim otherwise
set linespace=4


" Strip trailing whitespaces on write
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call<SID>StripTrailingWhitespaces()


" Global clip board as +
" Mouse buffer is *
set clipboard=unnamedplus

" https://superuser.com/a/321726/252728
" delete or visual paste without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap p "_dP
vnoremap <leader>p p

" Make shift tab work
exe 'set t_kB=' . nr2char(27) . '[Z'
" Set it to up so YCM can use it
imap <s-tab> <up>

" Use these colors instead of the defaults
hi link DefinedName Macro
hi link EnumeratorName Type
hi link EnumerationValue Constant
hi link GlobalVariable Identifier
hi link Variable Normal
hi link LocalVariable Normal


" Change some filetype for better syntax support
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufNewFile,BufRead *.sqlite3 set filetype=sql
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.mk set filetype=make
autocmd BufNewFile,BufRead SCon* set filetype=scons
autocmd BufNewFile,BufRead *.finn set filetype=c.doxygen


" Set sub-highlight to doxygen syntax for c sources and headers
let g:load_doxygen_syntax = 1
" augroup DoxygenizeCFiles
    " autocmd!
    " autocmd BufNewFile,BufRead *.h,*.c set filetype=c
" augroup END
hi link doxygenBrief doxygenBody
hi link doxygenSpecialOneLineDesc doxygenBody

" Force update types files (for syntax coloring)
augroup UpdateTypesFiles
    autocmd!
    autocmd BufWritePost *.h,*.c,*.cpp,*.cc,*.hh :UpdateTypesFile
augroup END


"Highlight words
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent!
\       call matchadd('Todo', 'TRWTF', -1) |
\       call matchadd('Todo', 'WTF',   -1) |
\       call matchadd('Todo', 'todo',  -1)
augroup END

" spellcheck
augroup spellcheck
    autocmd!
    autocmd Filetype markdown,mkd,text,mail set spell spelllang=en
augroup END

" word count
let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|rst|org|text'


" Use S for substitution with smart capitalization
cnoreabbrev S Subvert


" For alignments (like on = signs)
vmap <Enter> <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\   '\': {'pattern': '\\$', },
\}


" Git gutter config
let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '*'
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed   = '#'
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


"python indents
let g:pyindent_continue = '&sw'
let g:pyindent_open_paren = '&sw'

"let g:syntastic_quiet_messages     = { "type" : "style" }
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers    = ['flake8', 'pep8']
let g:syntastic_aggregate_errors   = 1
let g:syntastic_python_pylint_args = [
\   "\--disable=bad-whitespace"
\ , "\--disable=invalid-name"
\ , "\--disable=superfluous-parens"
\ , "\--disable=missing-docstring"
\ , "\--disable=too-few-public-methods"
\ , "\--disable=too-many-ancestors"
\ , "\--disable=bad-continuation"
\ , "\--disable=no-init"
\ , "\--dummy-variables-rgx=_.*"
\]
let g:syntastic_python_flake8_args      = "--disable=W0141,E221,E731"
let g:syntastic_html_tidy_ignore_errors = [ 'missing <li>' ]
let g:indent_guides_auto_colors = 0


let g:airline_powerline_fonts = 1


let g:ycm_register_as_syntastic_checker            = 1
let g:Show_diagnostics_ui                          = 1
let g:ycm_enable_diagnostic_signs                  = 1
let g:ycm_enable_diagnostic_highlighting           = 1
let g:ycm_always_populate_location_list            = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags                = 1 "default 1
let g:ycm_global_ycm_extra_conf                    = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf                       = 0
let g:ycm_collect_identifiers_from_tags_files      = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer                  = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax             = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments                     = 1 " Completion in comments
let g:ycm_complete_in_strings                      = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
" let g:ycm_key_list_select_completion = ['<tab>', '<C-j>', '<Down>', '<C-n>']
" let g:ycm_key_list_previous_completion = ['<s-tab>', '<C-k>', '<Up>', '<C-p>']
let g:ycm_python_binary_path = exepath("python3")
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_uses_ycmd_caching = 1
let g:ycm_auto_hover = ''

nnoremap <F2> :YcmCompleter FixIt<CR>
nnoremap <F3> :YcmCompleter GetDoc<CR>
nnoremap <F5> :YcmDiags<CR>
" Close the preview window or tags list. Use :ccl for the tags list also
nnoremap <F6> :pclose<CR>:lclose<CR>
nnoremap <F7> :ptag<CR>
nmap <S-k> <Plug>(YCMHover)


let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1


" let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
nnoremap <leader>ue :UltiSnipsEdit<cr>


" CtrlP stuff
let g:ctrlp_extensions = ['undo', 'changes', 'tag', 'buffertag', 'mixed']
let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_root_markers = ['.root', '.gitignore', '.git/', '.p4ignore']
let g:ctrlp_root_markers = ['.root', '.git/', '.p4ignore']
nnoremap <c-i> :CtrlPTag<CR>
" Now use C-u for going forward in the jumplist
nnoremap <C-u> <C-i>


let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 2

" Don't flash cursor when opening file:line[:col]
let g:file_line_crosshairs=0

" Autoinsert current time with tnow
iab tnow <c-r>=strftime("%FT%T%z")<cr>

" vim-easymotion
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-overwin-f)

" large file support
let g:hugefile_trigger_size = 256 "MB

let g:localvimrc_name = [".vimrc"]
let g:localvimrc_persistent = 2
let g:localvimrc_sandbox=1

"" Disable in favor of YCM + clangd LSP
let g:GtagsCscope_Quiet = 1
"let g:gutentags_enabled = 0
"let g:gutentags_trace = 0
"" let g:gutentags_modules = ['ctags', 'gtags_cscope']
"let g:gutentags_modules = ['gtags_cscope']
"let g:gutentags_project_root = ['.root']
"let g:gutentags_ctags_extra_args = ['--fields=+l']
"let g:gutentags_cache_dir = expand('~/.cache/vim/tags')
"let g:gutentags_define_advanced_commands = 1
"let g:gutentags_auto_add_gtags_cscope = 1
"let g:gutentags_plus_nomap = 1
"let g:gutentags_plus_switch = 1

" noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
" noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
" noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
" noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
" noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
" noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
" noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>


" clang-rename
" let g:clang_rename_path = "/usr/share/clang/clang-rename.py"
" noremap <leader>r :py3f /usr/share/clang/clang-rename.py<cr>

set title titlestring=

" Remove the annoying bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1


let g:cmake_export_compile_commands = 1
let g:cmake_ycm_symlinks = 1

if executable('ag')
    let g:ackprg='ag --vimgrep'
endif

let g:indent_guides_auto_colors=1

let g:tex_flavor='latex'

" Don't use non-ASCII7 symbols for puml previews
let g:slumlord_asciiart_utf=0

" Load all packages, so that we can use their defined functions in the rest of
" the config below.
packloadall


" Use \w, etc to go to the next camel word
call camelcasemotion#CreateMotionMappings('<leader>')

" 3 way merge commands
nnoremap ml :diffget LOCAL<cr>
nnoremap mb :diffget BASE<cr>
nnoremap mr :diffget REMOTE<cr>
