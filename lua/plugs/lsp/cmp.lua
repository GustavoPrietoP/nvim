--local cmp = require "cmp"
--
--dofile(vim.g.base46_cache .. "cmp")
--
--local cmp_ui = require("core.utils").load_config().ui.cmp
--local cmp_style = cmp_ui.style
--
--local field_arrangement = {
--  atom = { "kind", "abbr", "menu" },
--  atom_colored = { "kind", "abbr", "menu" },
--}
--
--local formatting_style = {
--  -- default fields order i.e completion word + item.kind + item.kind icons
--  fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },
--
--  format = function(_, item)
--    local icons = require "nvchad.icons.lspkind"
--    local icon = (cmp_ui.icons and icons[item.kind]) or ""
--
--    if cmp_style == "atom" or cmp_style == "atom_colored" then
--      icon = " " .. icon .. " "
--      item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
--      item.kind = icon
--    else
--      icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
--      item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
--    end
--
--    return item
--  end,
--}
--
--local function border(hl_name)
--  return {
--    { "╭", hl_name },
--    { "─", hl_name },
--    { "╮", hl_name },
--    { "│", hl_name },
--    { "╯", hl_name },
--    { "─", hl_name },
--    { "╰", hl_name },
--    { "│", hl_name },
--  }
--end
--
--local options = {
--  completion = {
--    completeopt = "menu,menuone",
--  },
--
--  window = {
--    completion = {
--      side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
--      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
--      scrollbar = false,
--    },
--    documentation = {
--      border = border "CmpDocBorder",
--      winhighlight = "Normal:CmpDoc",
--    },
--  },
--  snippet = {
--    expand = function(args)
--      require("luasnip").lsp_expand(args.body)
--    end,
--  },
--
--  formatting = formatting_style,
--
--  mapping = {
--    ["<C-p>"] = cmp.mapping.select_prev_item(),
--    ["<C-n>"] = cmp.mapping.select_next_item(),
--    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--    ["<C-f>"] = cmp.mapping.scroll_docs(4),
--    ["<C-Space>"] = cmp.mapping.complete(),
--    ["<C-e>"] = cmp.mapping.close(),
--    ["<CR>"] = cmp.mapping.confirm {
--      behavior = cmp.ConfirmBehavior.Insert,
--      select = true,
--    },
--    ["<Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif require("luasnip").expand_or_jumpable() then
--        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
--      else
--        fallback()
--      end
--    end, {
--      "i",
--      "s",
--    }),
--    ["<S-Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif require("luasnip").jumpable(-1) then
--        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
--      else
--        fallback()
--      end
--    end, {
--      "i",
--      "s",
--    }),
--  },
--  sources = {
--    { name = "nvim_lsp" },
--    { name = "luasnip" },
--    { name = "buffer" },
--    { name = "nvim_lua" },
--    { name = "path" },
--  },
--}
--
--if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
--  options.window.completion.border = border "CmpBorder"
--end
--

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
	return
end

local compare = require("cmp.config.compare")

local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-c>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif luasnip.jumpable(1) then
				luasnip.jump(1)
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif check_backspace() then
				-- cmp.complete()
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({
				symbol_map = { Copilot = "", Codeium = "", Snippet = "", Keyword = "" },
				preset = "codicons",
				maxwidth = 40,
			})(entry, vim_item)
			local strings = vim.split(vim_item.kind, "%s+", { trimempty = true })
			kind.kind = " " .. string.format("%s │", strings[1], strings[2]) .. " "
			return kind
		end,
	},
	sources = {
		{ name = "copilot" },
		{ name = "codeium", max_item_count = 2 },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			compare.offset,
			compare.exact,
			compare.scopes,
			compare.score,
			compare.recently_used,
			compare.locality,
			compare.kind,
			compare.sort_text,
			compare.length,
			compare.order,
		},
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
			scrollbar = false,
			col_offset = 0,
		},
		completion = {
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
			scrollbar = false,
			col_offset = 0,
			side_padding = 0,
		},
	},
	experimental = {
		ghost_text = true,
		native_menu = false
	},
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer",          max_item_count = 10 },
		{ name = "cmdline_history", max_item_count = 10 },
		{ name = "path",            max_item_count = 10 },
		{ name = "nvim_lua",        max_item_count = 10 },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "cmdline",         max_item_count = 10 },
		{ name = "cmdline_history", max_item_count = 10 },
		{ name = "path",            max_item_count = 10 },
		{ name = "nvim_lua",        max_item_count = 10 },
		{ name = "buffer",          max_item_count = 10 },
	},
})




