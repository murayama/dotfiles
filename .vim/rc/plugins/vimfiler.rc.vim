" --------------------
" vimfiler.vim
"
let g:vimfiler_enable_clipboard = 0

"call vimfiler#custom#profile('default', 'context', {
"      \ 'safe' : 0,
"      \ 'auto_expand': 1,
"      \ 'parent': 0,
"      \ })
"
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0

let g:vimfiler_sendto = {
      \ 'unzip': 'unzip %f',
      \ 'zip': 'zip -r %F.zip %*',
      \}

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = ' '
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

"
" autocmd! FileType vimfiler call s:my_vimfiler_settings()
" function! s:my_vimfiler_settings()
"   nmap <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
"   " nnoremap <buffer>s :call vimfiler#do_switch_action('my_split')<CR>
"   " nnoremap <buffer>v :call vimfiler#do_switch_action('vsplit')<CR>
"   " nnoremap <buffer>E :call vimfiler#do_switch_action('tabopen')<CR>
"   " nnoremap <buffer>s :call vimfiler#do_action('my_split')<CR>
"   " nnoremap <buffer>v :call vimfiler#mappings#do_action('my_vsplit')<CR>
"   " nnoremap <buffer>E :call vimfiler#mappings#do_action('my_tabopen')<CR>
" endfunction

nnoremap <space>s :VimFilerSplit -horizontal -find<CR>
nnoremap <space>v :VimFilerSplit -find<CR>
nnoremap <space>f :VimFilerExplorer -direction=topleft -project -find<CR>

function! s:vimfiler_width_expr()
  let w = vimfiler#get_context().winwidth
  return w == winwidth(0) ? w * 2 : w
endfunction
autocmd FileType vimfiler
      \ nmap <buffer> <SID>(vimfiler_redraw_screen) <Plug>(vimfiler_redraw_screen)|
      \ nnoremap <buffer><script> <C-W>> 35<C-W>><SID>(vimfiler_redraw_screen)|
      \ nnoremap <buffer><script> <C-W>< 35<C-W><<SID>(vimfiler_redraw_screen)|
      \ nnoremap <buffer><script> <C-W>\| 70<C-W>\|<SID>(vimfiler_redraw_screen)

" let my_action = { 'is_selectable' : 1 }
" function! my_action.func(candidates)
"   wincmd p
"   exec 'split '.a:candidates[0].action__path
" endfunction
" call unite#custom#action('file', 'my_split', my_action)
"
" let my_action = { 'is_selectable' : 1 }
" function! my_action.func(candidates)
"   wincmd p
"   exec 'vsplit '.a:candidates[0].action__path
" endfunction
" call unite#custom_action('file', 'my_vsplit', my_action)
"
" let my_action = { 'is_selectable' : 1 }
" function! my_action.func(candidates)
"   wincmd p
"   exec 'tabnew '.a:candidates[0].action__path
" endfunction
" call unite#custom_action('file', 'my_tabopen', my_action)
