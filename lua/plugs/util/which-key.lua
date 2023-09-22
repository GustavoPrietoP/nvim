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
  g = {
    name = "grapple",
    a = { ":grappletag<cr>", "add a bookmark" },
    t = { ":grappletoggle<cr>", "toggle bookmark" },
    r = { ":grappleuntag<cr>", "remove bookmark" },
    g = { ":grapplepopup tags<cr>", "show all bookmarks" }
  },
  t = {
    name = "terminal",
    t = { ":ToggleTerm<cr>", "split below" },
  },
  l = {
    name = "misc",
    l = { ":lazy<cr>", "open lazy" },
    c = { ":lua require('telescope') vim.lsp.buf.code_action()<cr>", "show code actions" },
    m = { ":mason<cr>", "open mason" },
    s = { ":symbolsoutline<cr>", "overview of file" },
    w = { ":sessionsave<cr>", "save this session" }
  },
  h = {
    name = "hop",
    c = { ":hopchar1<cr>", "single character" },
    c = { ":hopchar2<cr>", "double characters" },
    a = { ":hopanywhere<cr>", "anywhere" },
    l = { ":hopline<cr>", "line" },
    l = { ":hoplinestart<cr>", "line start" },
    v = { ":hopvertical<cr>", "vertically" },
    w = { ":hopword<cr>", "word" },
  },

  c = {
      name = "compiler",
    o = { "<cmd>CompilerOpen<cr>", "CompilerOpen" },
    r = { "<cmd>CompilerToggleResults<cr>", "CompilerToggleResults" },
  },

}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
