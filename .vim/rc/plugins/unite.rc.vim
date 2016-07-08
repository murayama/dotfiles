" 入力モードで開始する
let g:unite_enable_start_insert=1
" let g:unite_enable_split_vertically = 1 "縦分割で開く
" let g:unite_winwidth = 40 "横幅40で開く
" let g:unite_split_rule='botright'

let g:unite_source_rec_max_cache_files = 5000
" let g:unite_source_rec_min_cache_files = 1

call unite#custom_source( 'buffer', 'converters', ['converter_file_directory'])
call unite#custom_source('file_rec/async', 'ignore_pattern', '\(png\|gif\|jpeg\|jpg\|.git\)$')
let g:unite_source_history_yank_enable = 1


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
