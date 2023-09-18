require("plugs")
require("core")
require("ui")


local utils = require("prism.utils")

local colors = {
  name = "oxo",
  color0 = '#1d1d1d',
  color1 = '#e55794',
  color2 = '#4be194',
  color3 = '#df8157',
  color4 = '#759fe8',
  color5 = '#a477ea',
  color6 = '#1bbab7',
  color7 = '#b3b9b8',
  color8 = '#252525',
  color9 = '#df5b93',
  color10 = '#53cb8d',
  color11 = '#d9845e',
  color12 = '#618dd9',
  color13 = '#a27ae1',
  color14 = '#1eb1af',
  color15 = '#bdc3c2',
  comment = '#404749',
  background = "#111111",
  black = '#111111',
  darker = "#0b0b0b",
  foreground = '#dadada',
  cursorline = '#181818',
}

vim.api.nvim_set_hl(0, "Normal", { bg = "#111111" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#111111" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#111111" })

vim.cmd("hi NvimTreeNormal guibg=#0b0b0b")
vim.cmd("hi NvimTreeFolderName guifg=#EFFFFF")
vim.cmd("hi BufflineBufOnActive guibg= #759fe8 guifg= #111111")
vim.cmd("hi BufflineBufOnInactive guifg=#404749 guibg=#111111")
vim.cmd("hi BuffLineBufOnModified guibg=#759fe8 guifg=#111111 ")
vim.cmd("hi BuffLineBufOffModified guifg=#759fe8 guibg=#111111 ")
vim.cmd("hi BuffLineBufOnClose guibg=#759fe8 guifg=#111111 ")
vim.cmd("hi BuffLineBufOffClose guifg=#df5b93 guibg=#000000 ")
vim.cmd("hi BuffLineTree guibg=#0b0b0b guifg=#FFFFFF ")
vim.cmd("hi BuffLineEmpty guibg=#111111 guifg=#FFFFFF ")
vim.cmd("hi BuffLineEmptyColor guibg=#181818, guifg=#FFFFFF ")
vim.cmd("hi BuffLineButton guibg=#659fe8, guifg=#759fe8 ")
vim.cmd("hi BuffLineCloseButton guibg=#df5b93 guifg=#111111 ")

--vim.cmd("hi CmpItemKindClass guibg= ".. utils.darken(colors.color12, colors.darker, 0.1) .. " guifg= ".. colors.color12)

vim.cmd("hi  DevIconDefault guifg="..  colors.color7 )
vim.cmd("hi  DevIconc guifg="..  colors.color12 )
vim.cmd("hi  DevIconcss guifg="..  colors.color12 )
vim.cmd("hi  DevIcondeb guifg="..  colors.color6 )
vim.cmd("hi  DevIconDockerfile guifg="..  colors.color6 )
vim.cmd("hi  DevIconhtml guifg="..  colors.color9 )
vim.cmd("hi  DevIconjpeg guifg="..  colors.color2 )
vim.cmd("hi  DevIconjpg guifg="..  colors.color2 )
vim.cmd("hi  DevIconjs guifg="..  colors.color11 )
vim.cmd("hi  DevIconkt guifg="..  colors.color4 )
vim.cmd("hi  DevIconlock guifg="..  colors.color4 )
vim.cmd("hi  DevIconmp3 guifg="..  colors.color1 )
vim.cmd("hi  DevIconmp4 guifg="..  colors.color1 )
vim.cmd("hi  DevIconout guifg="..  colors.color1 )
vim.cmd("hi  DevIconpng guifg="..  colors.color2 )
vim.cmd("hi  DevIconpy guifg="..  colors.color4 )
vim.cmd("hi  DevIcontoml guifg="..  colors.color4 )
vim.cmd("hi  DevIconts guifg="..  colors.color12 )
vim.cmd("hi  DevIconttf guifg="..  colors.color15 )
vim.cmd("hi  DevIconrb guifg="..  colors.color9 )
vim.cmd("hi  DevIconrpm guifg="..  colors.color11 )
vim.cmd("hi  DevIconvue guifg="..  colors.color2 )
vim.cmd("hi  DevIconwoff guifg="..  colors.color15 )
vim.cmd("hi  DevIconwoff2 guifg=".. colors.color15 )
vim.cmd("hi  DevIconxz guifg="..  colors.color11 )
vim.cmd("hi  DevIconzip guifg="..  colors.color11 )
vim.cmd("hi  DevIconZig guifg="..  colors.color9 )








vim.api.nvim_set_hl(0, "Normal", { bg = "#111111" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "#111111", fg = "#252525"})
--vim.api.nvim_set_hl(0, "VertSplit", { bg = "#111111", fg = "#252525"})


--vim.cmd("hi CmpItemKindEnum guibg=".. utils.darken(colors.color5, colors.darker, 0.1) .. "guifg=".. colors.color5)
--vim.cmd("hi CmpItemKindEnumMember guibg=" .. utils.darken(colors.color5, colors.darker, 0.1) .. "guifg="..colors.color5)
--vim.cmd("hi CmpItemKindSnippet guibg=".. utils.darken(colors.color10, colors.darker, 0.1) .. "guifg="..colors.color10)
--vim.cmd("hi CmpItemKindField guibg=".. utils.darken(colors.color10, colors.darker, 0.1) .. "guifg="..colors.color10)
--vim.cmd("hi CmpItemKindText guibg=".. utils.darken(colors.color12, colors.darker, 0.1) .. "guifg="..colors.color12)
--vim.cmd("hi CmpItemKindConstant guibg=".. utils.darken(colors.color11, colors.darker, 0.1) .. "guifg="..colors.color11)
--vim.cmd("hi CmpItemKindConstructor guibg=".. utils.darken(colors.color10, colors.darker, 0.1) .. "guifg="..colors.color10)
--vim.cmd("hi CmpItemKindFunction guibg=".. utils.darken(colors.color12, colors.darker, 0.1) .. "guifg="..colors.color12)
--vim.cmd("hi CmpItemKindKeyword guibg=".. utils.darken(colors.color5, colors.darker, 0.1) .. "guifg="..colors.color5)
--vim.cmd("hi CmpItemKindOperator guibg=".. utils.darken(colors.color12, colors.darker, 0.1) .. "guifg="..colors.color12)
--vim.cmd("hi CmpItemKindProperty guibg=".. utils.darken(colors.color5, colors.darker, 0.1) .. "guifg="..colors.color5)
--vim.cmd("hi CmpItemKindStruct guibg=".. utils.darken(colors.color12, colors.darker, 0.1) .. "guifg="..colors.color12)
--vim.cmd("hi CmpItemKindTypeParameter guibg=".. utils.darken(colors.color2, colors.darker, 0.1) .. "guifg="..colors.color2)
--vim.cmd("hi CmpItemKindUnit guibg=".. utils.darken(colors.color12, colors.darker, 0.1) .. "guifg="..colors.color12)
--vim.cmd("hi CmpItemKindValue guibg=".. utils.darken(colors.color10, colors.darker, 0.1) .. "guifg="..colors.color10)
--vim.cmd("hi CmpItemKindVariable guibg=".. utils.darken(colors.color1, colors.darker, 0.1) .. "guifg="..colors.color1)
--vim.cmd("hi CmpItemAbbr guifg= colors.foreground,")
--
--vim.cmd("hi CmpItemAbbrDeprecated guifg=" .. colors.color2)
--vim.cmd("hi CmpItemAbbrMatch guifg="..colors.color7)
--vim.cmd("hi CmpItemAbbrMatchFuzzy guifg=" .. colors.color7)
--vim.cmd("hi CmpItemKind guifg=" .. colors.color12)
--vim.cmd("hi CmpItemMenu guifg=" ..colors.color12)
--vim.cmd("hi CmpDoc guibg=".. colors.cursorline)
--vim.cmd("hi Pmenu guifg="..  colors.foreground .. "guibg="..colors.darker)
--vim.cmd("hi PmenuSel guibg=".. utils.darken(colors.color4, colors.darker, 0.4))
--vim.cmd("hi PmenuSbar guibg=".. colors.darker)
--vim.cmd("hi PmenuThumb guibg=".. colors.color2)
