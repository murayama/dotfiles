" 入力モードで開始する
let g:unite_enable_start_insert=1
" let g:unite_enable_split_vertically = 1 "縦分割で開く
" let g:unite_winwidth = 40 "横幅40で開く
" let g:unite_split_rule='botright'
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

let g:unite_source_rec_max_cache_files = 5000
" let g:unite_source_rec_min_cache_files = 1

call unite#custom_source( 'buffer', 'converters', ['converter_file_directory'])
call unite#custom_source('file_rec/async', 'ignore_pattern', '\(png\|gif\|jpeg\|jpg\|.git\)$')
let g:unite_source_history_yank_enable = 1

let s:unite_ignore_file_rec_patterns =
      \ ''
      \ .'vendor/bundle\|.bundle/\|\.sass-cache/\|'
      \ .'node_modules/\|bower_components/\|'
      \ .'\.\(bmp\|gif\|jpe\?g\|png\|webp\|ai\|psd\)"\?$'

" Use ag in unite grep source
if executable('ag')
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  let g:unite_source_grep_command       = 'ag'
  let g:unite_source_grep_default_opts  = '--nocolor --nogroup --column --hidden'
        \ . " --ignore='*.vimsessions*'"
        \ . " --ignore='*.idea*'"
        \ . " --ignore='.zeus.sock'"
  let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_buffer_time_format = ''

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

call unite#custom#substitute('files', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/*"', 2)
call unite#custom#substitute('files', '^@', '\=getcwd()."/*"', 1)
call unite#custom#substitute('files', '^\\', '~/*')

call unite#custom#substitute('files', '^v:', '~/.vim/*')
call unite#custom#substitute('files', '^p:', '~/projects/*')


" Unite tag
autocmd BufEnter *
      \   if empty(&buftype)
      \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
      \|  endif


"uniteを開いている間のキーマッピング
autocmd MyAutoCmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() abort
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

" タブ一覧
nnoremap <silent> <Leader>t :<C-u>Unite tab -auto-resize -select=`tabpagenr()-1`<CR>

" ウインドウ一覧
nnoremap <silent> <Leader>w :<C-u>Unite window:all<CR>

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
nnoremap <silent> <Leader>y :<C-u>Unite -buffer-name=register -default-action=append register history/yank<CR>

" 全部乗せ
nnoremap <silent> <Leader>a :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>

" ブックマークに追加
" nnoremap <silent> <Leader>ua :<C-u>UniteBookmarkAdd<CR>

" アウトライン
nnoremap <silent> <Leader>o :<C-u>Unite outline -start-insert<CR>
nnoremap <silent> <Leader>O :<C-u>Unite outline -no-quit -start-insert<CR>

" マーク一覧
nnoremap <silent> <Leader>m :<C-u>Unite -quick-match mark<CR>

" ライン
nnoremap <silent> <Leader>/ :<C-u>Unite line -buffer-name=search%`bufnr('%')`<CR>
nnoremap <silent> <Leader>? :<C-u>Unite line -no-quit -buffer-name=search%`bufnr('%')`<CR>
nnoremap <silent> * :<C-u>UniteWithCursorWord -buffer-name=search%`bufnr('%')` line:forward:wrap<CR>

" quickfix
nnoremap <silent> <Leader>qf :<C-u>Unite -no-quit qf<CR>

" grep
nnoremap <silent> <Leader>gr :<C-u>Unite grep -buffer-name=grep`tabpagenr()` -auto-preview -resume<CR>
nnoremap <silent> <Leader>GR :<C-u>Unite grep -no-quit -buffer-name=grep`tabpagenr()` -auto-preview -resume<CR>

" vimgrep
nnoremap <silent> <Leader>vg :<C-u>Unite vimgrep -buffer-name=grep`tabpagenr()` -auto-preview -resume<CR>
nnoremap <silent> <Leader>VG :<C-u>Unite vimgrep -no-quit -buffer-name=grep`tabpagenr()` -auto-preview -resume<CR>

" git grep
nnoremap <silent> <Leader>gg :<C-u>Unite grep/git:. -buffer-name=grep`tabpagenr()` -auto-preview -resume<CR>
nnoremap <silent> <Leader>GG :<C-u>Unite grep/git:. -no-quit -buffer-name=grep`tabpagenr()` -auto-preview -resume<CR>

" Unite tig
nnoremap <silent> <Leader>ut :<C-u>Unite tig -no-split<CR>

" like ctrlp
nnoremap <silent> <Leader>p :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<cr>
nnoremap <silent> <Leader>e :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<cr>
nnoremap <silent> <Leader>s :split<CR> :<C-u>Unite -buffer-name=files -start-insert buffer  file_rec/async:!<cr>
nnoremap <silent> <Leader>v :vsplit<CR> :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<cr>

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

" rubyリファレンス
nnoremap <silent> <Leader>rb :<C-u>Unite ref/refe<CR>

" phpマニアル
" nnoremap <silent> <Leader>ph :<C-u>Unite ref/phpmanual<CR>

" reset
nnoremap <space>r <Plug>(unite_restart)
