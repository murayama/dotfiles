set nocompatible

"------------------------------
" auto encoding
"------------------------------
set encoding=utf-8    " デフォルトエンコーディング
set fileencodings=ucs_bom,utf8,ucs-2le,ucs-2
set ffs=unix,dos,mac  " 改行文字
"文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = s:fileencodings_default .','. &fileencodings
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" set encoding=utf-8
"set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
" 改行コードの自動認識
" set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/.bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'


if &encoding ==# 'utf-8'
  NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \    'windows': 'make -f make_mingw32.mak',
        \    'cygwin': 'make -f make_cygwin.mak',
        \    'mac': 'make -f make_mac.mak',
        \    'unix': 'make -f make_unix.mak',
        \   },
        \ }
endif

" colorscheme
NeoBundle 'jellybeans.vim'
"NeoBundle 'railscasts'
NeoBundle 'desert256.vim'
"NeoBundle 'leo256'
" Bundle 'Railscasts-Theme-GUIand256color'
NeoBundle 'molokai'
"NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
"NeoBundle 'vim-scripts/tir_black'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'itchyny/landscape.vim'
NeoBundle '29decibel/codeschool-vim-theme'

" ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'ruby-matchit'
NeoBundle 'taichouchou2/vim-rsense'
NeoBundle 'skwp/vim-rspec'
NeoBundle 'romanvbabenko/rails.vim'

NeoBundle 'thinca/vim-ref.git'
NeoBundle 'taichouchou2/vim-ref-ri'

NeoBundle 'neocomplcache'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'ujihisa/neco-look'

" NeoBundle 'YankRing.vim'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'matchit.zip'
NeoBundle 'thinca/vim-quickrun'
" NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'sudo.vim'
" NeoBundle 'AutoClose'
NeoBundle 'camelcasemotion'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tComment'
NeoBundle 'tpope/vim-markdown'

NeoBundle 't9md/vim-textmanip'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'osyo-manga/vim-over'

" text object
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kana/vim-textobj-line'
NeoBundle "kana/vim-textobj-function"
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'kana/vim-textobj-entire'

NeoBundle 'rking/ag.vim'

NeoBundle 'itchyny/lightline.vim'

NeoBundle 'mhinz/vim-startify'

NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'AndrewRadev/switch.vim'

" unite
NeoBundle 'basyura/unite-rails'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'sgur/unite-qf'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'ujihisa/unite-rake'

NeoBundleLazy 'Shougo/unite.vim', {
      \   'autoload': {
      \     'commands': ["Unite", "UniteWithBufferDir", "UniteWithCurrentDir"]
      \   }
      \ }

NeoBundleLazy 'Shougo/neosnippet'

if has('lua')
  NeoBundleLazy 'Shougo/neocomplete', {
        \ 'depends': ['Shougo/neosnippet', 'Shougo/context_filetype.vim'],
        \  'vim_version': '7.3.885',
        \  'autoload': {
        \     'insert': 1,
        \   }
        \ }
else
  NeoBundleLazy 'Shougo/neocomplcache', {
        \   'depends': ["Shougo/neosnippet"],
        \   'autoload': {
        \     'insert': 1,
        \   }
        \ }
endif

NeoBundleLazy 'Shougo/vimfiler.git', {
      \   'depends': ["Shougo/unite.vim"],
      \   'autoload': {
      \     'commands': ["VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir"],
      \     'mappings': ["<Plug>(vimfiler_switch)"],
      \     'explorer': 1,
      \   }
      \ }

NeoBundleLazy 'Shougo/vimshell.git', {
      \ 'depends' : 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands' : [{ 'name' : 'VimShell',
      \                   'complete' : 'customlist,vimshell#complete'},
      \                 'VimShellExecute', 'VimShellInteractive',
      \                 'VimShellTerminal', 'VimShellPop'],
      \   'mappings' : ['<Plug>(vimshell_switch)']
      \ }}

NeoBundleLazy 'sjl/gundo.vim', {
      \   'autoload' : {
      \       'commands' : [ "GundoShow", "GundoToggle" ]
      \   }
      \}

NeoBundle 'thinca/vim-qfreplace.git'

" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gitv'
NeoBundle 'extradite.vim'
NeoBundle 'git-commit'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/open-browser-github.vim'


