" Basic Settings {{{
set backspace=indent,eol,start  " 全て Backspace で削除可能にする
set nocompatible                " viに互換しない
" set fffs=unix                 " 改行コードをLFにする(default: unix,dis)
set noinsertmode                " デフォルトモードをインサートにしない
set wrap                        " 行の端まで到達したら折り返す
set nolinebreak                 " ホワイト・スペースで折り返さない
set formatoptions=q             " gq コマンド以外では自動改行しない
set smartindent                 " オートインデント
set noerrorbells                " エラー時にベルを鳴らさない
set novisualbell                " ヴィジュアルベルを使わない
set cmdheight=1                 " コマンドラインの高さ
set shortmess=t                 " 'Press RETURN or enter command to continue' を表示しない
set history=50                  " 記憶するコマンド数
set number                      " 行番号を表示
" set relativenumber            " 相対行を表示
set showmode                    "
set wildmenu                    " コマンド入力中の補完候補をステータスラインに表示
set wildmode=longest,list,full
set wildignore=*.o,*.so         " 補完候補から除外するファイル

" タブストップ
set tabstop=2                   " タブ幅
set shiftwidth=2                " インデント幅
set shiftround                  " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set smarttab
set expandtab
" set noexpandtab               " オートインデント時に挿入タブをスペースに変換しない

" set infercase                 " 補完時に大文字小文字を区別しない
" set virtualedit=all           " カーソルを文字が存在しない部分でも動けるようにする
set hidden                      " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen           " 新しく開く代わりにすでに開いてあるバッファを開く
set ruler                       " ルーラーを表示
set showcmd                     " 実行したコマンドを表示
set showmatch                   " 対応する括弧に一時的に移動
set matchtime=1
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
" set title                     " タイトルを表示
set laststatus=2                " 常にステータス行を表示
" set ignorecase                  " 大文字・小文字を無視
set smartcase                   " 検索キーワードに大文字が含まれていれば大文字小文字を区別
set incsearch                   " サーチをインクリメンタルにする
set hlsearch                    " 検索キーワードをハイライトする
set wrapscan                    " ファイルの最後に来たら最初から検索
set magic                       " 正規表現使用時に magic モードにする
set list                        " タブや改行などを別の文字に区別する
" set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
if !has('multi_byte')
  set listchars=tab:^I,extends:>,precedes:<,nbsp:%,trail:.
else
  try
    set listchars=tab:▸\ ,extends:»,precedes:«,nbsp:%,trail:.
  catch
    set listchars=tab:^I,extends:>,precedes:<,nbsp:%,trail:.
    let g:vimfiler_tree_leaf_icon = '|'
    let g:vimfiler_tree_opened_icon = '-'
    let g:vimfiler_tree_closed_icon = '+'
  endtry
endif

"set listchars=tab:-\ ,extends:<" タブや改行などの代替文字設定(ex. tab:>-,extends:<.trail:-,eol:< )
set textwidth=0                 " 自動的に改行が入るのを無効化
set keywordprg=man\ -a          " キーワードのヘルプコマンドの設定(default: man or man\ -s)
"set lazyredraw                 " マクロ実行中は画面を更新しない
" set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{fugitive#statusline()}%=%b\ 0x%B\ \ %l,%c%V%8P
	" ステータス行のフォーマット
set cursorline                  " カーソル行に下線を表示(* vim7)
set cursorcolumn                " カーソル列をハイライト表示(* vim7)
set display=lastline
set pumheight=10
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

set ambiwidth=double

set modifiable
set t_Co=256

set directory=~/tmp/
set undodir=~/tmp/undo
set backupdir=~/tmp/backup

" set mouse=a
" set ttymouse=xterm2

let g:Foldtext_enable=1
set foldmethod=syntax
set foldlevel=4
set foldnestmax=5
" set foldcolumn=3
set fillchars=vert:\|

augroup foldmethod-syntax
  autocmd!
  autocmd InsertEnter * if &l:foldmethod ==# 'syntax'
  \                   |   setlocal foldmethod=manual
  \                   | endif
  autocmd InsertLeave * if &l:foldmethod ==# 'manual'
  \                   |   setlocal foldmethod=syntax
  \                   | endif
augroup END

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
"
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
