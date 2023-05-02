" -----------------------------------------------------------------------------
"     - General settings -
" -----------------------------------------------------------------------------
set textwidth=99
set nospell

" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------
nmap <C-b> :Compile<CR>
nmap <Leader>x :Cargo run<CR>
nmap <S-k> :lua vim.lsp.buf.hover()<CR>
nmap <silent> <Leader>f :RustFmt<CR>
nmap gv <Plug>(rust-def-vertical)

nmap <leader>d :DebugMain<CR>
nmap <leader>b :DebugAndBreak<CR>
nmap ; :Over<CR>

nmap <leader>rt :RustTest<CR>
nmap <leader>tt :DebugTest<CR>

" nmap <leader>d :DapToggleBreakpoint<CR>:DapContinue<CR><CR>
" nmap <leader>b :DapToggleBreakpoint<CR>
" nmap ; :DapStepOver<CR>

" -----------------------------------------------------------------------------
"     - Abbreviations -
" -----------------------------------------------------------------------------
ia cmt cmt<Leader>t<Left>
ia dd #[derive(Debug)]

let g:rustfmt_command = "rustfmt +nightly"

" -----------------------------------------------------------------------------
"     - Find references to ident -
" -----------------------------------------------------------------------------
command! References execute "lua vim.lsp.buf.references()"
command! Rename execute "lua vim.lsp.buf.rename()"
