local map = vim.api.nvim_set_keymap

vim.cmd(':so $HOME/.config/nvim/nolua.vim')

-----------------------------------------------------------------------------
--    LSP
-----------------------------------------------------------------------------
local on_attach = function(client)
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
    client.server_capabilities.semanticTokensProvider = nil
end

vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer', {
    on_attach = on_attach;

    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false;
            }
        }
    };

})

vim.diagnostic.config({ 
    virtual_text = false; 
    signs = false; 
    update_in_insert = false;
    underline = false;
    severity_sort = false;
})
