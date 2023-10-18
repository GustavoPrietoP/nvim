local M = {}

M.ui = {
    theme = "yoru",

    statusline = {
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "round",
    },

    cmp = {
      icons = true,
      lspkind_text = true,
      style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
      border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
      selected_item_bg = "colored", -- colored / simple
    },

  -- lazyload it when there are 1+ buffers
   tabufline = {
     show_numbers = false,
     enabled = false,
     lazyload = true,
     overriden_modules = nil,
   },

   hl_add = {
      BufflineBufOnActive = {fg = "black", bg="blue"},
      BufflineBufOnInactive = {fg="white", bg="darker_black"},
      BuffLineBufOnModified = {fg="black", bg="blue"},
      BuffLineBufOffModified =  {bg="black"},
      BuffLineBufOnClose = {fg="black", bg="blue",},
      BuffLineBufOffClose = {fg="red", bg="black"},
      BuffLineTree = {},
      BuffLineEmpty = {},
      BuffLineEmptyColor = {},
      BuffLineButton = {fg="red", bg="black"},
      BuffLineCloseButton = {fg="red", bg="black"},
   }
}

return M
