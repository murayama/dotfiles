set rtp+=~/dotfiles/.vim/vundle.git/
call vundle#rc()

Bundle 'neocomplcache'
Bundle 'Align'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'snipMate'
Bundle 'surround.vim'
Bundle 'YankRing.vim'
Bundle 'unite.vim'
Bundle 'matchit.zip'
Bundle 'https://github.com/thinca/vim-quickrun.git'
Bundle 'ZenCoding.vim'
Bundle 'https://github.com/thinca/vim-ref.git'
Bundle 'https://github.com/basyura/unite-rails.git'
Bundle 'https://github.com/h1mesuke/unite-outline.git'
Bundle 'sudo.vim'
Bundle 'AutoClose'

" git
Bundle 'git://github.com/motemen/git-vim.git'
Bundle 'git-commit'
Bundle 'gitdiff.vim'

" ruby
Bundle 'git://github.com/vim-ruby/vim-ruby.git'
Bundle 'endwise.vim'
Bundle 'cucumber.zip'
Bundle 'tpope/vim-rails'
Bundle 'railstab.vim'

" javascript
Bundle 'javascript.vim'
Bundle 'JavaScript-Indent'
Bundle 'jQuery'
Bundle 'https://github.com/kchmck/vim-coffee-script.git'

" colorscheme
Bundle 'jellybeans.vim'
Bundle 'railscasts'
Bundle 'desert256.vim'
Bundle 'leo256'
Bundle 'Railscasts-Theme-GUIand256color'
Bundle 'molokai'
Bundle 'pyte'
Bundle 'Zenburn'
Bundle 'Solarized'
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
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%b\ 0x%B\ \ %l,%c%V%8P
					" ステータス行のフォーマット
set cursorline				" カーソル行に下線を表示(* vim7)
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
    let &fileencodings = &fileencodings .','. s:fileencodings_default
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
nnoremap k gk
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
" 行末に移動
noremap 9 $

"vimgrep(Vim7)
"au QuickfixCmdPost vimgrep cwin
" vimgrepでrubyの簡易アウトライン
command! Routline vimgrep /\(class\|module\|def\)/j % | cwin
" vimgrepでphpの簡易アウトライン
command! Poutline vimgrep /\(class\|function\)/j % | cwin

