require("plugs.strap")
local lazy = require("lazy")
lazy.setup({
    {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        lazy = true,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        config = function() require('plugs.ts.treesitter') end
    },
    {
        'windwp/nvim-ts-autotag',
        event = "InsertEnter",
        lazy = true
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require("plugs.ts.autopair")
        end
    },

    {
        'NvChad/nvim-colorizer.lua',
        event = 'BufRead',
        config = function() require('plugs.ui.colorizer') end,
        lazy = true
    },
    {
        "nvim-tree/nvim-web-devicons",
        event = 'BufRead',
        config = function() require('plugs.ui.devicons') end,
        lazy = true,
    },

    {
        'kyazdani42/nvim-tree.lua',
        lazy = true,
        cmd = "NvimTreeToggle",
        config = function() require('plugs.util.nvim-tree') end
    },
    {
        "folke/which-key.nvim",
        keys = { "<leader>", ' ', "'", "`" },
        lazy = true,
        config = function() require('plugs.util.which-key') end
    },
    {
        'nvim-lua/plenary.nvim',
        lazy = true,
    },
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        lazy = true,
        dependencies = { 'plenary.nvim' },
        config = function() require('plugs.util.telescope') end
    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = { "BufRead" },
        config = function()
            require('gitsigns').setup {
                signs = {
                    add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
                    change       = {
                        hl = 'GitSignsChange',
                        text = '│',
                        numhl = 'GitSignsChangeNr',
                        linehl = 'GitSignsChangeLn'
                    },
                    delete       = {
                        hl = 'GitSignsDelete',
                        text = '_',
                        numhl = 'GitSignsDeleteNr',
                        linehl = 'GitSignsDeleteLn'
                    },
                    topdelete    = {
                        hl = 'GitSignsDelete',
                        text = '‾',
                        numhl = 'GitSignsDeleteNr',
                        linehl = 'GitSignsDeleteLn'
                    },
                    changedelete = {
                        hl = 'GitSignsChange',
                        text = '~',
                        numhl = 'GitSignsChangeNr',
                        linehl = 'GitSignsChangeLn'
                    },
                    untracked    = {
                        hl = 'GitSignsAdd',
                        text = '│',
                        numhl = 'GitSignsAddNr',
                        linehl = 'GitSignsDeleteLn'
                    },
                },
            }
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        main = "ibl",
        config = function() require('plugs.ui.indentlines') end,
        event = { "BufRead" },
    },
    {
        "williamboman/mason.nvim",
        cmd = {
            "MasonInstall",
            "MasonUninstall",
            "Mason",
            "MasonUninstallAll",
            "MasonLog",
        },
        lazy = true,
        config = function() require('plugs.lsp.mason') end,
    },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function() require("plugs.lsp.saga") end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        }
    },

    {
        "terrortylor/nvim-comment",
        config = function() require('plugs.util.comments') end,
        lazy = true,
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',

        config = function()
            require('plugs.lsp.lspconfig')
        end,
    },
    {
        'neovim/nvim-lspconfig'
    },

    {
        'williamboman/mason-lspconfig.nvim'
    },

    { 'hrsh7th/cmp-nvim-lsp' },

    {
        'hrsh7th/nvim-cmp',
        config = function()
            require("plugs.lsp.cmp")
        end
    },
    { 'L3MON4D3/LuaSnip' },

--    {
--        "chadcat7/prism",
--        lazy = false,
--        events = { "UIEnter" },
--        config = function()
--            require("plugs.ui.prism")
--        end
--    },

    {
        "GustavoPrietoP/compiler.nvim",
        dependencies = {
            {
                "stevearc/overseer.nvim",
                opts = {
                    task_list = { -- this refers to the window that shows the result
                        direction = "bottom",
                        min_height = 25,
                        max_height = 25,
                        default_detail = 1,
                        bindings = {
                            ["q"] = function()
                                vim.cmd("OverseerClose")
                            end,
                        },
                    },
                },
                config = function(_, opts)
                    require("overseer").setup(opts)
                end,
            },
        },
        cmd = { "CompilerOpen", "CompilerToggleResults" },
        opts = {},
    },
    {
        "roobert/palette.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("palette").setup({
                palettes = {
                    main = "custom_main_palette",
                    accent = "custom_accent_palette",
                    state = "custom_state_palette",
                },

                custom_palettes = {
                    main = {
                        custom_main_palette = {
                            color0 = "#191d33",
                            color1 = "#1A1E39",
                            color2 = "#383f5e",
                            color3 = "#4e5470",
                            color4 = "#7b7f94",
                            color5 = "#a7a9b7",
                            color6 = "#bdbfc9",
                            color7 = "#d3d4db",
                            color8 = "#e9e9ed",
                        },
                    },
                    accent = {
                        custom_accent_palette = {
                            accent0 = "#D97C8F",
                            accent1 = "#D9AE7E",
                            accent2 = "#D9D87E",
                            accent3 = "#A5D9A7",
                            accent4 = "#8BB9C8",
                            accent5 = "#C9A1D3",
                            accent6 = "#B8A1D9",
                        },
                    },
                    state = {
                        custom_state_palette = {
                            error = "#D97C8F",
                            warning = "#D9AE7E",
                            hint = "#D9D87E",
                            ok = "#A5D9A7",
                            info = "#8BB9C8",
                        },
                    },
                },
            })

        end,
    },

    {
        dir = "~/.colorschemes/nvchad-themes/aquarium/"
    },

    {
        dir = "~/.colorschemes/nvchad-themes/chocolate/"
    },

    {
        dir = "~/.colorschemes/nvchad-themes/ashes/"
    },

    {
        dir = "~/.colorschemes/nvchad-themes/rosepine/"
    },

    {
        dir = "~/.colorschemes/nvchad-themes/chadracula/"
    },
})
