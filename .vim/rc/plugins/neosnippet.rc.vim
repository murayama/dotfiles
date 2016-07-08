 " Plugin key-mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)

 " SuperTab like snippets behavior.
 imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"

 " For snippet_complete marker.
 if has('conceal')
   set conceallevel=2 concealcursor=i
 endif


 let g:neosnippet#snippets_directory='~/.vim/snippets'

 " autocmd BufEnter * if exists("b:rails_root") && !(expand("%") =~ "\.erb$") | NeoComplCacheSetFileType ruby.rails | endif
 " autocmd BufEnter * if (expand("%") =~ "_spec\.rb$") || (expand("%") =~ "^spec.*\.rb$") | NeoComplCacheSetFileType ruby.rspec | endif

 " ========================
 " neocomplcache-snippets-complete
 " ========================
 " let g:neocomplcache_snippets_dir = '~/.vim/snippets'

 " imap <TAB> <Plug>(neocomplcache_snippets_expand)
 " smap <TAB> <Plug>(neocomplcache_snippets_expand)

 " For snippet_complete marker.
 " if has('conceal')
 "   set conceallevel=2 concealcursor=i
 " endif
"endfunction

