set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim/
  call neobundle#rc(expand('~/.vim/.bundle'))
endif

NeoBundle 'neocomplcache'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
NeoBundle 'surround.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'matchit.zip'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/thinca/vim-ref.git'
NeoBundle 'sudo.vim'
NeoBundle 'AutoClose'
NeoBundle 'camelcasemotion'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tComment'
NeoBundle 'https://github.com/tpope/vim-markdown.git'
NeoBundle 't9md/vim-textmanip'

" unite
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/basyura/unite-rails.git'
NeoBundle 'https://github.com/h1mesuke/unite-outline.git'
NeoBundle 'https://github.com/tacroe/unite-mark.git'
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'https://github.com/sgur/unite-qf.git'
NeoBundle 'https://github.com/h1mesuke/vim-alignta.git'
NeoBundle 'https://github.com/daisuzu/unite-grep_launcher.git'

NeoBundle 'git://github.com/Shougo/vimfiler.git'
if &encoding ==# 'utf-8'
  NeoBundle 'git://github.com/Shougo/vimproc.git'
endif
NeoBundle 'git://github.com/Shougo/vimshell.git'

NeoBundle 'https://github.com/thinca/vim-qfreplace.git'

" git
NeoBundle 'fugitive.vim'
NeoBundle 'gitv'
NeoBundle 'extradite.vim'
NeoBundle 'git-commit'

" ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'endwise.vim'
" Bundle 'cucumber.zip'
" Bundle 'tpope/vim-rails'
" Bundle 'railstab.vim'

" javascript
" NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jQuery'
NeoBundle 'https://github.com/kchmck/vim-coffee-script.git'

" php
" NeoBundle 'https://github.com/beyondwords/vim-twig.git'

" html css
NeoBundle 'ZenCoding.vim'
NeoBundle 'html5.vim'
NeoBundle 'https://github.com/hail2u/vim-css3-syntax.git'

" colorscheme
NeoBundle 'jellybeans.vim'
NeoBundle 'railscasts'
NeoBundle 'desert256.vim'
NeoBundle 'leo256'
" Bundle 'Railscasts-Theme-GUIand256color'
NeoBundle 'molokai'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
"
"#
"# .vimrc
"#

