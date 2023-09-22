vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

-- Moving Between Buffers
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })

map('n', '<Leader>oe', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<C-f>', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
map('n', '<C-\\>', ':ToggleTerm<CR>', { noremap = true, silent = true })

map('n', 'zR', ':lua require("ufo").openAllFolds<CR>', { noremap = true, silent = true })
map('n', 'zM', ':lua require("ufo").closeAllFolds<CR>', { noremap = true, silent = true })

map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true })

map('n', '<Esc>', ':nohl<CR>', { silent = true })

map('n', '<leader>bc', ':bdelete<CR>', { silent = true })

map('i', 'jk', '<ESC>', { silent = true })

map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

map('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
map('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })

vim.cmd([[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Right>  :vertical resize -2<CR>
  nnoremap <silent> <C-Left>  :vertical resize +2<CR>
]])


-- disable ex mode
vim.cmd('nnoremap Q <Nop>')

-- disable recording
vim.cmd('nnoremap q <Nop>')


local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
