" -----------------------------------------------------------------------------
"     - Grep -
" -----------------------------------------------------------------------------
set grepprg=rg\ --vimgrep

function RipGrepping(search_term)
    silent! exe 'grep! -i -F "' . a:search_term . '"'
    redraw!
    if len(getqflist()) > 0
        :copen
    endif
endfunction
command! -nargs=* Find call RipGrepping(<q-args>)

nmap <C-f> :Find 

" -----------------------------------------------------------------------------
"     - Explore -
" -----------------------------------------------------------------------------
nmap <silent><C-n> :15Lexplore!<cr>
let g:netrw_liststyle = 3