"----------------------------
"set options
"----------------------------
set nocompatible			" viに互換しない
"set fffs=unix				" 改行コードをFLにする(default: unix,dis)
set noinsertmode			" デフォルトモードをインサートにしない
set wrap				" 行の端まで到達したら折り返す
set nolinebreak				" ホワイト・スペースで折り返さない
set formatoptions=q			" gq コマンド以外では自動改行しない
set backspace=indent,eol,start				" 全て Backspace で削除可能にする
set smartindent				" オートインデント
set noerrorbells			" エラー時にベルを鳴らさない
set novisualbell			" ヴィジュアルベルを使わない
set cmdheight=1				" コマンドラインの高さ
set shortmess=t				" 'Press RETURN or enter command to continue' を表示しない
set history=50				" 記憶するコマンド数
set number				" 行番号を表示
set showmode				"
set wildmenu				" コマンド入力中の補完候補をステータスラインに表示
set wildignore=*.o,*.so		" 補完候補から除外するファイル
set tabstop=2				" タブ幅
set shiftwidth=2			" インデント幅
set smarttab				"
set expandtab
"set noexpandtab				" オートインデント時に挿入タブをスペースに変換しない
set ruler				" ルーラーを表示
set showcmd				" 実行したコマンドを表示
set showmatch				" 対応する括弧に一時的に移動
"set title				" タイトルを表示
set laststatus=2			" 常にステータス行を表示
"set ignorecase				" 大文字・小文字を無視
set smartcase				" 検索キーワードに大文字が含まれていれば大文字小文字を区別
set hlsearch				" 検索キーワードをハイライトする
set wrapscan				" ファイルの最後に来たら最初から検索
set magic				" 正規表現使用時に magic モードにする
"set list				" タブや改行などを別の文字に区別する
"set listchars=tab:-\ ,extends:<	" タブや改行などの代替文字設定(ex. tab:>-,extends:<.trail:-,eol:< )
set keywordprg=man\ -a			" キーワードのヘルプコマンドの設定(default: man or man\ -s)
"set lazyredraw				" マクロ実行中は画面を更新しない
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{fugitive#statusline()}%=%b\ 0x%B\ \ %l,%c%V%8P
					" ステータス行のフォーマット
""set cursorline				" カーソル行に下線を表示(* vim7)
"set cursorcolumn			" カーソル列をハイライト表示(* vim7)

set incsearch	" サーチをインクリメンタルにする

set modifiable
set t_Co=256

set directory=~/tmp/

filetype on
filetype plugin on
filetype indent on
"------------------------------
" syntax
"------------------------------

syntax on
"highlight Comment ctermfg=Cyan
"highlight Comment ctermfg=Green
"highlight Search ctermbg=Green ctermfg=Black
"highlight Error ctermfg=Black
"autocmd! BufRead,BufNewFile *.ctp set filetype=html
autocmd! BufRead,BufNewFile *.htmlt set filetype=smarty

colorscheme molokai
" colorscheme jellybeans

" let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized

" highlight Search ctermbg=yellow ctermfg=Black
" highlight Folded ctermbg=grey ctermfg=darkblue
" highlight FoldColumn ctermbg=darkgrey ctermfg=white
" highlight StatusLine ctermfg=Black ctermbg=white
" highlight StatusLineNC ctermfg=Black ctermbg=grey
" highlight VertSplit ctermfg=none ctermbg=grey
" highlight DiffText ctermfg=Green ctermbg=grey
" highlight DiffChange ctermfg=Green ctermbg=grey
" highlight DiffAdd ctermfg=Green ctermbg=grey
" highlight DiffDelete ctermfg=Green ctermbg=grey
"highlight Pmenu ctermbg=Cyan
"highlight PmenuSel ctermbg=Green
"highlight PmenuSbar ctermbg=Grey
"highlight Folded ctermbg=grey ctermfg=blue
"highlight FoldColumn ctermbg=darkgrey ctermfg=white

" PHP code fold
let php_folding=1
au Syntax php set fdm=syntax
au Syntax html set fdm=indent
set foldlevel=5

" autocmd! BufNewFile,BufRead *.php set ts=4 sw=4 fenc=euc-jp noexpandtab
" autocmd! BufNewFile,BufRead *.php5 set ts=4 sw=4 fenc=euc-jp noexpandtab
autocmd! BufNewFile,BufRead *.php set ts=2 sw=2 noexpandtab
autocmd! BufNewFile,BufRead *.php5 set ts=2 sw=2 noexpandtab

" ruby code fold
let ruby_folding=1
au Syntax ruby set fdm=syntax
au Syntax erb set fdm=indent
au Syntax html set fdm=indent
set foldlevel=5

autocmd! BufNewFile,BufRead *.rb set ts=2 sw=2 fenc=utf-8 expandtab
autocmd! BufNewFile,BufRead *.js set ts=2 sw=2 fenc=utf-8 expandtab

"------------------------------
" auto encoding
"------------------------------
set ffs=unix,dos,mac  " 改行文字
"set encoding=utf-8    " デフォルトエンコーディング
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

" 行の最初に移動
noremap 1 ^
noremap <C-a> ^
inoremap <C-a> <home>
" 行末に移動
noremap 9 $
noremap <C-e> $
inoremap <C-e> <end>


"vimgrep(Vim7)
"au QuickfixCmdPost vimgrep cwin

" 上の行のインデントを見て勝手にあわせてくれる
nnoremap p p=`]

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

"------------------------------
" ========================
" plug-ins
" ========================
"------------------------------

" ========================
" Zen-Coding setting
" ========================
"let g:user_zen_expandabbr_key='<c-e>'
"let g:use_zen_complete_tag = 1

" ========================
" neocomplcache
" ========================
" 補完ウィンドウの設定
set completeopt=menuone"
" NeoComplCacheを有効にする
let g:neocomplcache_enable_at_startup = 1
" 表示候補の数
let g:neocomplcache_max_list = 30
" 自動補完を行う入力数
let g:neocomplcache_auto_completion_start_length = 2
" 手動補完時に補完を行う入力数を制御
let g:neocomplcache_manual_completion_start_length = 3
" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
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
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" Plugin key-mappings.
" imap <C-k>     <Plug>(neocomplcache_snippets_expand)
" smap <C-k>     <Plug>(neocomplcache_snippets_expand)

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR> neocomplcache#close_popup()."\<CR>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-d> neocomplcache#cancel_popup()

" ========================
" neocomplcache-snippets-complete
" ========================
let g:neocomplcache_snippets_dir = '~/.vim/snippets'

" imap <TAB> <Plug>(neocomplcache_snippets_expand)
smap <TAB> <Plug>(neocomplcache_snippets_expand)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ========================
" vim-ruby
" ========================
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" ========================
" rails.vim
" ========================
" let g:rails_level = 4
" let g:rails_defalut_database = 'mysql'

" gitv
nnoremap <silent> <Leader>gh :<C-u>Gitv<CR>

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
" タブ一覧
nnoremap <silent> <Leader>t :<C-u>Unite tab<CR>
" バッファ一覧
nnoremap <silent> <Leader>. :<C-u>Unite buffer <CR>
" ファイル一覧
nnoremap <silent> <Leader>uf :<C-u>Unite -buffer-name=files file<CR>
" ブックマーク一覧
nnoremap <silent> <Leader>ub :<C-u>Unite bookmark<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Leader>ur :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> <Leader>ua :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
" ブックマークに追加
" nnoremap <silent> <Leader>ua :<C-u>UniteBookmarkAdd<CR>
" アウトライン
nnoremap <silent> <Leader>uo :<C-u>Unite outline<CR>
" マーク一覧
nnoremap <silent> <Leader>um :<C-u>Unite mark<CR>
" ライン
nnoremap <silent> <Leader>/ :<C-u>Unite line<CR>
" quickfix
nnoremap <silent> <Leader>qf :<C-u>Unite qf<CR>
" grep_launcher
nnoremap <silent> <Leader>ug :<C-u>Unite grep_launcher<CR>

" Unite tag
autocmd BufEnter *
  \   if empty(&buftype)
  \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
  \|  endif

" rubyリファレンス
nnoremap <silent> <Leader>rb :<C-u>Unite ref/refe<CR>
" phpマニアル
" nnoremap <silent> <Leader>ph :<C-u>Unite ref/phpmanual<CR>

" レジスタ一覧
" nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>

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


call unite#set_substitute_pattern('files', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/*"', 2)
call unite#set_substitute_pattern('files', '^@', '\=getcwd()."/*"', 1)
call unite#set_substitute_pattern('files', '^\\', '~/*')

call unite#set_substitute_pattern('files', '^v:', '~/.vim/*')
call unite#set_substitute_pattern('files', '^p:', '~/projects/*')

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
" unite-grep_launcher
"-----------------------------------
if !exists('g:grep_launcher_words')
  let g:grep_launcher_words = {}
endif

let g:grep_launcher_words['TODO'] = 'TODO'


"-----------------------------------
" VimFiler
"-----------------------------------
" vimデフォルトのエクスプローラーをVimFilerに置き換える
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
" <Leader>eで現在開いているバッファのディレクトリを開く
nnoremap <silent> <Leader>e :<C-u>VimFilerBufferDir<CR>

nnoremap <F12> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<CR>

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
" vimhshell
"----------------------------------
let g:vimshell_interactive_update_time = 10

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
let g:yankring_manual_clipboard_check = 0

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
 \ 'passive_filetypes' : ['html','php']
 \}
let g:syntastic_javascript_checker = 'jshint'
" let g:syntastic_phpcs_disable = 1


"----------------------------------
" textmanip
"----------------------------------
" 選択したテキストの移動
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" 行の複製
xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)
