" Configure submodes so as to not press ctrl + W for every split adjustment
call submode#enter_with('window', 'n', '', '<C-w>')
call submode#leave_with('window', 'n', '', '<ESC>')
for key in ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        \   'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    call submode#map('window', 'n', '', key, '<C-w>' . key)
    call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
    call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-' . key . '>')
    call submode#map('window', 'n', '', '<C-' . toupper(key) . '>', '<C-w>' . '<C-' . toupper(key) . '>')
endfor
for key in ['=', '_', '+', '-', '<', '>', '{', '}', '[', ']']
    call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor
