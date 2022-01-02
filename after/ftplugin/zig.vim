set makeprg=zig\ build
let g:zig_fmt_autosave = 0

" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------
nmap <Leader>x :split term://zig build run<CR>
nmap <C-b> :split term://zig build<CR>
nmap <Leader>f :!clear;zig fmt %<CR>

" -----------------------------------------------------------------------------
"     - Abbreviations -
" -----------------------------------------------------------------------------
ia pp pp<Leader>t
ia cmt cmt<Leader>t<Left>
