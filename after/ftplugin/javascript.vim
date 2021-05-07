noremap gd :LspDefinition<CR>

let g:ltoggle_state = 0
function! LToggleLspDiagnostics()
    if (g:ltoggle_state == 0)
        :LspDocumentDiagnostics
        let g:ltoggle_state = 1
    else
        ccl
        let g:ltoggle_state = 0
    endif
endfunction

nmap <silent> <F5> :call LToggleLspDiagnostics()<CR>
nmap <silent> <F3> :LspDocumentFormat<CR>
