local map = vim.api.nvim_set_keymap

vim.cmd(':so $HOME/.config/nvim/nolua.vim')

-----------------------------------------------------------------------------
--    LSP
-----------------------------------------------------------------------------
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

-----------------------------------------------------------------------------
--    DAP
------------------------------------------------------------------------------
-- local dap = require('dap')
-- dap.adapters.lldb = {
--     type = 'executable',
--     command = '/usr/bin/lldb-vscode', -- adjust as needed
--     name = "lldb"
-- }

-- dap.configurations.rust = {
--     {
--         name = "Launch",
--         type = "lldb",
--         request = "launch",
--         program = function()
--             return vim.fn.getcwd() .. "/target/debug/" .. "${workspaceFolderBasename}"
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = false,
--         args = {},

--         preRunCommands = function() 
--             sysroot = require'io'.popen("rustc --print sysroot"):read():gsub("\n", "")
--             libpath = "/lib/rustlib/etc"

--             return {
--                 "command script import '" .. sysroot .. libpath .. "/lldb_lookup.py'",
--                 "command source -s 0 '" .. sysroot .. libpath .. "/lldb_commands'",
--             }
--         end,

--         runInTerminal = false,
--     },
-- }

-- dap.configurations.c = dap.configurations.rust
-- dap.configurations.c[1].preRunCommand = {}
-- dap.configurations.cpp = dap.configurations.c
