local map = vim.api.nvim_set_keymap

map('', '<Up>', '<Nop>', {noremap = true, silent = true})
map('', '<Down>', '<Nop>', {noremap = true, silent = true})
map('', '<Left>', '<Nop>', {noremap = true, silent = true})
map('', '<Right>', '<Nop>', {noremap = true, silent = true})

vim.g.mapleader = '\\'

-------------------------------------------------------------------------------
--    - Default settings -
-------------------------------------------------------------------------------
vim.o.fillchars = 'vert:│'
vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.o.whichwrap = 'b,s,<,>,h,l,[,]'
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.wo.foldmethod = 'indent'
vim.o.foldenable = true
vim.o.foldlevelstart = 10
vim.o.foldnestmax = 10
vim.o.ruler = false
vim.o.laststatus = 0
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.backspace = 'indent,eol,start'
vim.o.wrap = false
vim.o.hlsearch = false
vim.o.ttimeoutlen = 10
vim.o.mouse = ''
vim.o.swapfile = false
vim.wo.colorcolumn = '80'
vim.o.smd = false
vim.o.hidden = true
vim.o.modeline = false
vim.o.grepprg = 'rg --vimgrep'
vim.g.netrw_banner = 0

-----------------------------------------------------------------------------
--    I love my blocky cursor!
------------------------------------------------------------------------------
vim.o.guicursor = ''

-----------------------------------------------------------------------------
--    Colours
------------------------------------------------------------------------------
vim.cmd('colorscheme togglebit')

-----------------------------------------------------------------------------
--    Ultisnips
------------------------------------------------------------------------------
vim.g.UltiSnipsExpandTrigger = '<leader>t'

-----------------------------------------------------------------------------
--    Keybindings
------------------------------------------------------------------------------
map('n', '<C-p>', ':FZF<cr>', {})
map('n', '<C-h>', ':vertical resize -4<CR>', {})
map('n', '<C-l>', ':vertical resize +4<CR>', {})
map('n', '<C-k>', ':resize +4<CR>', {})
map('n', '<C-j>', ':resize -4<CR>', {})
map('n', '<Leader>}', 'ysiw}', {})

-- Terminal flapping
map('t', '<C-w>k', '<C-\\><C-n><C-w>k', {}) 
map('t', '<C-w>j', '<C-\\><C-n><C-w>j', {}) 
map('t', '<C-w>h', '<C-\\><C-n><C-w>h', {}) 
map('t', '<C-w>l', '<C-\\><C-n><C-w>l', {}) 

-----------------------------------------------------------------------------
--    Search
------------------------------------------------------------------------------
vim.cmd(':so $HOME/.config/nvim/search.vim')
vim.cmd('command! -nargs=* Find call RipGrepping(<q-args>)')

-----------------------------------------------------------------------------
--    Terminal
------------------------------------------------------------------------------

-----------------------------------------------------------------------------
--    Debugging
------------------------------------------------------------------------------
vim.cmd('packadd termdebug')

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

-- nvim_lsp.rust_analyzer.setup{
--     on_attach=on_attach,
--     -- settings = {
--     --     ["rust-analyzer"] = {
--     --         diagnostics = { 
--     --             enable = false,
--     --             enableExperimental = false,
--     --             gotoTypeDef = false,
--     --         },
--     --         assist = { 
--     --             importGroup = false,
--     --             importMergeBehavior = "none",
--     --             importPrefix = "plain",
--     --         },
--     --         callInfo = {
--     --             full = false
--     --         },
--     --         cargo = {
--     --             allFeatures = false,
--     --             autoreload = false,
--     --             runBuildScripts = false,
--     --             useRustcWrapperForBuildScripts = false,
--     --             noDefaultFeatures = false,
--     --         },
--     --         hoverActions = {
--     --             debug = false,
--     --             enable = false,
--     --             implementations = false,
--     --             run = false,
--     --             linksInHover = false,
--     --             chainingHints = false,
--     --             parameterHints = false,
--     --             typeHints = false,
--     --         },
--     --         lens = {
--     --             debug = false,
--     --             enble = false,
--     --             implementations = false,
--     --             run = false,
--     --         },
--     --         inlayHints = {
-- 				-- chainingHints = false,
-- 				-- typeHints = false,
-- 			-- },

--     --     }
--     -- }
-- }

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
--    Human error correction
------------------------------------------------------------------------------
vim.cmd(':command! W w')
