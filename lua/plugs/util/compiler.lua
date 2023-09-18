print("test")
-- Open compiler
vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_buf_set_keymap(0, 'n', '<S-F6>', function()
  vim.cmd("CompilerStop") -- (Optional, to dispose all tasks before redo)
  vim.cmd("CompilerRedo")
end, { noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_buf_set_keymap(0, 'n', '<S-F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
