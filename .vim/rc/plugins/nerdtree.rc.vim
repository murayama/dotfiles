" nnoremap <space>f :NERDTreeTabsToggle<CR>
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ "Unknown"   : "?"
"     \ }
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "*",
      \ "Staged"    : "+",
      \ "Untracked" : "!",
      \ "Renamed"   : "→",
      \ "Unmerged"  : "=",
      \ "Deleted"   : "X",
      \ "Dirty"     : "x",
      \ "Clean"     : "√",
      \ "Unknown"   : "?"
      \ }

let g:NERDTreeShowBookmarks=1
