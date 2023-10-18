--vim.api.nvim_create_autocmd({ "ModeChanged", "CursorHold" }, {
 -- callback = function()
    --require("ui.stl").setup(vim.g.statusStyle)
   require("ui.buf").setup()
 -- end
--})
