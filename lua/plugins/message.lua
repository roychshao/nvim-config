return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            local noice = require("noice")
            noice.setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup",
                    opts = {},
                },
                views = {
                    -- 配置 notify 視圖在右下角
                    notify = {
                        position = {
                            row = vim.o.lines - 1,  -- 最後一行
                            col = vim.o.columns - 1, -- 最右列
                        },
                        -- 其他可選配置
                        size = {
                            width = "auto",
                            height = "auto",
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                    },
                    -- 其他視圖配置...
                },
                messages = {
                    enabled = true,
                    view = "notify",
                    view_error = "notify",
                    view_warn = "notify",
                    view_history = "messages",
                    view_search = "virtualtext",
                },
            })
        end,
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = true,
            })

            vim.cmd [[
                highlight! DiagnosticVirtualTextError guifg=#a14a4a guibg=NONE
                highlight! DiagnosticVirtualTextWarn  guifg=#b68c3e guibg=NONE
                highlight! DiagnosticVirtualTextInfo  guifg=#5e81ac guibg=NONE
                highlight! DiagnosticVirtualTextHint  guifg=#6a9d68 guibg=NONE
            ]]
        end,
    },
}
