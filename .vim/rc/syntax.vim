" syntax {{{
syntax on
autocmd! BufRead,BufNewFile *.htmlt set filetype=smarty

" PHP code fold
" let php_folding=1
" au Syntax php set fdm=syntax foldlevel=5
" au Syntax html set fdm=indent foldlevel=4
hi FoldColumn ctermfg=Black

autocmd! BufNewFile,BufRead *.php set ts=2 sw=2 expandtab
autocmd! BufNewFile,BufRead *.php5 set ts=2 sw=2 noexpandtab

" ruby code fold
" let ruby_folding=1
" au Syntax ruby set fdm=syntax foldlevel=3
" au Syntax eruby set fdm=indent foldlevel=3
" au Syntax html set fdm=indent foldlevel=3
" set foldlevel=3

autocmd! BufNewFile,BufRead *.html set ts=4 sw=4 fenc=utf-8 expandtab fdm=indent
autocmd! BufNewFile,BufRead *.erb set ts=2 sw=2 fenc=utf-8 expandtab fdm=indent
autocmd! BufNewFile,BufRead *.rb set ts=2 sw=2 fenc=utf-8 expandtab fdm=indent
autocmd! BufNewFile,BufRead *.js set ts=2 sw=2 fenc=utf-8 expandtab fdm=indent

autocmd! BufNewFile,BufRead *.scss set filetype=scss.css fdm=indent

autocmd! BufNewFile,BufRead *.tag set ft=javascript fdm=indent

" vim fold
let vim_folding=1
au Syntax vim set fdm=marker foldlevel=0

au Syntax sshconfig set fdm=marker foldlevel=0

"}}}
