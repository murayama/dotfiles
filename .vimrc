set nocompatible
" set rtp+=$GOROOT/misc/vi
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/mattn/gom/misc/vim")
autocmd Filetype go SetGomEnv

" augroup init (from tyru's vimrc) {{{
augroup MyAutoCmd
  autocmd!
augroup END

augroup vimrc
  autocmd!
augroup END

command!
\ -bang -nargs=*
\ MyAutocmd
\ autocmd<bang> vimrc <args>


" if !has('gui_running') && $TMUX !=# ''
"   augroup Tmux
"     autocmd!
"     autocmd VimEnter,VimLeave * silent !tmux setw status
"   augroup END
" endif

"}}}

source ~/.vim/rc/encoding.vim
source ~/.vim/rc/dein.vim
source ~/.vim/rc/basic.vim
source ~/.vim/rc/syntax.vim
source ~/.vim/rc/map.vim
