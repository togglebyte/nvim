" -----------------------------------------------------------------------------
"     - General settings -
" -----------------------------------------------------------------------------
set makeprg=ghc\ -dynamic\ %

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------
nmap <C-b> :!clear;ghc -dynamic % <CR>
nmap <Leader>x :!clear;ghc -dynamic % && ./hello<CR>
