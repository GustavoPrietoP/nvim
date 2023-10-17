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
        lazy = true,
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
        lazy = true,
        config = function()
            require('plugs.lsp.lspconfig')
        end,

         init = function()
              -- Disable automatic setup, we are doing it manually
              vim.g.lsp_zero_extend_cmp = 0
              vim.g.lsp_zero_extend_lspconfig = 0
            end,
    },
      {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        lazy = true,
        dependencies = {
          {
            -- snippet plugin
            "L3MON4D3/LuaSnip",
            lazy = true,
            dependencies = "rafamadriz/friendly-snippets",
            config = function()
              require("plugs.lsp.luasnip")
            end,
          },

          -- autopairing of (){}[] etc
          {
            "windwp/nvim-autopairs",
            opts = {
              fast_wrap = {},
              disable_filetype = { "TelescopePrompt", "vim" },
            },
            event = "InsertEnter",
            lazy = true,
            config = function(_, opts)
              require("nvim-autopairs").setup(opts)

              -- setup cmp for autopairs
              local cmp_autopairs = require "nvim-autopairs.completion.cmp"
              require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end,
          },

          -- cmp sources plugins
          {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
          },
        },
        config = function()
          require("plugs.lsp.cmp")
        end,
      },

    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim',
        }
    },


    --{
    --    "chadcat7/prism",
    --    lazy = false,
    --    events = { "UIEnter" },
    --    config = function()
    --        require("plugs.ui.prism")
    --    end
    --},

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
        dir = "~/.colorschemes/nvchad-themes/rosepine/"
    },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  },

  --{
  --  'tamton-aquib/staline.nvim',
  --  config = function ()
  --      require("plugs.ui.statline")
  --  end
  --},
})
