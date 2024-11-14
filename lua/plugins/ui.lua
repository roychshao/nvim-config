return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        -- commit = "0b2fd86",
        config = function()
            vim.keymap.set("n", "gT", ":BufferLineCyclePrev<CR>", { desc = "BufferLine toggle to previous one" })
            vim.keymap.set("n", "gt", ":BufferLineCycleNext<CR>", { desc = "BufferLine toggle to next one" })
            require("bufferline").setup({
                options = {
                    separator_style = "slant",
                },
                highlights = {
                    buffer_selected = {
                        fg = "bg",
                        bg = "fg",
                        bold = true,
                        italic = true,
                    },
                    separator_selected = {
                        fg = "bg",
                        bg = "fg",
                    },
                    indicator_selected = {
                        fg = "bg",
                        bg = "fg",
                    },
                    pick_selected = {
                        fg = "bg",
                        bg = "fg",
                    },
                    close_button_selected = {
                        fg = "bg",
                        bg = "fg",
                    },
                    numbers_selected = {
                        fg = "bg",
                        bg = "fg",
                    },
                    diagnostic_selected = {
                        fg = 'bg',
                        bg = 'fg',
                        bold = true,
                        italic = true,
                    },
                    hint_selected = {
                        fg = "bg",
                        bg = "fg",
                        bold = true,
                        italic = true,
                    },
                    hint_diagnostic_selected = {
                        fg = 'bg',
                        bg = 'fg',
                        bold = true,
                        italic = true,
                    },
                    info_selected = {
                        fg = 'bg',
                        bg = 'fg',
                        bold = true,
                        italic = true,
                    },
                    info_diagnostic_selected = {
                        fg = 'bg',
                        bg = 'fg',
                        bold = true,
                        italic = true,
                    },
                    warning_selected = {
                        fg = 'bg',
                        bg = 'fg',
                        bold = true,
                        italic = true,
                    },
                    warning_diagnostic_selected = {
                        fg = 'bg',
                        bg = 'fg',
                        bold = true,
                        italic = true,
                    },
                    error_selected = {
                        fg = 'bg',
                        bg = 'fg',
                        bold = true,
                        italic = true,
                    },
                    error_diagnostic_selected = {
                        fg = 'bg',
                        bg = 'fg',
                        bold = true,
                        italic = true,
                    },
                    modified_selected = {
                        fg = 'bg',
                        bg = 'fg',
                    },
                    duplicate_selected = {
                        fg = 'bg',
                        bg = 'fg',
                        italic = true,
                    },
                }
            })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {},
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true,
    },
}
