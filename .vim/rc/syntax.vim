" syntax {{{

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if has('vim_starting')
  " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[6 q"
  " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[2 q"
  " 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"
endif

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"
endif

syntax enable
" Theme
set background=dark
" Example config in VimScript
" let g:tokyonight_style = "night"
colorscheme tokyonight

autocmd! BufRead,BufNewFile *.htmlt set filetype=smarty

" PHP code fold
" let php_folding=1
" au Syntax php set fdm=syntax foldlevel=5
" au Syntax html set fdm=indent foldlevel=4
" hi FoldColumn ctermfg=Black

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

autocmd! BufNewFile,BufRead *.mdx set ft=markdown.mdx fdm=indent

" vim fold
let vim_folding=1
au Syntax vim set fdm=marker foldlevel=0

au Syntax sshconfig set fdm=marker foldlevel=0

"}}}
