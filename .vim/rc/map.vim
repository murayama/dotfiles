" map and command {{{

" バッファ移動 {{{
"map <F2> <ESC>:bp<CR>
"map <F3> <ESC>:bn<CR>
"map <F4> <ESC>:bw<CR>
"}}}

" diffsplit したときデフォルトでno wrapなので必要なら使う {{{
"map <F5> <ESC>:set wrap<CR>
" カレントファイルの文字コードを変更する
" map <F7>e <ESC>:set fileencoding=euc-jp<CR>
" map <F7>s <ESC>:set fileencoding=cp932<CR>
" map <F7>u <ESC>:set fileencoding=utf8<CR>
"}}}

" 指定文字コードで強制的にファイルを開く {{{
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932
"}}}

" 折り返し行関係なく上下移動する {{{
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk
"}}}

" 分割ウィンドウの移動 {{{
map <Right> <c-w>l
map <Left> <c-w>h
map <Up> <c-w>k
map <Down> <c-w>j
"}}}

" 分割ウィンドウのサイズ変更 {{{
map <kPlus> <c-w>+
map <kMinus> <c-w>-
map <kDivide> <c-w><
map <kMultiply> <c-w>>
"}}}

" good width {{{
nnoremap sh <C-w>h:call <SID>good_width()<Cr>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l:call <SID>good_width()<Cr>
nnoremap sH <C-w>H:call <SID>good_width()<Cr>
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L:call <SID>good_width()<Cr>
function! s:good_width()
  if winwidth(0) < 144
    vertical resize 144
  endif
endfunction
"}}}

" 行の最初に移動 {{{
" noremap 1 ^
" noremap <C-a> ^
inoremap <C-a> <home>
"}}}

" 行末に移動 {{{
" noremap 9 $
" noremap <C-e> $
inoremap <C-e> <end>
vnoremap $ $h
"}}}

" インサートモード中のカーソル操作 {{{
imap <c-h> <Left>
imap <c-j> <Down>
imap <c-k> <Up>
imap <c-l> <Right>
"}}}

"vimgrep(Vim7)
"au QuickfixCmdPost vimgrep cwin

" 上の行のインデントを見て勝手にあわせてくれる {{{
noremap p p=`]
noremap `= `[=`]
"}}}

" for, if, while などがある行にカーソルを置いて、これを実行すると、そのブロックを選択する。
"nnoremap vb /{<CR>%v%0

"map <CR> <c-w><CR>

" ctags
" map <c-]> <c-w>g<c-]>

"日時挿入
" imap <silent> <C-H> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" 保存時に行末のスペースを削除 {{{
" function! RTrim()
" 	let s:cursor = getpos(".")
" 	%s/\s\+$//e
" 	call setpos(".",s:cursor)
" endfunction

" autocmd BufWritePre * call RTrim()
"}}}

" jj kk でインサートモードを抜ける {{{
inoremap jj <Esc>
inoremap kk <Esc>
"}}}

" 検索後にジャンプした際に検索単語を画面中央に持ってくる {{{
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
"}}}

" vを二回で行末まで選択 {{{
vnoremap v $h
"}}}

" TABにて対応ペアにジャンプ {{{
nnoremap <Tab> %
vnoremap <Tab> %
"}}}

" w!! でスーパーユーザーとして保存（sudoが使える環境限定） {{{
cmap w!! w !sudo tee > /dev/null %
"}}}

" inoremap '' ''<left>
" inoremap "" ""<left>
" inoremap `` ``<left>
" inoremap } }<left>
" inoremap ] ]<left>
" inoremap ) )<left>
" inoremap > ><left>
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap [<Enter> []<Left><ESC><S-o>
" inoremap (<Enter> ()<Left><ESC><S-o>

" mark settings {{{
nnoremap [Mark] <Nop>
nmap m [Mark]

if !exists('g:markrement_char')
  let g:markrement_char = [
        \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
        \ ]
endif
nnoremap <silent>[Mark]m :<C-u>call <SID>AutoMarkrement()<CR>
function! s:AutoMarkrement()
  if !exists('b:markrement_pos')
    let b:markrement_pos = 0
  else
    let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
  endif
  execute 'mark' g:markrement_char[b:markrement_pos]
  echo 'marked' g:markrement_char[b:markrement_pos]
endfunction

nnoremap [Mark]n ]`
nnoremap [Mark]p [`

nnoremap [Mark]l :<C-u>marks<CR>
" }}}

" tab settinfs {{{
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

" }}}

"}}}
