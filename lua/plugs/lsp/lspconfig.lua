local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	return
end

local on_attach = function(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint(bufnr, true)
	end
	require "lsp_signature".on_attach({
		bind = true,
		handler_opts = {
			border = "rounded"
		}
	}, bufnr)
end

local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(),
	cmp_nvim_lsp.default_capabilities())

capabilities.offsetEncoding = { "utf-16" }

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = false,
		suffix = '',
		header = { "  Diagnostics", "String" },
		prefix = function(_, _, _) return "  ", "String" end,
	}
})

-- Diagnostic symbols
local signs = { Error = " ", Warn = " ", Hint = "", Info = " ", Question = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- CONFIGS
local servers = {
	"pyright",
    "gopls",
    "clangd",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = vim.tbl_deep_extend("keep", { offsetEncoding = { "utf-16", "utf-8" } }, capabilities),
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
					[vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})
--local lsp_zero = require('lsp-zero')
--
--
--vim.api.nvim_create_autocmd("LspAttach", {
--  callback = function(args)
--    local client = vim.lsp.get_client_by_id(args.data.client_id)
--    client.server_capabilities.semanticTokensProvider = nil
--  end,
--});
--
--lsp_zero.extend_lspconfig()
--
--
--lsp_zero.on_attach(function(client, bufnr)
--  -- see :help lsp-zero-keybindings
--  -- to learn the available actions
--  lsp_zero.default_keymaps({buffer = bufnr})
--end)
--
--
--
--lsp_zero.on_attach(function(client, bufnr)
--  -- see :help lsp-zero-keybindings
--  -- to learn the available actions
--  lsp_zero.default_keymaps({buffer = bufnr})
--end)
--
--require('mason').setup({})
--
--require('mason-lspconfig').setup({
--  ensure_installed = {},
--  handlers = {
--    lsp_zero.default_setup,
--  },
--})
