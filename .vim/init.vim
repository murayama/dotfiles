" vim-plug

call plug#begin('~/.local/share/nvim/plugged')

" YouCompleteMe
" Plug 'Valloric/YouCompleteMe'
" Plug 'tenfyzhong/CompleteParameter.vim'

" coc.vim
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc-css
" coc-elixir
" coc-emmet
" coc-eslint
" coc-fzf-preview
" coc-git
" coc-json
" coc-lists
" coc-markdownlint
" coc-prettier
" coc-solargraph
" coc-tsserver
" coc-yaml/
" coc-webview
" coc-markdown-preview-enhanced
" coc-yank


" tabnine
" Plug 'zxqfl/tabnine-vim'

" neoyank
Plug 'Shougo/neoyank.vim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" neoterm
Plug 'kassio/neoterm'

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
" Plug 'todesking/ruby_hl_lvar.vim', { 'for': 'ruby' }

Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }

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
Plug 'easymotion/vim-easymotion'
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

" lightline
Plug 'itchyny/lightline.vim'

" linediff
Plug 'AndrewRadev/linediff.vim'

" fugitive
Plug 'tpope/vim-fugitive'

" gitv
Plug 'vim-scripts/gitv'

" git-messenger
Plug 'rhysd/git-messenger.vim'

" extradite
Plug 'vim-scripts/extradite.vim'

" vim-merginal
Plug 'idanarye/vim-merginal'

" vim-signify
Plug 'mhinz/vim-signify'

" committia
Plug 'rhysd/committia.vim'

" vim-fold-cycle
Plug 'arecarn/vim-fold-cycle'

" html/css plugins
Plug 'mattn/emmet-vim'

" go
Plug 'fatih/vim-go'

" Erlang Support
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-compiler'

" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'avdgaag/vim-phoenix'
Plug 'mmorearty/elixir-ctags'
Plug 'mattreduce/vim-mix'
Plug 'mhinz/vim-mix-format'
Plug 'BjRo/vim-extest'
Plug 'frost/vim-eh-docs'
Plug 'jadercorrea/elixir_generator.vim'

" Elm Support
Plug 'lambdatoast/elm.vim'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" actionscript
Plug 'jeroenbourgois/vim-actionscript'

" ansible
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'pearofducks/ansible-vim'

" neco-look
Plug 'ujihisa/neco-look'
Plug 'Shougo/neco-syntax'

" commentout
Plug 'tyru/caw.vim'

" markdown
Plug 'tpope/vim-markdown'

" glow.nvim
Plug 'ellisonleao/glow.nvim', { 'branch': 'main' }

" capture.vim
Plug 'tyru/capture.vim'

" dirvish
" Plug 'justinmk/vim-dirvish'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Fern
" tree viewer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
" Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'

" autoclose
Plug 'Townk/vim-autoclose'

" trailing-whitespace
Plug 'bronson/vim-trailing-whitespace'

"tagbar"
Plug 'majutsushi/tagbar'
" Plug 'hushicai/tagbar-javascript.vim'

" colorizer
Plug 'lilydjwg/colorizer'

" plantuml
Plug 'aklt/plantuml-syntax'

" Plug 'yuttie/comfortable-motion.vim'

" vim-devicons
" Always load the vim-devicons as the very last one.
Plug 'ryanoasis/vim-devicons'

" vim-prisma
Plug 'pantharshit00/vim-prisma'

" jsdoc
Plug 'heavenshell/vim-jsdoc', {
 \ 'for': ['javascript', 'javascript.jsx','typescript'],
 \ 'do': 'make install'
\}

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

source ~/.vim/rc/encoding.vim
" source ~/.vim/rc/golang.vim
source ~/.vim/rc/basic.vim
source ~/.vim/rc/syntax.vim
source ~/.vim/rc/map.vim
" set rtp+=~/tabnine-vim

" vim-json
let g:vim_json_syntax_conceal = 0

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


" Use YouCompleteMe
" let g:ycm_global_ycm_extra_conf = '${HOME}/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf = ''
" let g:ycm_auto_trigger = 1
" let g:ycm_min_num_of_chars_for_completion = 3
" let g:ycm_complete_in_comments = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>', '<ESC>']

" Use vim-ruby
" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_classes_in_global = 1
" let g:rubycomplete_rails = 1

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
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_eruby_ruby_quiet_messages =
   \ {'regex': 'possibly useless use of a variable in void context'}
let g:syntastic_scss_sass_quiet_messages =
   \ {'regex': '\vUndefined (mixin|variable)|File to import not found or unreadable'}
    " \ {'regex': 'File to import not found or unreadable'}
    " \ {'regex': 'Undefined \(mixin\|variable\)'}
