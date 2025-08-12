return {
    {
        "y3owk1n/undo-glow.nvim",
        event = { "VeryLazy" },
        ---@type UndoGlow.Config
        opts = {
            animation = {
                enabled = true,
                duration = 300,
                animtion_type = "zoom",
                window_scoped = true,
            },
            highlights = {
                undo = {
                    hl_color = { bg = "#C14A4A" }, -- gruvbox material red
                },
                redo = {
                    hl_color = { bg = "#6C782E" }, -- gruvbox material green
                },
                yank = {
                    hl_color = { bg = "#B47109" }, -- gruvbox material yellow
                },
                paste = {
                    hl_color = { bg = "#45707A" }, -- gruvbox material cyan
                },
                search = {
                    hl_color = { bg = "#945E80" }, -- gruvbox material purple
                },
                comment = {
                    hl_color = { bg = "#C35E0A" }, -- gruvbox material orange
                },
                cursor = {
                    hl_color = { bg = "#4C7A5D" }, -- gruvbox material aqua
                },
            },
            priority = 2048 * 3,
        },
        keys = {
            {
                "u",
                function()
                    require("undo-glow").undo()
                end,
                mode = "n",
                desc = "Undo with highlight",
                noremap = true,
            },
            {
                "<C-r>",
                function()
                    require("undo-glow").redo()
                end,
                mode = "n",
                desc = "Redo with highlight",
                noremap = true,
            },
            {
                "p",
                function()
                    require("undo-glow").paste_below()
                end,
                mode = "n",
                desc = "Paste below with highlight",
                noremap = true,
            },
            {
                "P",
                function()
                    require("undo-glow").paste_above()
                end,
                mode = "n",
                desc = "Paste above with highlight",
                noremap = true,
            },
            {
                "gc",
                function()
                    -- This is an implementation to preserve the cursor position
                    local pos = vim.fn.getpos(".")
                    vim.schedule(function()
                        vim.fn.setpos(".", pos)
                    end)
                    return require("undo-glow").comment()
                end,
                mode = { "n", "x" },
                desc = "Toggle comment with highlight",
                expr = true,
                noremap = true,
            },
            {
                "gcc",
                function()
                    return require("undo-glow").comment_line()
                end,
                mode = "n",
                desc = "Toggle comment line with highlight",
                expr = true,
                noremap = true,
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("TextYankPost", {
                desc = "Highlight when yanking (copying) text",
                callback = function()
                    require("undo-glow").yank()
                end,
            })
        end,
    },
}
