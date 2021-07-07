" -----------------------------------------------------------------------------
"     - General settings -
" -----------------------------------------------------------------------------
set textwidth=99


" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------
nmap <C-b> :Compile<CR>
nmap <Leader>x :Cargo run<CR>
nmap <Leader>b :Cargo test -- --nocapture<CR>
nmap <S-k> :call RustDocs()<CR>
nmap <Leader>f :RustFmt<CR>
nmap <Leader>B :!clear;env RUST_BACKTRACE=1 cargo test -- --nocapture<CR>
nmap gd <Plug>(rust-def)
nmap gv <Plug>(rust-def-vertical)
nmap <F5> :call RunDebugger()<CR>
nmap <leader>] :cnext<CR>
nmap <leader>[ :cprev<CR>
nmap <leader>d :Break<CR>
nmap <leader>r :DebugMain<CR>


" -----------------------------------------------------------------------------
"     - Abbreviations -
" -----------------------------------------------------------------------------
ia pp eprintln!("{:?}",);<Left><Left>
ia pl! println!("{:?}",);<Left><Left>
ia cmt cmt<Leader>t<Left>
ia dd #[derive(Debug)]

" -----------------------------------------------------------------------------
"     - Vim lsp setup -
"     Neovim lsp setup is done in init.lua
" -----------------------------------------------------------------------------
if executable('rust-analyzer')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal signcolumn=no

    " Disable most things
    let g:lsp_auto_enable = 0
    let g:lsp_preview_keep_focus = 0
    let g:lsp_preview_float = 0
    let g:lsp_preview_autoclose = 1
    let g:lsp_insert_text_enabled = 0
    let g:lsp_text_edit_enabled = 0
    let g:lsp_completion_documentation_enabled = 0
    let g:lsp_diagnostics_enabled = 0
    let g:lsp_diagnostics_highlights_enabled = 0
    let g:lsp_diagnostics_signs_enabled = 0
    let g:lsp_diagnostics_signs_insert_mode_enabled = 0
    let g:lsp_diagnostics_virtual_text_enabled = 0
    let g:lsp_diagnostics_virtual_text_enabled = 0
    let g:lsp_document_highlight_enabled = 0

    nmap <buffer> gd <plug>(lsp-definition)
    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
