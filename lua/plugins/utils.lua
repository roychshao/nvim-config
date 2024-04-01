return {
    {
        "nvim-treesitter/nvim-treesitter",
        main = "nvim-treesitter.configs",
        build = ":TSUpdate",
        event = "VeryLazy",
        opts = {
            ensure_installed = "all",
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            enable_check_bracket_line = false,
        },
        config = true
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },
    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow"
    }
}
