local map = vim.keymap.set

-- general mappings
map("i", "jk", "<ESC>")

map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')

-- nvimtree
map("n", "<leader>e", "<cmd> Oil <CR>")

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
map("n", "<leader>fb", "<cmd> Telescope buffers <CR>")
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>")


-- Oil

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clears search highlights", silent = true })

-- bufferline, cycle buffers
map("n", "<leader>bd", "<cmd> bd <CR>")

-- comment.nvim
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end)

map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")


map("n", "<leader>tt", "<cmd> ToggleTerm <CR>")
map('t', '<esc>', [[<C-\><C-n>]] )
map('t', 'jk', [[<C-\><C-n>]] )
map('t', '<C-h>', [[<Cmd>wincmd h<CR>]] )
map('t', '<C-j>', [[<Cmd>wincmd j<CR>]] )
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]] )
map('t', '<C-l>', [[<Cmd>wincmd l<CR>]] )
map('t', '<C-w>', [[<C-\><C-n><C-w>]] )

-- format
--
map("n", "<leader>fm", function()
  require("conform").format()
end)