" let g:syntastic_phpcs_disable = 1
let g:syntastic_go_checkers = ['go', 'golint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']


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
      \ 'colorscheme': 'tokyonight',
      \ 'mode_map': {'c': 'NORMAL'},
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['fugitive', 'cocstatus', 'filename'],
      \     ],
      \     'right': [
      \       ['lineinfo', 'syntastic'],
      \       ['percent'],
      \       ['charcode', 'fileformat', 'fileencoding', 'filetype'],
      \     [ 'blame' ]
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
      \     'blame': 'LightlineGitBlame'
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
nmap <silent> <Leader>gd :<C-u>Gdiffsplit<CR>
nmap <silent> <Leader>gD :<C-u>Gdiffsplit HEAD<CR>
nmap <silent> <Leader>gs :<C-u>Git<CR>
nmap <silent> <Leader>ga :<C-u>Gwrite<CR>
nmap <silent> <Leader>gc :<C-u>Git commit<CR>
nmap <silent> <Leader>gb :<C-u>Git blame<CR>
nmap <silent> <Leader>gl :<C-u>Gclog<CR>
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
" let g:neoterm_autoscroll=1
" let g:neoterm_repl_ruby = 'pry'
let g:neoterm_default_mod = 'belowright'
tnoremap <silent> <ESC> <C-\><C-n>
" autocmd TermOpen * startinsert
nmap <silent> <Leader>tt :Ttoggle<CR>
" nnoremap <silent> <space>r V:TREPLSendLine<cr>
" vnoremap <silent> <space>r V:TREPLSendSelection<cr>'>j$

" Use previm
let g:previm_open_cmd = 'open -a Google\ Chrome'

" Use fzf
" プロジェクトルートをカレントディレクトリにする設定
let g:rooter_change_directory_for_non_project_files = 'current'
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-o': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10split enew' }
let g:fzf_buffers_jump = 1

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

nmap <Leader>. :Buffers<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>u :Files %:h<CR>
nmap <Leader>g :Rg<Space>
nmap <Leader>/ :BLines<CR>
nmap <Leader>h :Helptags<CR>
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'tabe',
\  'options': '-m -x +s',
\  'down':    '40%'})
nnoremap <Leader>r :FZFMru<CR>

" `:Rg` でカレントディレクトリ以下のgrep (ripgrep)、プレビュー付き
if executable('rg')
  command! -bang -nargs=* Rg
   \ call fzf#vim#grep(
   \ 'rg --column --line-number --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
   \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
   \ : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
   \ <bang>0)
endif

" Fern
let g:fern#default_hidden = 1
let g:fern#renderer = "nerdfont"
" Fernを開いた後にカラーシンタックスがうまく適用されないので:eを続けて入力させる
map <Space>f :Fern . -reveal=%  -drawer -width=30 -keep -toggle<CR>:e<CR>
map <Space>t :Fern %:h -drawer -width=30 -keep -toggle<CR>:e<CR>

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" Disable listing ignored files/directories
let g:fern_git_status#disable_ignored = 1

" vim-flow
let g:flow#autoclose = 1

" vim-prettier
" let g:prettier#autoformat = 0
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.css,*.scss,*.less PrettierAsync
" autocmd BufWritePre *.js,*.ts,*.css,*.scss,*.less PrettierAsync
" let g:prettier#config#config_precedence = 'file-override'
" let g:prettier#exec_cmd_async = 1
" let g:prettier#quickfix_enabled = 1
" let g:prettier#config#print_width = 120
" let g:prettier#config#semi = 'true'
" let g:prettier#config#bracket_spacing = 'false'
" let g:prettier#config#jsx_bracket_same_line = 'true'
" let g:prettier#config#trailing_comma = 'es5'

" neoformat
" let g:neoformat_javascript_prettier = {
"      \ 'exe': './node_modules/.bin/prettier',
"      \ 'args': ['--stdin', '--stdin-filepath', '%:p'],
"      \ 'stdin': 1,
"      \ }
" augroup fmt
"   autocmd!
"   autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.less Neoformat
" augroup END
" let g:neoformat_enabled_javascript = ['prettier']

" autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
"     \--stdin\
"     \--single-quote\ 
"     \--trailing-comma\ es5\
"     \--print-width\ 120\
"     \--arrow-parens\ avoid
" let g:neoformat_try_formatprg = 1

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

" mix format
let g:mix_format_on_save = 1

" plantuml
let g:plantuml_executable_script="~/dotfiles/plantuml"
au FileType plantuml command! OpenUML :!open -a Vivaldi %

" coc

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
let g:coc_global_extensions = ['coc-solargraph']
inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Yank list"
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<CR>
" floating window scroll
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.less Format
augroup END

" treesitter configure
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { "c", "rust" },
  },
  -- ensure_installed = 'maintained'
}
EOF