--local cmp = require("cmp")
--
--local symbol_map = {
--  Namespace = "󰌗",
--  Text = "󰉿",
--  Method = "󰆧",
--  Function = "󰆧",
--  Constructor = "",
--  Field = "󰜢",
--  Variable = "󰀫",
--  Class = "󰠱",
--  Interface = "",
--  Module = "",
--  Property = "󰜢",
--  Unit = "󰑭",
--  Value = "󰎠",
--  Enum = "",
--  Keyword = "󰌋",
--  Snippet = "",
--  Color = "󰏘",
--  File = "󰈚",
--  Reference = "󰈇",
--  Folder = "󰉋",
--  EnumMember = "",
--  Constant = "󰏿",
--  Struct = "󰙅",
--  Event = "",
--  Operator = "󰆕",
--  TypeParameter = "󰊄",
--  Table = "",
--  Object = "󰅩",
--  Tag = "",
--  Array = "[]",
--  Boolean = "",
--  Number = "",
--  Null = "󰟢",
--  String = "󰉿",
--  Calendar = "",
--  Watch = "󰥔",
--  Package = "",
--  Copilot = "",
--  Codeium = "",
--  TabNine = "",
--}
--local options = {
--  completion = {
--    completeopt = "menu,menuone",
--  },
--
--  preselect = cmp.PreselectMode.Item,
--  snippet = {
--    expand = function(args)
--      require("luasnip").lsp_expand(args.body)
--    end,
--  },
--  window = {
--    documentation = {
--      winhighlight = "Normal:CmpDoc",
--    },
--    completion = {
--      winhighlight = "Normal:Pmenu",
--      scrollbar = false,
--    },
--  },
--  formatting = {
--    fields = { "kind", "abbr", "menu" },
--    format = function(_, item)
--      local a = string.rep(" ", 10)
--      item.abbr = item.abbr .. a
--      item.menu = " " .. item.kind .. " "
--      item.kind = " " .. symbol_map[item.kind] .. " "
--      return item
--    end,
--  },
--  mapping = {
--    ["<C-p>"] = cmp.mapping.select_prev_item(),
--    ["<C-n>"] = cmp.mapping.select_next_item(),
--    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--    ["<C-f>"] = cmp.mapping.scroll_docs(4),
--    ["<C-Space>"] = cmp.mapping.complete(),
--    ["<C-e>"] = cmp.mapping.close(),
--    ["<CR>"] = cmp.mapping.confirm {
--      behavior = cmp.ConfirmBehavior.Replace,
--      select = false,
--    },
--    ["<Tab>"] = cmp.mapping(function(fallback)
--        if cmp.visible() then
--          cmp.select_next_item()
--        elseif require("luasnip").expand_or_jumpable() then
--          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
--        else
--          fallback()
--        end
--      end,
--      {
--        "i",
--        "s",
--      }),
--    ["<S-Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif require("luasnip").jumpable(-1) then
--        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
--      else
--        fallback()
--      end
--    end, {
--      "i",
--      "s",
--    }),
--  },
--  sources = {
--    { name = "luasnip" },
--    { name = "nvim_lsp" },
--    { name = "buffer" },
--    { name = "nvim_lua" },
--    { name = "path" },
--  },
--}
--
--cmp.setup(options)
--return options
