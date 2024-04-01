return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = function()
            require("bufferline").setup {
                options = {
                    separator_style = "slant",
                }
            } 
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {}
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true,
    },
}
