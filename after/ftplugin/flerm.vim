" -----------------------------------------------------------------------------
"     - General settings -
" -----------------------------------------------------------------------------
set textwidth=99
set nospell
au BufRead,BufNewFile *.flerm setfiletype echo
autocmd FileType echo setlocal commentstring=//\ %s
set nowrap

" -----------------------------------------------------------------------------
"     - Abbreviations -
" -----------------------------------------------------------------------------
ia cmt cmt<Leader>t<Left>
