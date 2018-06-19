" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-rct'
" Plug 'uplus/deoplete-solargraph'
" Plug 'osyo-manga/vim-monster'

" denite
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" neoyank
Plug 'Shougo/neoyank.vim'

" neomru
Plug 'Shougo/neomru.vim'

" colorscheme jellybeans
Plug 'nanotech/jellybeans.vim'

" colorscheme hybrid
Plug 'w0ng/vim-hybrid'

" colorscheme tender
Plug 'jacoborus/tender.vim'

" colorscheme gotham
Plug 'whatyouhide/vim-gotham'

" colorscheme ondark
Plug 'joshdick/onedark.vim'

" colorscheme janaha
Plug 'mhinz/vim-janah'

" colorscheme spacegrey
Plug 'ajh17/Spacegray.vim'

" colorscheme atom-dark
Plug 'gosukiwi/vim-atom-dark'

" colorscheme doracula
Plug 'dracula/vim', {'as':'dracula'}

" colorscheme material
Plug 'jdkanani/vim-material-theme'

" neoterm
Plug 'kassio/neoterm' " config

" accelerated-jk
Plug 'rhysd/accelerated-jk'

" vim-ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" ruby-matchit
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }

" endwise
Plug 'tpope/vim-endwise'

" vim-yardoc
Plug 'noprompt/vim-yardoc'

" rails.vim
Plug 'romanvbabenko/rails.vim', { 'for': 'ruby' }

" ruby_hl_lvar
Plug 'todesking/ruby_hl_lvar.vim', { 'for': 'ruby' }

" match.zip
Plug 'vim-scripts/matchit.zip'

" AnsiEsc
Plug 'vim-scripts/AnsiEsc.vim'

" syntastic
Plug 'scrooloose/syntastic'

" previm
Plug 'kannokanno/previm'
" memolist
" vim-textmanip
Plug 't9md/vim-textmanip'

" vim-easymotion
" vim-over

" indentLine
Plug 'Yggdroot/indentLine'

" vim-easy-align
Plug 'junegunn/vim-easy-align'

" vim-smartword
Plug 'kana/vim-smartword'

" incsearch
Plug 'haya14busa/incsearch.vim'

" text object
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-function'
Plug 'terryma/vim-expand-region'
Plug 'kana/vim-textobj-entire'
Plug 'vim-scripts/camelcasemotion'

" ag
Plug 'rking/ag.vim'

" lightline
Plug 'itchyny/lightline.vim'

" linediff
Plug 'AndrewRadev/linediff.vim'

" fugitive
Plug 'tpope/vim-fugitive'

" gitv
Plug 'vim-scripts/gitv'

" extradite
Plug 'vim-scripts/extradite.vim'

" vim-merginal
Plug 'idanarye/vim-merginal'

" vim-signify
Plug 'mhinz/vim-signify'

" committia
Plug 'rhysd/committia.vim'

" javascript plugins
" Plug 'neovim/node-host', { 'do': 'npm install' }
" Plug 'billyvg/tigris.nvim', { 'do': './install.sh', 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'digitaltoad/vim-jade'
Plug 'briancollins/vim-jst', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'wavded/vim-stylus'
Plug 'GutenYe/json5.vim', { 'for': 'json5' }
Plug 'nicklasos/vim-jsx-riot'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

" html/css plugins
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" go
Plug 'fatih/vim-go'

" Erlang Support
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-compiler'

" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'mmorearty/elixir-ctags'
Plug 'mattreduce/vim-mix'
Plug 'mhinz/vim-mix-format'
Plug 'BjRo/vim-extest'
Plug 'frost/vim-eh-docs'
" Plug 'slashmili/alchemist.vim'
Plug 'jadercorrea/elixir_generator.vim'

" Elm Support
Plug 'lambdatoast/elm.vim'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" actionscript
Plug 'jeroenbourgois/vim-actionscript'

" ansible
Plug 'chase/vim-ansible-yaml'
Plug 'Glench/Vim-Jinja2-Syntax'

" neco-look
Plug 'ujihisa/neco-look'
Plug 'Shougo/neco-syntax'

" commentout
Plug 'tyru/caw.vim'

" markdown
Plug 'tpope/vim-markdown'

" dirvish
" Plug 'justinmk/vim-dirvish'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" vim-devicons
Plug 'ryanoasis/vim-devicons'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" autoclose
Plug 'Townk/vim-autoclose'

