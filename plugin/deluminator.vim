if executable('deluminator')
    let g:deluminator#themes = {
    \   "light": "solarized8_light"
    \ , "dark": "solarized8_dark"
    \}

    " Don't change colors unless we are on a 256 color terminal. This will prevent
    " messed up settings on virtual terminals
    if &term == "xterm-256color" || has("gui_running") || has("nvim")
        " Set colorscheme with deluminator
        execute deluminator#start()
    endif
endif