" javascript
" NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jQuery'
NeoBundle 'kchmck/vim-coffee-script.git'

" php
" NeoBundle 'https://github.com/beyondwords/vim-twig.git'
" NeoBundle 'shawncplus/php.vim'

" html css
NeoBundle 'mattn/emmet-vim'
NeoBundle 'html5.vim'
NeoBundle 'https://github.com/hail2u/vim-css3-syntax.git'


syntax enable
filetype plugin indent on

NeoBundleCheck

" augroup init (from tyru's vimrc)
augroup vimrc
  autocmd!
augroup END

command!
\ -bang -nargs=*
\ MyAutocmd
\ autocmd<bang> vimrc <args>


" Basic Settings {{{
set backspace=indent,eol,start				" 全て Backspace で削除可能にする
set nocompatible			" viに互換しない
"set fffs=unix				" 改行コードをFLにする(default: unix,dis)
set noinsertmode			" デフォルトモードをインサートにしない
set wrap				" 行の端まで到達したら折り返す
set nolinebreak				" ホワイト・スペースで折り返さない
set formatoptions=q			" gq コマンド以外では自動改行しない
set smartindent				" オートインデント
set noerrorbells			" エラー時にベルを鳴らさない
set novisualbell			" ヴィジュアルベルを使わない
set cmdheight=1				" コマンドラインの高さ
set shortmess=t				" 'Press RETURN or enter command to continue' を表示しない
set history=50				" 記憶するコマンド数
set number				" 行番号を表示
" set relativenumber " 相対行を表示
set showmode				"
set wildmenu				" コマンド入力中の補完候補をステータスラインに表示
set wildmode=longest,list,full
set wildignore=*.o,*.so		" 補完候補から除外するファイル

" タブストップ
set tabstop=2				" タブ幅
set shiftwidth=2			" インデント幅
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set smarttab
set expandtab
"set noexpandtab				" オートインデント時に挿入タブをスペースに変換しない

"set infercase           " 補完時に大文字小文字を区別しない
"set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set ruler				" ルーラーを表示
set showcmd				" 実行したコマンドを表示
set showmatch				" 対応する括弧に一時的に移動
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
"set title				" タイトルを表示
set laststatus=2			" 常にステータス行を表示
set ignorecase				" 大文字・小文字を無視
set smartcase				" 検索キーワードに大文字が含まれていれば大文字小文字を区別
set incsearch	" サーチをインクリメンタルにする
set hlsearch				" 検索キーワードをハイライトする
set wrapscan				" ファイルの最後に来たら最初から検索
set magic				" 正規表現使用時に magic モードにする
set list				" タブや改行などを別の文字に区別する
" set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
if !has('multi_byte')
  set listchars=tab:^I,extends:>,precedes:<,nbsp:%
else
  try
    set listchars=tab:▸\ ,extends:»,precedes:«,nbsp:%
  catch
    set listchars=tab:^I,extends:>,precedes:<,nbsp:%
    let g:vimfiler_tree_leaf_icon = '|'
    let g:vimfiler_tree_opened_icon = '-'
    let g:vimfiler_tree_closed_icon = '+'
  endtry
endif

"set listchars=tab:-\ ,extends:<	" タブや改行などの代替文字設定(ex. tab:>-,extends:<.trail:-,eol:< )
set textwidth=0         " 自動的に改行が入るのを無効化
set keywordprg=man\ -a			" キーワードのヘルプコマンドの設定(default: man or man\ -s)
"set lazyredraw				" マクロ実行中は画面を更新しない
" set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{fugitive#statusline()}%=%b\ 0x%B\ \ %l,%c%V%8P
	" ステータス行のフォーマット
"set cursorline				" カーソル行に下線を表示(* vim7)
set cursorcolumn			" カーソル列をハイライト表示(* vim7)
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'


set modifiable
set t_Co=256

set directory=~/tmp/

set mouse=a
set ttymouse=xterm2

" auto write
" set autowrite
" set updatetime=500
" 
" function  s:AutoWriteIfPossible()
"   if !&readonly && bufname('%') !=# ''
"     w
"   endif
" endfunction
" 
" autocmd CursorHold * call s:AutoWriteIfPossible()
" autocmd CursorHoldI * call s:AutoWriteIfPossible()
" }}}

