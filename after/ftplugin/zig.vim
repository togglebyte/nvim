set makeprg=zig\ build
let g:zig_fmt_autosave = 0

" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------
nmap <Leader>x :!clear;zig build run<CR>
nmap <C-b> :!clear;zig build<CR>
nmap <Leader>f :!clear;zig fmt %<CR>

" -----------------------------------------------------------------------------
"     - Abbreviations -
" -----------------------------------------------------------------------------
ia pp pp<Leader>t
ia cmt cmt<Leader>t<Left>
