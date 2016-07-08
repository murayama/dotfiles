set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
 \ 'mode' : 'active',
 \ 'active_filetypes' : [],
 \ 'passive_filetypes' : ['html','php','ruby']
 \}
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
let g:syntastic_scss_sass_quiet_messages = 
    \ {'regex': '\vUndefined (mixin|variable)|File to import not found or unreadable'}
    " \ {'regex': 'File to import not found or unreadable'}
    " \ {'regex': 'Undefined \(mixin\|variable\)'}
" let g:syntastic_phpcs_disable = 1