"------------------------------
" syntax
"------------------------------

syntax on
autocmd! BufRead,BufNewFile *.htmlt set filetype=smarty

" colorscheme molokai
colorscheme hybrid
" colorscheme jellybeans
" hi Normal ctermbg=none

" PHP code fold
let php_folding=1
au Syntax php set fdm=syntax
au Syntax html set fdm=indent
set foldlevel=5

autocmd! BufNewFile,BufRead *.php set ts=2 sw=2 expandtab
autocmd! BufNewFile,BufRead *.php5 set ts=2 sw=2 noexpandtab

" ruby code fold
let ruby_folding=1
au Syntax ruby set fdm=syntax
au Syntax eruby set fdm=indent
au Syntax html set fdm=indent
set foldlevel=3

autocmd! BufNewFile,BufRead *.rb set ts=2 sw=2 fenc=utf-8 expandtab
autocmd! BufNewFile,BufRead *.js set ts=2 sw=2 fenc=utf-8 expandtab


" バッファ移動
"map <F2> <ESC>:bp<CR>
"map <F3> <ESC>:bn<CR>
"map <F4> <ESC>:bw<CR>
" diffsplit したときデフォルトでno wrapなので必要なら使う
"map <F5> <ESC>:set wrap<CR>
" カレントファイルの文字コードを変更する
" map <F7>e <ESC>:set fileencoding=euc-jp<CR>
" map <F7>s <ESC>:set fileencoding=cp932<CR>
" map <F7>u <ESC>:set fileencoding=utf8<CR>

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932


" 折り返し行関係なく上下移動する
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk


" 分割ウィンドウの移動
map <Right> <c-w>l
map <Left> <c-w>h
map <Up> <c-w>k
map <Down> <c-w>j
" 分割ウィンドウのサイズ変更
map <kPlus> <c-w>+
map <kMinus> <c-w>-
map <kDivide> <c-w><
map <kMultiply> <c-w>>

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


" 行の最初に移動
" noremap 1 ^
noremap <C-a> ^
inoremap <C-a> <home>
" 行末に移動
" noremap 9 $
noremap <C-e> $
inoremap <C-e> <end>

" Enterでインサートモードにならずに改行
" noremap <CR> o<ESC>

imap <c-h> <Left>
imap <c-j> <Down>
imap <c-k> <Up>
imap <c-l> <Right>

"vimgrep(Vim7)
"au QuickfixCmdPost vimgrep cwin