" 上の行のインデントを見て勝手にあわせてくれる
nnoremap p p=`]

" for, if, while などがある行にカーソルを置いて、これを実行すると、そのブロックを選択する。
"nnoremap vb /{<CR>%v%0

"map <CR> <c-w><CR>

" ctags
map <c-]> <c-w>g<c-]>

"日時挿入
imap <silent> <C-H> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
" inoremap {} {}<LEFT>
" inoremap [] []<LEFT>
" inoremap () ()<LEFT>
" inoremap "" ""<LEFT>
" inoremap '' ''<LEFT>

" 保存時に行末のスペースを削除
function! RTrim()
	let s:cursor = getpos(".")
	%s/\s\+$//e
	call setpos(".",s:cursor)
endfunction

autocmd BufWritePre * call RTrim()

"------------------------------
" ========================
" plug-ins
" ========================
"------------------------------

" ========================
" NERDTree
" ========================
nmap <silent> <F12> :NERDTreeToggle<CR>
let NERDTreeWinSize=50
" let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0

" ========================
" Zen-Coding setting
" ========================
"let g:user_zen_expandabbr_key='<c-e>'
"let g:use_zen_complete_tag = 1

" ========================
" neocomplcache
" ========================

" " AutoComplPopを無効にする
" let g:acp_enableAtStartup = 0
" NeoComplCacheを有効にする
let g:neocomplcache_enable_at_startup = 1
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
let g:neocomplcache_enable_auto_select = 1
" プラグイン毎の補完関数を呼び出す文字数
let g:NeoComplCache_PluginCompletionLength = {
  \ 'keyword_complete'  : 3,
  \ 'syntax_complete'   : 3
  \ }

" Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'scala' : $HOME.'/.vim/bundle/vim-scala/dict/scala.dict',
"     \ 'java' : $HOME.'/.vim/dict/java.dict',
"     \ 'c' : $HOME.'/.vim/dict/c.dict',
"     \ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
"     \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
"     \ 'ocaml' : $HOME.'/.vim/dict/ocaml.dict',
"     \ 'perl' : $HOME.'/.vim/dict/perl.dict',
"     \ 'php' : $HOME.'/.vim/dict/php.dict',
"     \ 'scheme' : $HOME.'/.vim/dict/scheme.dict'
"     \ }


if !exists('g:neocomplcache_quick_match_patterns')
    let g:neocomplcache_quick_match_patterns = {}
endif
let g:neocomplcache_quick_match_patterns['default'] = '\`'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" let g:neocomplcache_keyword_patterns['ruby'] = '^=\%(b\%[egin]\|e\%[nd]\)\|#\%[!]\|\%(@@\|[:$@]\)\h\w*\|\h\w*\%(::\w*\)*[!?]\?\%(()\?\|\s\?\%(do\|{\)\s\?\)\?'

" ユーザー定義スニペット保存ディレクトリ
" let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
" snipMateを使いたいのでneocomplcacheのスニペットをoffにする
if !exists('g:neocomplcache_plugin_disable')
  let g:neocomplcache_plugin_disable = {}
endif
let g:neocomplcache_plugin_disable.snippets_complete = 1

" " SuperTab like snippets behavior.
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" スニペット
" imap <C-k> <Plug>(neocomplcache_snippets_expand)
" smap <C-k> <Plug>(neocomplcache_snippets_expand)

" 補完を選択しpopupを閉じる
" inoremap <expr><C-y> neocomplcache#close_popup()
" " 補完をキャンセルしpopupを閉じる
" inoremap <expr><C-e> neocomplcache#cancel_popup()
" " TABで補完できるようにする
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" " undo
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" " 補完候補の共通部分までを補完する
" inoremap <expr><C-l> neocomplcache#complete_common_string()
" " C-kを押すと行末まで削除
" inoremap <C-k> <C-o>D
" " C-nでneocomplcache補完
" inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" " C-pでkeyword補完
" inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" " 補完候補が出ていたら確定、なければ改行
" inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()

" FileType毎のOmni補完を設定
" autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete

" " Enable heavy omni completion.
" if !exists('g:neocomplcache_omni_patterns')
  " let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" "let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*'


" ========================
" Align
" ========================
let g:Align_xstrlen = 3


" ========================
" NERD_commenter
" ========================
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let NERDShutUp = 1

"map <Leader>x ,c<space>
"map <Leader>a ,cA

nmap <Leader>cc <Plug>NERDCommenterAlignLeft
vmap <Leader>c  <Plug>NERDCommenterComment
nmap <Leader>C  <Plug>NERDCommenterToEOL
vmap <Leader>C  <Plug>NERDCommenterAlignLeft

nmap <Leader>u  <Plug>NERDCommenterUncomment
vmap <Leader>u  <Plug>NERDCommenterUncomment

nmap <Leader>xm <Plug>NERDCommenterMinimal
nmap <Leader>xs <Plug>NERDCommenterSexy
vmap <Leader>xm <Plug>NERDCommenterMinimal
vmap <Leader>xs <Plug>NERDCommenterSexy
nmap <Leader>xa <Plug>NERDCommenterAltDelims


" ========================
" vim-ruby
" ========================
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" ========================
" rails.vim
" ========================
let g:rails_level = 4
let g:rails_defalut_database = 'mysql'


" ========================
" snipMate.vim
" ========================
let g:snips_author = 'n-murayama'


"------------------------------------
" git.vim
"------------------------------------
let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'
nnoremap <Leader>gD :<C-u>GitDiff --cached<Enter>
nnoremap <Leader>gd :<C-u>GitDiff<Enter>
nnoremap <Leader>gs :<C-u>GitStatus<Enter>
nnoremap <Leader>gl :<C-u>GitLog<Enter>
nnoremap <Leader>gL :<C-u>GitLog -u \| head -10000<Enter>
nnoremap <Leader>ga :<C-u>GitAdd<Enter>
nnoremap <Leader>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <Leader>gc :<C-u>GitCommit -v<Enter>
nnoremap <Leader>gC :<C-u>GitCommit --amend<Enter>
nnoremap <Leader>gp :<C-u>Git push


"------------------------------------
" Unite
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" let g:unite_enable_split_vertically = 1 "縦分割で開く
" let g:unite_winwidth = 40 "横幅40で開く
" バッファ一覧
nnoremap <silent> <Leader>. :<C-u>Unite buffer <CR>
" ファイル一覧
nnoremap <silent> <Leader>uf :<C-u>Unite -buffer-name=files file<CR>
" ブックマーク一覧
nnoremap <silent> <Leader>ub :<C-u>Unite bookmark<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Leader>um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> <Leader>ua :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>

" rubyリファレンス
nnoremap <silent> <Leader>ur :<C-u>Unite ref/refe<CR>
" phpマニアル
nnoremap <silent> <Leader>up :<C-u>Unite ref/phpmanual<CR>

" レジスタ一覧
" nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" " ウィンドウを分割して開く
" au FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
" au FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
" " ウィンドウを縦に分割して開く
" au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
" au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')

" " ESCキーを2回押すと終了する
" au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
" au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

call unite#set_substitute_pattern('files', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/*"', 2)
call unite#set_substitute_pattern('files', '^@', '\=getcwd()."/*"', 1)
call unite#set_substitute_pattern('files', '^\\', '~/*')

call unite#set_substitute_pattern('files', '^v:', '~/.vim/*')
call unite#set_substitute_pattern('files', '^p:', '~/projects/*')


"------------------------------------
" Ref
"------------------------------------
let g:ref_phpmanual_path = $HOME.'/.vim/php_manual_ja/php-chunked-xhtml'
let g:ref_refe_cmd = $HOME . '/.vim/ruby_1_9_1_ref/ruby-refm-1.9.2-dynamic-20110729/refe-1_9_2'

"-----------------------------------
" YankRing
"-----------------------------------
let g:yankring_manual_clipboard_check = 0
