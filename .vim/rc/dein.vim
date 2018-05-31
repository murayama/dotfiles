" dein {{{
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [expand('<sfile>')] + split(glob('~/.vim/rc/*.toml'), '\n'))

  " プラグインリストを収めた TOML ファイル
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
  " call dein#call_hook('source')
  " call dein#call_hook('post_source')
endif

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
  "  call dein#add('Shougo/vimproc', 'build': 'make'})
endif
" もし、未インストールものものがあったらインストール
"if !has('vim_starting') && dein#check_install()
if dein#check_install()
  call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

" }}}
