return {
    { 
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        config = function()
            vim.cmd[[colorscheme gruvbox]]
            require('lualine').setup({
                options = {
                    theme = 'gruvbox'
                },
            })
            require('barbecue').setup {
                theme = 'gruvbox',
            }
        end
    }
}