" 上の行のインデントを見て勝手にあわせてくれる
noremap p p=`]
noremap == `[=`]

" for, if, while などがある行にカーソルを置いて、これを実行すると、そのブロックを選択する。
"nnoremap vb /{<CR>%v%0

"map <CR> <c-w><CR>

" ctags
" map <c-]> <c-w>g<c-]>

"日時挿入
" imap <silent> <C-H> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" 保存時に行末のスペースを削除
function! RTrim()
	let s:cursor = getpos(".")
	%s/\s\+$//e
	call setpos(".",s:cursor)
endfunction

" autocmd BufWritePre * call RTrim()

inoremap jj <Esc>
inoremap kk <Esc>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" inoremap '' ''<left>
" inoremap "" ""<left>
" inoremap `` ``<left>
" inoremap } }<left>
" inoremap ] ]<left>
" inoremap ) )<left>
" inoremap > ><left>
"------------------------------
" ========================
" plug-ins
" ========================
"------------------------------

" ========================
" vim-lightline
" ========================
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'mode_map': {'c': 'NORMAL'},
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['fugitive', 'gitgutter', 'filename'],
      \     ],
      \     'right': [
      \       ['lineinfo', 'syntastic'],
      \       ['percent'],
      \       ['charcode', 'fileformat', 'fileencoding', 'filetype'],
      \     ]
      \   },
      \   'component_function': {
      \     'modified': 'MyModified',
      \     'readonly': 'MyReadonly',
      \     'fugitive': 'MyFugitive',
      \     'filename': 'MyFilename',
      \     'fileformat': 'MyFileformat',
      \     'filetype': 'MyFiletype',
      \     'fileencoding': 'MyFileencoding',
      \     'mode': 'MyMode',
      \     'syntastic': 'SyntasticStatuslineFlag',
      \     'charcode': 'MyCharCode',
      \     'gitgutter': 'MyGitGutter',
      \   },
      \   'separator': {'left': '⮀', 'right': '⮂'},
      \   'subseparator': {'left': '⮁', 'right': '⮃'},
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction


" ========================
" Zen-Coding setting
" ========================
"let g:user_zen_expandabbr_key='<c-e>'
"let g:use_zen_complete_tag = 1


" ========================
" vim-ruby
" ========================
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" ========================
" vim-rails.vim
" ========================
"有効化
let g:rails_some_option = 1
let g:rails_level = 4
let g:rails_syntax = 1
let g:rails_statusline = 1
" let g:rails_url='http://localhost:3000'
let g:rails_subversion=0
" let g:dbext_default_SQLITE_bin = 'mysql2'
let g:rails_default_file='config/database.yml'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nmap <buffer><C-C> <Nop>
  imap <buffer><C-C> <Nop>
  map <buffer><C-_><C-C> <Nop>

  nmap <buffer><Space>r :R<CR>
  nmap <buffer><Space>a :A<CR>
  nmap <buffer><Space>m :Rmodel<Space>
  nmap <buffer><Space>c :Rcontroller<Space>
  nmap <buffer><Space>v :Rview<Space>
  nmap <buffer><Space>s :Rspec<Space>
  nmap <buffer><Space>m :Rgen model<Space>
  nmap <buffer><Space>c :Rgen contoller<Space>
  nmap <buffer><Space>s :Rgen scaffold<Space>
  nmap <buffer><Space>p :Rpreview<CR>
  " au FileType ruby,eruby,ruby.rspec let g:neocomplcache_dictionary_filetype_lists = {
  "       \'ruby' : $HOME.'/.vim/dict/rails.dict',
  "       \'eruby' : $HOME.'/.vim/dict/rails.dict'
  "       \}
  " setl dict+=~/.vim/dict/rails.dict
  " setl dict+=~/.vim/dict/ruby.dict
endfunction
autocmd User Rails call SetUpRailsSetting()


" ========================
" rsense
" ========================
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = expand('~/.vim/ref/rsense-0.3')

" function! SetUpRubySetting()
"   setlocal completefunc=RSenseCompleteFunction
"   " nmap <buffer>tj :RSenseJumpToDefinition<CR>
"   " nmap <buffer>tk :RSenseWhereIs<CR>
"   " nmap <buffer>td :RSenseTypeHelp<CR>
" endfunction
" autocmd FileType ruby,eruby,ruby.rspec call SetUpRubySetting()

" ========================
" tcomment
" ========================
" tcommentで使用する形式を追加
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
      \'php_surround' : "<?php %s ?>",
      \'eruby_surround' : "<%% %s %%>",
      \'eruby_surround_minus' : "<%% %s -%%>",
      \'eruby_surround_equality' : "<%%= %s %%>",
\}

" マッピングを追加
function! SetErubyMapping2()
  nmap <buffer> <C-_>c :TCommentAs eruby_surround<CR>
  nmap <buffer> <C-_>- :TCommentAs eruby_surround_minus<CR>
  nmap <buffer> <C-_>= :TCommentAs eruby_surround_equality<CR>

  vmap <buffer> <C-_>c :TCommentAs eruby_surround<CR>
  vmap <buffer> <C-_>- :TCommentAs eruby_surround_minus<CR>
  vmap <buffer> <C-_>= :TCommentAs eruby_surround_equality<CR>
endfunction

" erubyのときだけ設定を追加
au FileType eruby call SetErubyMapping2()
" phpのときだけ設定を追加
au FileType php nmap <buffer><C-_>c :TCommentAs php_surround<CR>
au FileType php vmap <buffer><C-_>c :TCommentAs php_surround<CR>


" if has('lua') && v:version > 703 && has('patch825')
if has('lua') "&& v:version > 703 && has('patch825')
    let s:hooks = neobundle#get_hooks("neocomplete.vim")
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplet#enable_smart_case = 1
        " NeoCompleteを有効化
        NeoCompleteEnable
    endfunction
else
    let s:hooks = neobundle#get_hooks("neocomplcache.vim")
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_smart_case = 1
        " NeoComplCacheを有効化
        NeoComplCacheEnable
    endfunction
  " ========================
  " neocomplcache
  " ========================
  " 補完ウィンドウの設定
  set completeopt=menuone
  " NeoComplCacheを有効にする
  " let g:neocomplcache_enable_at_startup = 1
  " 表示候補の数
  let g:neocomplcache_max_list = 20
  " 自動補完を行う入力数
  let g:neocomplcache_auto_completion_start_length = 2
  " 手動補完時に補完を行う入力数を制御
  let g:neocomplcache_manual_completion_start_length = 3
  "バッファや辞書ファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
  let g:neocomplcache_min_keyword_length = 4
  "1:補完候補検索時に大文字・小文字を無視する
  let g:neocomplcache_enable_ignore_case = 1
  " smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
  let g:neocomplcache_enable_smart_case = 1
  " camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
  let g:neocomplcache_enable_camel_case_completion = 0
  " _(アンダーバー)区切りの補完を有効化
  let g:neocomplcache_enable_underbar_completion = 0
  " シンタックスをキャッシュするときの最小文字長を3に
  let g:neocomplcache_min_syntax_length = 3
  " neocomplcacheを自動的にロックするバッファ名のパターン
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
  " -入力による候補番号の表示
  " let g:neocomplcache_enable_quick_match = 1
  " 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
  let g:neocomplcache_enable_auto_select = 0
  " プラグイン毎の補完関数を呼び出す文字数
  let g:NeoComplCache_PluginCompletionLength = {
    \ 'keyword_complete'  : 3,
    \ 'syntax_complete'   : 3
    \ }

  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
    \}

  let g:neocomplcache_text_mode_filetypes = {
        \ 'md' : 1,
        \ 'markdown' : 1
        \}

  if !exists('g:neocomplcache_quick_match_patterns')
      let g:neocomplcache_quick_match_patterns = {}
  endif
  let g:neocomplcache_quick_match_patterns['default'] = '\`'

  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns = {}
  endif
  let g:neocomplcache_delimiter_patterns['php'] = ['->', '::', '\']


  " FileType毎のOmni補完を設定
  " autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  " autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  " autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  " autocmd FileType c set omnifunc=ccomplete#Complete
  " autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  " rubyの設定
  if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
  endif
  let g:neocomplcache_omni_functions.ruby = 'RSenseCompleteFunction'

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  " let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  " let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

  " Plugin key-mappings.
  " imap <C-k>     <Plug>(neocomplcache_snippets_expand)
  " smap <C-k>     <Plug>(neocomplcache_snippets_expand)

  inoremap <expr><C-g> neocomplcache#undo_completion()
  " inoremap <expr><C-l> neocomplcache#complete_common_string()

  imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  " inoremap <expr><CR> neocomplcache#close_popup()."\<CR>"
  " <C-h>, <BS>: close popup and delete backword char.
  " inoremap <expr><c-h> neocomplcache#smart_close_popup()."\<c-h>"
  " inoremap <expr><bs> neocomplcache#smart_close_popup()."\<c-h>"

  inoremap <expr><C-y> neocomplcache#close_popup()
  inoremap <expr><C-d> neocomplcache#cancel_popup()

endif


" =======================
" neosnippet
" =======================
let g:neosnippet#snippets_directory='~/.vim/snippets'

" Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)

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

autocmd BufEnter * if exists("b:rails_root") && !(expand("%") =~ "\.erb$") | NeoComplCacheSetFileType ruby.rails | endif
autocmd BufEnter * if (expand("%") =~ "_spec\.rb$") || (expand("%") =~ "^spec.*\.rb$") | NeoComplCacheSetFileType ruby.rspec | endif

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



" gitv
nnoremap <silent> <Leader>gh :<C-u>Gitv<CR>
" autocmd FileType gitv call s:my_gitv_settings()
" 
" function! s:my_gitv_settings()
"   setlocal iskeyword+=/,-,.
"   nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
"   nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
"   nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
"   nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
"   nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
"   nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
" endfunction
" 
" function! s:gitv_get_current_hash()
"     return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
" endfunction
" 
" autocmd FileType git setlocal nofoldenable foldlevel=0
" function! s:toggle_git_folding()
"   if &filetype ==# 'git'
"     setlocal foldenable!
"   endif
" endfunction

"------------------------------------
" fugitive
"------------------------------------
nnoremap <silent> <Leader>gd :<C-u>Gdiff<CR>
nnoremap <silent> <Leader>gD :<C-u>Gdiff HEAD<CR>
nnoremap <silent> <Leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <Leader>ga :<C-u>Gwrite<CR>
nnoremap <silent> <Leader>gc :<C-u>Gcommit<CR>
nnoremap <silent> <Leader>gb :<C-u>Gblame<CR>
nnoremap <silent> <Leader>gl :<C-u>Glog<CR>
" extradite
nnoremap <silent> <Leader>ge :<C-u>Extradite<CR>

"------------------------------------
" Unite
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" let g:unite_enable_split_vertically = 1 "縦分割で開く
" let g:unite_winwidth = 40 "横幅40で開く
let g:unite_split_rule='botright'

let g:unite_source_rec_max_cache_files = 5000
" let g:unite_source_rec_min_cache_files = 1

call unite#custom#source('file_rec/async', 'ignore_pattern', '\(png\|gif\|jpeg\|jpg\|.git\)$')
let g:unite_source_history_yank_enable = 1

" Use ag in unite grep source
if executable('ag')
  let g:unite_source_grep_command       = 'ag'
  let g:unite_source_grep_default_opts  = '--nocolor --nogroup --hidden'
        \ . " --ignore='*.vimsessions*'"
        \ . " --ignore='*.idea*'"
        \ . " --ignore='.zeus.sock'"
  let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_source_buffer_time_format = ''


" タブ一覧
nnoremap <silent> <Leader>t :<C-u>Unite tab<CR>
" バッファ一覧
nnoremap <silent> <Leader>. :<C-u>Unite -quick-match buffer<CR>
" ファイル一覧
nnoremap <silent> <Leader>u :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Leader>f :<C-u>Unite -buffer-name=files file<CR>
" ブックマーク一覧
nnoremap <silent> <Leader>b :<C-u>Unite bookmark<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Leader>r :<C-u>Unite file_mru<CR>
" レジスタ一覧
" nnoremap <silent> <Leader>y :<C-u>Unite -buffer-name=register register<CR>
" nnoremap <silent> <Leader>y :<C-u>Unite history/yank<CR>
nnoremap <silent> <Leader>y :<C-u>Unite yankround<CR>
" 全部乗せ
nnoremap <silent> <Leader>a :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
" ブックマークに追加
" nnoremap <silent> <Leader>ua :<C-u>UniteBookmarkAdd<CR>
" アウトライン
nnoremap <silent> <Leader>o :<C-u>Unite outline<CR>
nnoremap <silent> <Leader>O :<C-u>Unite -no-quit outline<CR>
" マーク一覧
nnoremap <silent> <Leader>m :<C-u>Unite mark<CR>
" ライン
nnoremap <silent> <Leader>/ :<C-u>Unite line<CR>
nnoremap <silent> <Leader>? :<C-u>Unite -no-quit line<CR>
" quickfix
nnoremap <silent> <Leader>qf :<C-u>Unite -no-quit qf<CR>
" grep
nnoremap <silent> <Leader>gr :<C-u>Unite grep:.<CR>
nnoremap <silent> <Leader>GR :<C-u>Unite -no-quit grep:.<CR>
" vimgrep
nnoremap <silent> <Leader>vgr :<C-u>Unite vimgrep<CR>
nnoremap <silent> <Leader>VGR :<C-u>Unite -no-quit vimgrep<CR>

" like ctrlp
" nnoremap <silent> <Leader>p :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<cr>
nnoremap <silent> <Leader>p :<C-u>Unite -start-insert file_rec/async:!<cr>

" rails controller
nnoremap <silent> <Leader>rc :<C-u>Unite rails/controller<CR>
" rails helper
nnoremap <silent> <Leader>rh :<C-u>Unite rails/helper<CR>
" rails model
nnoremap <silent> <Leader>rm :<C-u>Unite rails/model<CR>
" rails view
nnoremap <silent> <Leader>rv :<C-u>Unite rails/view<CR>
" rails javascripts
nnoremap <silent> <Leader>rj :<C-u>Unite rails/javascript<CR>
" rails stylesheet
nnoremap <silent> <Leader>rs :<C-u>Unite rails/stylesheet<CR>
" rails bundle gem
nnoremap <silent> <Leader>rg :<C-u>Unite rails/bundled_gem<CR>

" Unite tag
autocmd BufEnter *
  \   if empty(&buftype)
  \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
  \|  endif

" rubyリファレンス
nnoremap <silent> <Leader>rb :<C-u>Unite ref/refe<CR>
" phpマニアル
" nnoremap <silent> <Leader>ph :<C-u>Unite ref/phpmanual<CR>

"uniteを開いている間のキーマッピング
augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "sでsplit
  nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  "vでvsplit
  nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  "fでvimfiler
  nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  "pでpreview
  nnoremap <silent><buffer><expr> p unite#smart_map('p', unite#do_action('preview'))
  inoremap <silent><buffer><expr> p unite#smart_map('p', unite#do_action('preview'))
endfunction


call unite#custom#substitute('files', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/*"', 2)
call unite#custom#substitute('files', '^@', '\=getcwd()."/*"', 1)
call unite#custom#substitute('files', '^\\', '~/*')

call unite#custom#substitute('files', '^v:', '~/.vim/*')
call unite#custom#substitute('files', '^p:', '~/projects/*')

"-----------------------------------
" Alignta
"-----------------------------------
let g:unite_source_alignta_preset_arguments = [
      \ ["Align at '='", '=>\='],
      \ ["Align at ':'", '01 :'],
      \ ["Align at '|'", '|'   ],
      \ ["Align at ')'", '0 )' ],
      \ ["Align at ']'", '0 ]' ],
      \ ["Align at '}'", '}'   ],
      \]

let s:comment_leadings = '^\s*\("\|#\|/\*\|//\|<!--\)'
let g:unite_source_alignta_preset_options = [
      \ ["Justify Left",      '<<' ],
      \ ["Justify Center",    '||' ],
      \ ["Justify Right",     '>>' ],
      \ ["Justify None",      '==' ],
      \ ["Shift Left",        '<-' ],
      \ ["Shift Right",       '->' ],
      \ ["Shift Left  [Tab]", '<--'],
      \ ["Shift Right [Tab]", '-->'],
      \ ["Margin 0:0",        '0'  ],
      \ ["Margin 0:1",        '01' ],
      \ ["Margin 1:0",        '10' ],
      \ ["Margin 1:1",        '1'  ],
      \
      \ 'v/' . s:comment_leadings,
      \ 'g/' . s:comment_leadings,
      \]
unlet s:comment_leadings

"-----------------------------------
" VimFiler
"-----------------------------------
" vimデフォルトのエクスプローラーをVimFilerに置き換える
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
" <Leader>eで現在開いているバッファのディレクトリを開く
nnoremap <silent> <Leader>e :<C-u>VimFilerBufferDir<CR>

nnoremap <space>f :VimFiler -buffer-name=explorer -split -simple -winwidth=45 -toggle -no-quit<CR>

autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s :call vimfiler#mappings#do_action('my_split')<CR>
  nnoremap <buffer>v :call vimfiler#mappings#do_action('my_vsplit')<CR>
  nnoremap <buffer>E :call vimfiler#mappings#do_action('my_tabopen')<CR>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '.a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '.a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'tabnew '.a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_tabopen', my_action)

"----------------------------------
" vimshell
"----------------------------------
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt_expr =
      \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>

"------------------------------------
" Ref
"------------------------------------
" let g:ref_phpmanual_path = $HOME.'/.vim/php_manual_ja/php-chunked-xhtml'

"-----------------------------------
" YankRing
"-----------------------------------
" let g:yankring_manual_clipboard_check = 0
"-----------------------------------
" YankRound
"-----------------------------------
let g:yankround_use_region_hl = 1
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
" nmap p :<C-u>exe yankround#init('p')<Bar>exe "normal! =`]"<Bar>call yankround#activate()<CR>
" nmap P :<C-u>exe yankround#init('P')<Bar>exe "normal! =`]"<Bar>call yankround#activate()<CR>
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" nmap <C-n> :<C-u>call yankround#prev()<Bar>exe "normal! =`]"<CR>
" nmap <C-n> :<C-u>call yankround#next()<Bar>exe "normal! =`]"<CR>

"----------------------------------
" syntastic
"----------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = {
 \ 'mode' : 'active',
 \ 'active_filetypes' : [],
 \ 'passive_filetypes' : ['html','php','ruby']
 \}
let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_phpcs_disable = 1


"----------------------------------
" textmanip
"----------------------------------
" 選択したテキストの移動
let g:textmanip_enable_mappings = 0
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" 行の複製
xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

"----------------------------------
" quickrun
"----------------------------------
" Rspec
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {
      \ 'type' : 'ruby.rspec',
      \ 'command': 'rspec',
      \ 'exec': 'bundle exec %c %o %s',
      \ 'outputter' : 'rspec_outputter'
      \}

let rspec_outputter = quickrun#outputter#buffer#new()
function! rspec_outputter.init(session)
  call call(quickrun#outputter#buffer#new().init, [a:session], self)
endfunction

" syntax color
function! rspec_outputter.finish(session)
  " 文字に色をつける。
  highlight default RSpecGreen   ctermfg=White ctermbg=Green guifg=White guibg=Green
  highlight default RSpecRed     ctermfg=White ctermbg=Red   guifg=White guibg=Red

  call matchadd("RSpecGreen", "^[\.F]*\.[\.F]*$")
  call matchadd("RSpecGreen", "^.*, 0 failures$")
  call matchadd("RSpecRed", "F")
  call matchadd("RSpecRed", "^.*, [1-9]* failures.*$")
  call matchadd("RSpecRed", "^.*, 1 failure.*$")
  call matchadd("RSpecRed", "^ *(.*$")
  call matchadd("RSpecRed", "^ *expected.*$")
  call matchadd("RSpecRed", "^ *got.*$")
  call matchadd("RSpecRed", "Failure/Error:.*$")
  call matchadd("RSpecRed", "^.*(FAILED - [0-9]*)$")
  call matchadd("NonText", "Failures:")
  call matchadd("NonText", "Finished")
  call matchadd("NonText", "Failed")
  call call(quickrun#outputter#buffer#new().finish,  [a:session], self)
endfunction
call quickrun#register_outputter("rspec_outputter", rspec_outputter)

" ファイル名が_spec.rbで終わるファイルを読み込んだ時に上記の設定を自動で読み込む
function! RSpecQuickrun()
  nmap <silent><buffer><Leader>lr :<C-U>QuickRun ruby.rspec.oneline<CR>
  let b:quickrun_config = {'type' : 'ruby.rspec'}
  " nnoremap <silent><buffer><Leader>lr :QuickRun ruby.rspec line('.')<CR>
  nnoremap <expr><silent><buffer><Leader>lr "<Esc>:QuickRun ruby.rspec -cmdopt \"-l" .  line('.') . "\"<CR>"
endfunction
au BufReadPost *_spec.rb call RSpecQuickrun()

"----------------------------------
" indent_guides
"----------------------------------
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=236
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

"----------------------------------
" ctrlp
"----------------------------------
" let g:ctrlp_map = '<c-c>'
" let g:ctrip_use_migemo = 1
" let g:ctrip_clear_cache_on_exit = 0
" let g:ctrip_mruf_max = 500
" let g:ctrip_open_new_file = 1
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("t")': ['<c-a>'],
"     \ }

"----------------------------------
" vim-gitgutter
"----------------------------------
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk
nnoremap <silent> <Leader>gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> <Leader>gl :<C-u>GitGutterLineHighlightsToggle<CR>
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" gundo
nnoremap <space>u :<C-U>GundoToggle<CR>

" easymotion
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="'"
let g:EasyMotion_grouping=1
hi EasyMotionTraget ctermbg=none ctermfg=red
hi EasyMotionShade ctermbg=none ctermfg=blue

" vim-over
nnoremap <silent> <Leader>s :OverCommandLine<CR>%s/

" startify
" startifyのヘッダー部分に表示する文字列を設定する(dateコマンドを実行して日付を設定している)
let g:startify_custom_header =
  \ map(split(system('date'), '\n'), '"   ". v:val') + ['','']
" デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
let g:startify_custom_indices = ['a', 's', 'd', 'f', 'g', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = [
  \ '~/.vimrc'
  \ ]

" switch vim
nnoremap <silent> <Leader>c :Switch<CR>
