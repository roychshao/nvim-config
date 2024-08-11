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
                    theme = 'gruvbox-material'
                },
            })
            require('barbecue').setup {
                theme = 'gruvbox-material'
            }
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_foreground = 'mix'
            vim.cmd [[colorscheme gruvbox-material]]
        end
    }
}
