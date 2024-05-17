local opt = vim.opt

vim.g.mapleader = " "

opt.laststatus = 2 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

opt.pumheight = 10
opt.guicursor = ""
opt.cursorline = false

opt.scrolloff = 8

opt.pumblend = 0

opt.wrap = false

-- Numbers
opt.number = true
opt.relativenumber = true

opt.ruler = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = false
opt.swapfile = false

opt.timeoutlen = 400
opt.updatetime = 250

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"
