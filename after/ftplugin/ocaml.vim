" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------

nmap <C-b> :!clear;ocaml %<cr>
nmap <leader>x :!clear;ocamlc -o main % && ./main<cr>
nmap <leader>f :call FormatOCaml()<cr>


function FormatOCaml()
    let buf = expand('%')
    let cmd = ":!ocamlformat -i " . l:buf . " --enable-outside-detected-project"
    exe l:cmd
endfunction
