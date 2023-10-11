local wk = require("which-key")
wk.setup {
  triggers = { "<leader>" }
}

local mappings = {
  q = {
    name = 'file',
    q = { ":q<cr>", "quit" },
    w = { ":wq<cr>", "save & quit" },
    s = { ":w<cr>", "save" },
    f = { ":lua vim.lsp.buf.format()<cr>", "format file" },
    x = { ":bdelete<cr>", "close" },
  },
  f = {
    name = 'Telescope',
    f = { ":Telescope find_files<cr>", "find files" },
    r = { ":Telescope oldfiles<cr>", "recently opened" },
    w = { ":Telescope live_grep<cr>", "find string" },
    b = { ":Telescope buffers<cr>", "find buffer" },
    --c = { ":lua require('prism.picker').open()<cr>", "kolorschemes" },
  },
  t = {
    name = "terminal",
    t = { ":ToggleTerm<cr>", "split below" },
  },
  l = {
    name = "misc",
    l = { ":Lazy<cr>", "open lazy" },
    c = { ":lua require('telescope') vim.lsp.buf.code_action()<cr>", "show code actions" },
    m = { ":Mason<cr>", "open mason" },
    s = { ":SymbolsOutline<cr>", "overview of file" },
  },
  c = {
    name = "compiler",
    o = { "<cmd>CompilerOpen<cr>", "Compiler Open" },
    t = { "<cmd>CompilerToggleResults<cr>", "Compiler Toggle Results" },
    r = { "<cmd>CompilerRedo<cr>", "Compiler Redo" },
  },

}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
