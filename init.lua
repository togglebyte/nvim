local map = vim.api.nvim_set_keymap

vim.cmd(':so $HOME/.config/nvim/nolua.vim')
vim.cmd('au TermOpen * exec "normal G"')

-- Terminal flapping
map('t', '<C-w>k', '<C-\\><C-n><C-w>k', {}) 
map('t', '<C-w>j', '<C-\\><C-n><C-w>j', {}) 
map('t', '<C-w>h', '<C-\\><C-n><C-w>h', {}) 
map('t', '<C-w>l', '<C-\\><C-n><C-w>l', {}) 

-----------------------------------------------------------------------------
--    LSP
------------------------------------------------------------------------------
local nvim_lsp = require'lspconfig'
local on_attach = function(client)
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
end


nvim_lsp.rust_analyzer.setup({
    on_attach = on_attach,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false, 
        signs = false, 
        update_in_insert = false,
        underline = false,
        severity_sort = false,
	}
)
