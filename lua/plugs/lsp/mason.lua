local mason_status_ok, mason = pcall(require, "mason")

if not mason_status_ok then
	return
end


local options = {

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}


mason.setup(options)

local install_server = {
	"lua-language-server",
	"stylua",

	"css-lsp",
	"html-lsp",
	"typescript-language-server",
	"prettier",
	"tailwindcss-language-server",
	"vue-language-server",
	"eslint-lsp",
	"deno",
	"emmet-ls",
	"json-lsp",
	"eslint_d",

	"pyright",
	"black",
    "gopls",

	"clangd",
	"clang-format",
	"vim-language-server",
}
vim.api.nvim_create_user_command("MasonInstallAll", function()
	vim.cmd("MasonInstall " .. table.concat(install_server, " "))
end, {})
