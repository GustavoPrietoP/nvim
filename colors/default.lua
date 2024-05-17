vim.cmd.source("$VIMRUNTIME/colors/default.vim")
vim.g.colors_name = "default"

local colors = {
    blue    =    "#004c73",
    cyan    =    "#007373",
    green   =    "#005523",
    grey1   =    "#07080d",
    grey2   =    "#14161b",
    grey3   =    "#2c2e33",
    grey4   =    "#4f5258",
    magenta =    "#470045",
    red     =    "#590008",
    yellow  =    "#6b5300",
}
local highlight_groups = {
  ["TelescopeBorder"] = {fg = colors.grey3},
}

for group, attributes in pairs(highlight_groups) do
  vim.api.nvim_set_hl(0, group, attributes)
end
