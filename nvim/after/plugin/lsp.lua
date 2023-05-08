local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'jedi_language_server',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings =  lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<Tab>'] = cmp.mapping.confirm({ select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
	['<CR>'] = vim.NIL,
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- gd = go to definition
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	-- K = documentation
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	-- vws = view workspace symbols
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	-- vd = view diagnostic
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	-- next diagnostic
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	-- prev diagnostic
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	-- vca = view code action
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	-- vrr = view references
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	-- vrn = view rename ?
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	-- ?
	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

