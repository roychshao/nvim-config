return {
    {
        'sainnhe/gruvbox-material',
        name = 'gruvbox-material',
        lazy = false,
        priority = 1000,
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'gruvbox-material',
                    component_separators = { left = ')', right = '('},
                    globalstatus = true,
                },
                sections = {
                    lualine_a = {
                        {
                            'mode',
                            separator = { right = '' }
                        }
                    },
                    lualine_b = {
                        {
                            'branch',
                            icon = '',
                            separator = { right = '' }
                        }
                    },
                    lualine_c = {
                        {
                            'filename',
                            path = 1,
                        },
                        {
                            'diff',
                        },
                        {
                            'diagnostics',
                            symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
                        }
                    },
                    lualine_x = {
                        {
                            'filetype',
                            separator = { left = '' },
                        },
                    },
                    lualine_y = {
                        {
                            'progress',
                            separator = { left = '' },
                        }
                    },
                    lualine_z = {
                        {
                            'location',
                            separator = { left = '' },
                        }
                    },
                },
            })
            require('barbecue').setup {
                theme = 'gruvbox-material'
            }
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_foreground = 'mix'
            vim.g.gruvbox_material_enable_bold = 1
            vim.g.gruvbox_material_menu_selection_background = 'blue'
            vim.g.gruvbox_material_spell_foreground = 'colored'
            vim.g.gruvbox_material_ui_contrast = 'high'
            vim.cmd [[colorscheme gruvbox-material]]
        end
    },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     name = "kanagawa",
    --     lazy = false,
    --     priority = 1000,
    --     dependencies = {
    --         "nvim-lualine/lualine.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --         "utilyre/barbecue.nvim",
    --         "SmiteshP/nvim-navic",
    --     },
    --     config = function()
    --         require('kanagawa').setup({
    --             compile = false,             -- enable compiling the colorscheme
    --             undercurl = true,            -- enable undercurls
    --             commentStyle = { italic = true },
    --             functionStyle = {},
    --             keywordStyle = { italic = true},
    --             statementStyle = { bold = true },
    --             typeStyle = {},
    --             transparent = false,         -- do not set background color
    --             dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    --             terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    --             colors = {                   -- add/modify theme and palette colors
    --                 palette = {},
    --                 theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    --             },
    --             overrides = function(colors)
    --                 local theme = colors.theme
    --                 return {
    --                     NormalFloat = { bg = "none" },
    --                     FloatBorder = { bg = "none" },
    --                     FloatTitle = { bg = "none" },
    --
    --                     -- Save an hlgroup with dark background and dimmed foreground
    --                     -- so that you can use it where your still want darker windows.
    --                     -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
    --                     NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
    --
    --                     -- Popular plugins that open floats will link to NormalFloat by default;
    --                     -- set their background accordingly if you wish to keep them dark and borderless
    --                     LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    --                     MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    --                 }
    --             end,
    --             theme = "all",               -- Load all theme
    --             background = {               -- map the value of 'background' option to a theme
    --                 dark = "wave",           -- try "dragon" !
    --                 light = "lotus"
    --             },
    --         })
    --         require('lualine').setup({
    --             options = {
    --                 theme = 'kanagawa'
    --             },
    --         })
    --         require('barbecue').setup {
    --             theme = 'kanagawa'
    --         }
    --         vim.g.gruvbox_material_enable_italic = true
    --         vim.g.gruvbox_material_foreground = 'mix'
    --         vim.cmd [[colorscheme kanagawa]]
    --     end
    -- },
    -- {
    --     "thesimonho/kanagawa-paper.nvim",
    --     name = 'kanagawa-paper',
    --     lazy = false,
    --     priority = 1000,
    --     dependencies = {
    --         "nvim-lualine/lualine.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --         "utilyre/barbecue.nvim",
    --         "SmiteshP/nvim-navic",
    --     },
    --     config = function()
    --         local kanagawa_paper = require("lualine.themes.kanagawa-paper-ink")
    --         require('lualine').setup({
    --             options = {
    --                 theme = kanagawa_paper
    --             },
    --         })
    --         require('barbecue').setup {
    --             theme = 'kanagawa-paper'
    --         }
    --         vim.g.gruvbox_material_enable_italic = true
    --         vim.g.gruvbox_material_foreground = 'mix'
    --         vim.cmd [[colorscheme kanagawa-paper]]
    --     end
    -- },
}
