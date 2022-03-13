" -----------------------------------------------------------------------------
"     - General settings -
" -----------------------------------------------------------------------------
set textwidth=99

" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------
nmap <C-b> :Compile<CR>
nmap <Leader>x :Cargo run<CR>
nmap <S-k> :lua vim.lsp.buf.hover()<CR>
nmap <Leader>f :RustFmt<CR>
nmap gd <Plug>(rust-def)
nmap gv <Plug>(rust-def-vertical)
nmap <leader>] :cnext<CR>
nmap <leader>[ :cprev<CR>
nmap <leader>d :DebugMain<CR>
nmap <leader>b :DebugAndBreak<CR>
nmap <leader>; :Step<CR>
nmap <leader>rt :RustTest<CR>
nmap <leader>tt :DebugTest<CR>
nmap ; :Over<CR>
" nmap <leader>d :lua require'dap'.continue()<CR>
" nmap <leader>b :lua require'dap'.toggle_breakpoint()<CR>
" nmap <leader>; :lua require'dap'.step_over()<CR>
" nmap <leader>ui :lua require'dapui'.toggle()<CR>
" nmap ; :lua require'dap'.step_over()<CR>

" -----------------------------------------------------------------------------
"     - Abbreviations -
" -----------------------------------------------------------------------------
ia cmt cmt<Leader>t<Left>
ia dd #[derive(Debug)]

" -----------------------------------------------------------------------------
"     - Vim lsp setup -
"     Neovim lsp setup is done in init.lua
" -----------------------------------------------------------------------------
if executable('rust-analyzer')
    " Disable most things
    let g:lsp_auto_enable = 0
    let g:lsp_preview_keep_focus = 0
    let g:lsp_preview_float = 0
    let g:lsp_preview_autoclose = 0
    let g:lsp_insert_text_enabled = 0
    let g:lsp_text_edit_enabled = 0
    let g:lsp_completion_documentation_enabled = 0
    let g:lsp_diagnostics_enabled = 0
    let g:lsp_diagnostics_highlights_enabled = 0
    let g:lsp_diagnostics_signs_enabled = 0
    let g:lsp_diagnostics_signs_insert_mode_enabled = 0
    let g:lsp_diagnostics_virtual_text_enabled = 0
    let g:lsp_document_highlight_enabled = 0
    let g:lsp_signature_help_enabled = 0
    let g:lsp_show_message_request_enabled = 0
    let g:lsp_preview_doubletap = 0
    let g:lsp_document_code_action_signs_enabled = 0

    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    nmap <buffer> gd <plug>(lsp-definition)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
