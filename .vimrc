set nocompatible
set t_ut=

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

source ~/.vim/rc/dein.vim

syntax enable
filetype plugin indent on

source ~/.vim/rc/encoding.vim
source ~/.vim/rc/golang.vim
source ~/.vim/rc/basic.vim
source ~/.vim/rc/syntax.vim
source ~/.vim/rc/map.vim
