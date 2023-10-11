vim.api.nvim_create_autocmd({ "ModeChanged", "CursorHold" }, {
  callback = function()
    require("ui.buf").setup()
  end
})