" trailing-whitespace
Plug 'bronson/vim-trailing-whitespace'

"tagbar"
Plug 'majutsushi/tagbar'
" Plug 'hushicai/tagbar-javascript.vim'

" colorizer
Plug 'lilydjwg/colorizer'

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
 " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

syntax enable
" Theme
set background=dark
" colorscheme hybrid
" colorscheme tender
" colorscheme gotham256
" colorscheme onedark
" colorscheme janah
" colorscheme spacegray
" colorscheme atom-dark-256
" colorscheme dracula
colorscheme material-theme

source ~/.vim/rc/encoding.vim
source ~/.vim/rc/golang.vim
source ~/.vim/rc/basic.vim
source ~/.vim/rc/syntax.vim
source ~/.vim/rc/map.vim


" netrw
" 上部に表示される情報を非表示
let g:netrw_banner = 0
" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
" let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1
" absolute width of netrw window
let g:netrw_winsize = -28
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" open file in a new tab
let g:netrw_browse_split = 3


" Use deoplete.
set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1
" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction

" inoremap <expr><C-y> deoplete#close_popup()
" inoremap <expr><C-e> deoplete#close_popup()

" inoremap <expr><C-g> deoplete#undo_completion()
" inoremap <expr><C-l> deoplete#complete_common_string()
"
" vim-mounster
" gem install rcodetools
" gem install fastri
" let g:monster#completion#rcodetools#backend = "async_rct_complete"
" let g:deoplete#sources#omni#input_patterns = {
" \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
" \}


" Use auto delimiter
call deoplete#custom#set('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
\ ])


" Use denite

if executable('ag')
  call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])
endif

" call denite#custom#source('file_old', 'converters',
"       \ ['converter_relative_word'])
" call denite#custom#source('buffer', 'converters', ['converter_file_directory'])

call denite#custom#map(
  \ 'insert',
  \ '<C-j>',
  \ '<denite:move_to_next_line>',
  \ 'noremap'
  \)

call denite#custom#map(
  \ 'insert',
  \ '<C-k>',
  \ '<denite:move_to_previous_line>',
  \ 'noremap'
  \)

" Define alias
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
      \   'vendor/bundle', '.bundle', '.sass-cache',
      \   'node_modules', 'bower_components'])


call denite#custom#option('default', {
      \ 'auto_accel': v:true,
      \ 'prompt': '>',
      \ 'source_names': 'short',
      \ })


