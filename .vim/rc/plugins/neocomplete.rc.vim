" ---------------------------
" neocomplete.vim
"
" let g:neocomplete#disable_auto_complete = 0

" Use Smartcase
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#enable_camel_case = 1
" 
" let g:neocomplete#auto_complete_delay = 30
" 
" " Use fuzzy completion
" let g:neocomplete#enable_fuzzy_completion = 1
" 
" let g:neocomplete#auto_completion_start_length = 2
" let g:neocomplete#manual_completion_start_length = 0
" let g:neocomplete#min_keyword_length = 3
" let g:neocomplete#enable_auto_select = 1
" let g:neocomplete#enable_auto_delimiter = 1
" let g:neocomplete#max_list = 100
" let g:neocomplete#enable_cursor_hold_i = 0
" 
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
" 
" 
" let g:marching_enable_neocomplete = 1
" 
" let g:neocomplete#sources#omni#input_patterns.python =
"      \ '[^. *\t]\.\w*\|\h\w*'

" let g:neocomplete#sources#dictionary#dictionaries = {
"       \ 'default' : '',
"       \ 'vimshell' : $HOME.'/.vimshell_hist',
"       \ 'scheme' : $HOME.'/.gosh_completions'
"       \ }
"
" let g:neocomplete#disable_auto_select_buffer_name_pattern = 
"   \ '\[Command Line\]'
"


if !exists('g:neocomplete#delimiter_patterns')
  let g:neocomplete#delimiter_patterns= {}
endif
let g:neocomplete#delimiter_patterns.ruby = ['::']

if !exists('g:neocomplete#same_filetypes')
  let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.ruby = 'eruby'

" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
" "
" let g:neocomplete#enable_auto_close_preview = 1
" "
" let g:neocomplete#sources#omni#functions.go =
"       \ 'gocomplete#Complete'
"
" let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

" let g:neocomplete#sources#omni#input_patterns.lua =
"       \ '\w\+[.:]\|require\s*(\?["'']\w*'
"
" let g:neocomplete#ignore_source_files = []

" let g:neocomplete#sources#vim#complete_functions = {
"       \ 'Ref' : 'ref#complete',
"       \ 'Unite' : 'unite#complete_source',
"       \ 'VimShellExecute' :
"       \      'vimshell#vimshell_execute_complete',
"       \ 'VimShellInteractive' :
"       \      'vimshell#vimshell_execute_complete',
"       \ 'VimShellTerminal' :
"       \      'vimshell#vimshell_execute_complete',
"       \ 'VimShell' : 'vimshell#complete',
"       \ 'VimFiler' : 'vimfiler#complete',
"       \ 'Vinarise' : 'vinarise#complete',
"       \}
call neocomplete#custom#source('look', 'min_pattern_length', 4)
" call neocomplete#custom#source('_', 'sorters', [])
call neocomplete#custom#source('_', 'converters',
      \ ['converter_add_paren', 'converter_remove_overlap',
      \  'converter_delimiter', 'converter_abbr'])

if !exists('g:neocomplete#text_mode_filetypes')
    let g:neocomplete#text_mode_filetypes = {}
endif
let g:neocomplete#text_mode_filetypes = {
            \ 'rst': 1,
            \ 'markdown': 1,
            \ 'gitrebase': 1,
            \ 'gitcommit': 1,
            \ 'vcs-commit': 1,
            \ 'hybrid': 1,
            \ 'text': 1,
            \ 'help': 1,
            \ 'tex': 1,
            \ }

" mappings {{{
" <C-f>, <C-b>: page move.
" inoremap <expr><C-f>  pumvisible() ? "\<PageDown>" : "\<Right>"
" inoremap <expr><C-b>  pumvisible() ? "\<PageUp>"   : "\<Left>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr> <BS> neocomplete#smart_close_popup()."\<C-h>"
" <C-n>: neocomplete.
" inoremap <expr> <C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
" <C-p>: keyword completion.
" inoremap <expr> <C-p>  pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" inoremap <expr> '  pumvisible() ? "\<C-y>" : "'"
" inoremap <silent><expr> <C-x><C-f>
"      \ neocomplete#start_manual_complete('file')
" inoremap <silent><expr> <C-x><C-l>
"      \ neocomplete#start_manual_complete('look')
" 
" inoremap <expr> <C-g>     neocomplete#undo_completion()
" " inoremap <expr> <C-l>     neocomplete#mappings#refresh()
" inoremap <expr> <C-l>     neocomplete#mappings#complete_common_string()
" 
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"   " return neocomplete#smart_close_popup() . "\<CR>"
"   " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" endfunction
" 
" " <TAB>: completion.
" inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ neocomplete#start_manual_complete()
" function! s:check_back_space() abort "{{{
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}
" " <S-TAB>: completion back.
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" For cursor moving in insert mode(Not recommended)
" inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
" inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
" inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
" inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" }}}

" let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]
