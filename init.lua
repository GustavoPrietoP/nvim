vim.g.base46_cache = vim.fn.stdpath('data') .. '/base46_cache/'

require "options"
require "mappings"
require "commands"

-- bootstrap plugins & lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed


if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require "plugins"


--vim.cmd "colorscheme poimandres"
-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "syntax")
-- dofile(vim.g.base46_cache .. "treesitter")
-- dofile(vim.g.base46_cache .. "git")
-- dofile(vim.g.base46_cache .. "nvimtree")

local integrations = require("nvconfig").base46.integrations

for _, name in ipairs(integrations) do
  dofile(vim.g.base46_cache .. name)
end
