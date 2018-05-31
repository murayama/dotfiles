" golang {{{
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/mattn/gom/misc/vim")
" autocmd Filetype go SetGomEnv
set path+=$GOPATH/src/**

let g:gofmt_command = 'goimports'
" let g:go_highlight_structs = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au BufWritePre *.go Fmt
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 "completeopt=menu,preview
au FileType go compiler go
" }}}
