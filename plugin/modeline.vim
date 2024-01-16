" Add modeline after current line
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AddModeline()
  let l:modeline = printf(
\     " vim: set ts=%d sw=%d tw=%d sts=%d %set :",
\     &tabstop,
\     &shiftwidth,
\     &textwidth,
\     &softtabstop,
\     &expandtab ? '' : 'no'
\ )
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("."), l:modeline)
endfunction
" Use \ml to add the modeline
nnoremap <silent> <Leader>ml :call AddModeline()<CR>

let g:secure_modelines_allowed_items = [
\   "textwidth",   "tw"
\ , "softtabstop", "sts"
\ , "tabstop",     "ts"
\ , "shiftwidth",  "sw"
\ , "expandtab",   "et",  "noexpandtab",   "noet"
\ , "colorcolumn"
\ , "filetype",    "ft"
\ , "foldmethod",  "fdm"
\ , "readonly",    "ro",  "noreadonly",    "noro"
\ , "rightleft",   "rl",  "norightleft",   "norl"
\ , "cindent",     "cin", "nocindent",     "nocin"
\ , "smartindent", "si",  "nosmartindent", "nosi"
\ , "autoindent",  "ai",  "noautoindent",  "noai"
\ , "spell"
\ , "spelllang"
\]