" ファイルタイプ
" カラースキーマ
" ディレクトリ
" ファイル
nmap <silent> <Leader>f :<C-u>Denite file -highlight-mode-insert=Search<CR>
nmap <silent> <Leader>u :<C-u>DeniteBufferDir -buffer-name=files -highlight-mode-insert=Search file<CR>
nmap <silent> <Leader>p :<C-u>Denite -buffer-name=files -highlight-mode-insert=Search `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
" ファイル（mru）
nmap <silent> <Leader>r :<C-u>Denite file_mru -highlight-mode-insert=Search<CR>

" コマンド
" grep
nmap <silent> <Leader>g :<C-u>Denite grep -highlight-mode-insert=Search<CR>

" ヘルプ
nmap <silent> <Leader>h :<C-u>Denite help -highlight-mode-insert=Search<CR>

" ヤンク
nmap <silent> <Leader>y :<C-u>Denite register -highlight-mode-insert=Search neoyank<CR>

" バッファ
nmap <silent> <Leader>. :<C-u>Denite buffer -highlight-mode-insert=Search<CR>

" アウトライン
nmap <silent> <Leader>o :<C-u>Denite outline -highlight-mode-insert=Search<CR>

" ライン
nmap <silent> <Leader>/ :<C-u>Denite line -buffer-name=search%`bufnr('%')` -highlight-mode-insert=Search<CR>

" Deniteでカーソル上のwordをBuffer内で検索
nmap <silent> <Leader>* :<C-u>DeniteCursorWord -buffer-name=search -auto-highlight -mode=normal -highlight-mode-insert=Search line<CR>

nmap <silent> <Leader>a :<C-u>Denite -buffer-name=files -highlight-mode-insert=Search buffer file_mru file<CR>

" Use accelerated_jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" Use vim-ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" Use syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
 \ 'mode' : 'active',
 \ 'active_filetypes' : [],
 \ 'passive_filetypes' : ['html','php','ruby', 'go', 'scss']
 \}
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
let g:syntastic_scss_sass_quiet_messages = 
    \ {'regex': '\vUndefined (mixin|variable)|File to import not found or unreadable'}
    " \ {'regex': 'File to import not found or unreadable'}
    " \ {'regex': 'Undefined \(mixin\|variable\)'}
" let g:syntastic_phpcs_disable = 1
let g:syntastic_go_checkers = ['go', 'golint']


" vim-textmanip
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


" Use indentLine
" let g:indentLine_enabled = 0
let g:indentLine_faster = 1
" let g:indentLine_color_term = 239
" let g:indentLine_setColors = 0
" let g:indentLine_setConceal = 0

" Use vim-easy-align
vmap <Enter> <Plug>(EasyAlign)

" Use vim-smartword
nmap w   <Plug>(smartword-w)
nmap b   <Plug>(smartword-b)
nmap e   <Plug>(smartword-e)

" Use incsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" fuzzy search
" map z/ <Plug>(incsearch-fuzzy-/)
" map z? <Plug>(incsearch-fuzzy-?)
" map zg/ <Plug>(incsearch-fuzzy-stay)
" fuzzy spell search
" map z/ <Plug>(incsearch-fuzzyspell-/)
" map z? <Plug>(incsearch-fuzzyspell-?)
" map zg/ <Plug>(incsearch-fuzzyspell-stay)
" with easy motion
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)


" Use lightline
let g:lightline = {
      \ 'colorscheme': 'material',
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
      \     'charcode': 'MyCharCode'
      \   },
      \ }

if has('multi_byte')
    let g:lightline.separator = {'left': '', 'right':''}
    let g:lightline.subseparator = {'left': '', 'right': ''}
endif

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo\|dirvish' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo\|dirvish' && &ro ? '' : ''
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
    if &ft !~? 'vimfiler\|gundo\|dirvish' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? ' ' ._ : ''
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


" Use fugitive
nmap <silent> <Leader>gd :<C-u>Gdiff<CR>
nmap <silent> <Leader>gD :<C-u>Gdiff HEAD<CR>
nmap <silent> <Leader>gs :<C-u>Gstatus<CR>
nmap <silent> <Leader>ga :<C-u>Gwrite<CR>
nmap <silent> <Leader>gc :<C-u>Gcommit<CR>
nmap <silent> <Leader>gb :<C-u>Gblame<CR>
nmap <silent> <Leader>gl :<C-u>Glog<CR>
" extradite
nmap <silent> <Leader>ge :<C-u>Extradite<CR>

" Use gitv
nmap <silent> <Leader>gh :<C-u>Gitv<CR>

" Use vim-javascript
let g:javascript_plugin_flow = 1

" Use javascript-libraries-syntax
  let g:used_javascript_libs = 'jquery,underscore,react,vue'

" Use tigris.vim
" let g:tigris#enabled = 1
" let g:tigris#on_the_fly_enabled = 1
" let g:tigris#delay = 300

" Use neoterm
let g:neoterm_autoscroll=1
let g:neoterm_repl_ruby = 'pry'
tnoremap <silent> <ESC> <C-\><C-n><C-w>
nnoremap <silent> <space>r V:TREPLSendLine<cr>
vnoremap <silent> <space>r V:TREPLSendSelection<cr>'>j$

" Use previm
let g:previm_open_cmd = 'open -a Google\ Chrome'

" Use fzf
nmap ; :Buffers
nmap t :Files
" nmap r :Tags
"
" NERDTree
" autocmd BufEnter * lcd %:p:h
map <Space>t :NERDTreeTabsToggle<CR>
map <Space>f :NERDTreeFind<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeLimitedSyntax = 1
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_autofind = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

" vim-prettier
let g:prettier#autoformat = 0
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.css,*.scss,*.less PrettierAsync
autocmd BufWritePre *.js,*.css,*.scss,*.less PrettierAsync
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 1
let g:prettier#config#print_width = 120

" tagbar
" let g:tagbar_type_javascript = {
"       \'ctagsbin' : 'jtags'
"       \}
"
" Elixir Tagbar Configuration
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" mix format
let g:mix_format_on_save = 1
