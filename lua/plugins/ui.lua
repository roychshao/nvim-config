return {
    {
        "akinsho/bufferline.nvim",
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
        main = "ibl",
        opts = {}
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },
}
