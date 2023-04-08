local map = vim.api.nvim_set_keymap
local dap = require("dap")
local dapui = require("dapui")

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


nvim_lsp.kotlin_language_server.setup({
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

-------------------------------------------------------------------------------
----    DAP
--------------------------------------------------------------------------------
--dap.adapters.codelldb = {
--    type = "server",
--    port = "${port}",
--    executable = {
--        command = "/usr/bin/codelldb",
--        args = { "--port", "${port}" },
--    },
--}

--dap.configurations.rust = {
--    {
--        type = "codelldb",
--        request = "launch",
--        -- This is where cargo outputs the executable
--        program = function ()
--            os.execute("cargo build &> /dev/null")
--            return "target/debug/${workspaceFolderBasename}"
--        end,
--        args = function ()
--            local argv = {}
--            arg = vim.fn.input(string.format("argv: "))
--            for a in string.gmatch(arg, "%S+") do
--                table.insert(argv, a)
--            end
--            return argv
--        end,
--        cwd = "${workspaceFolder}",
--        -- Uncomment if you want to stop at main
--        -- stopOnEntry = true,
--        MIMode = "gdb",
--        miDebuggerPath = "/usr/bin/gdb",
--        setupCommands = {
--            {
--                text = "-enable-pretty-printing",
--                description = "enable pretty printing",
--                ignoreFailures = false,
--            },
--        },
--    },
--}

--vim.fn.sign_define(
--    "DapBreakpoint",
--    { text = "●", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
--)
--vim.fn.sign_define(
--    "DapBreakpointCondition",
--    { text = "◆", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
--)
--vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "debugPC", numhl = "debugPC" })
--dap.defaults.fallback.force_external_terminal = true
---- daptext.setup()
--dapui.setup({
--    layouts = {
--        {
--            elements = {
--                "watches",
--                { id = "scopes", size = 0.5 },
--                -- { id = "repl", size = 0.15 },
--            },
--            size = 79,
--            position = "right",
--        },
--        {
--            elements = {
--                "console",
--            },
--            size = 0.25,
--            position = "bottom",
--        },
--    },
--    controls = {
--        -- Requires Neovim nightly (or 0.8 when released)
--        enabled = true,
--        -- Display controls in this element
--        element = "repl",
--        icons = {
--            pause = "",
--            play = "",
--            step_into = "",
--            step_over = "",
--            step_out = "",
--            step_back = "",
--            run_last = "↻",
--            terminate = "□",
--        },
--    },
--})

--dap.listeners.after.event_initialized["dapui_config"] = function()
--  dapui.open()
--end
--dap.listeners.before.event_terminated["dapui_config"] = function()
--  dapui.close()
--end
--dap.listeners.before.event_exited["dapui_config"] = function()
--  dapui.close()
--end
