" -----------------------------------------------------------------------------
"     - General settings -
" -----------------------------------------------------------------------------
set makeprg = "tsc\ %"
nmap gd :LspDefinition<CR>
nmap <S-k> :lua vim.lsp.buf.hover()<CR>

