lua require("gutter")
lua require("config.lazy")

colorscheme carbonfox

if has('python3')
    " Force loading python3 so that python2 isn't used depending on plugin load
    " order. The 'has('python3')' check itself will force load python3, no need
    " for the below 1 + 1
    "
    " py3 1 + 1
endif

" COQ fails on nixos if bundled nvim-python3 version is used
" let g:python3_host_prog = exepath('python3')

if !has('nvim')
    set viminfo+=n~/.local/state/vim/viminfo
endif

let g:cachedir_config = {
\   'test': {
\       'global': 1
\   }
\}

" Disable mouse as it prevents select->mouse buffer copy
set mouse=

syntax on
filetype plugin indent on

" Because we are too lazy to hit shift.
nnoremap ; :
vnoremap ; :

" Alignments and indents
" set autoindent
" set smarttab
" set softtabstop=4
" set tabstop=4
" set shiftwidth=4
set expandtab
set textwidth=80
set colorcolumn=80,100,120

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

"Dont automatically change to project roo
let g:rooter_manual_only = 1
let g:rooter_patterns = ['Rakefile', '.git/', '.root']
set autochdir


set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13
" Required as underscores appear as space in gvim otherwise
set linespace=4


" Make shift tab work
exe 'set t_kB=' . nr2char(27) . '[Z'
" Set it to up so completion lists can use it
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


let g:indent_guides_auto_colors = 0


" Close the preview window or tags list. Use :ccl for the tags list also
nnoremap <F6> :pclose<CR>:lclose<CR>
nnoremap <F7> :ptag<CR>


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

" large file support
let g:hugefile_trigger_size = 256 "MB

let g:localvimrc_name = [".vimrc"]
let g:localvimrc_persistent = 2
let g:localvimrc_sandbox=1

set title titlestring=

" Remove the annoying bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


let g:cmake_export_compile_commands = 1

let g:indent_guides_auto_colors=1

let g:tex_flavor='latex'
