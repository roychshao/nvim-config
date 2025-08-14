return {
    {
        'nanozuki/tabby.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            local theme = {
                -- this is carbonfox theme
                fill = 'TabLineFill',
                head = 'TabLine',
                current_tab = 'TabLineSel',
                tab = 'TabLine',
                win = 'TabLine',
                tail = 'TabLine',
            }

            require('tabby.tabline').set(function(line)
                return {
                    {
                        { '  ', hl = theme.head },
                        line.sep(' ', theme.head, theme.fill),
                    },
                    line.tabs().foreach(function(tab)

                        local hl = tab.is_current() and theme.current_tab or theme.tab

                        -- remove count of wins in tab with [n+] included in tab.name()
                        local name = tab.name()
                        local index = string.find(name, "%[%d")
                        local tab_name = index and string.sub(name, 1, index - 1) or name

                        -- indicate if any of buffers in tab have unsaved changes
                        local modified = false
                        local win_ids = require('tabby.module.api').get_tab_wins(tab.id)
                        for _, win_id in ipairs(win_ids) do
                            if pcall(vim.api.nvim_win_get_buf, win_id) then
                                local bufid = vim.api.nvim_win_get_buf(win_id)
                                if vim.api.nvim_buf_get_option(bufid, "modified") then
                                    modified = true
                                    break
                                end
                            end
                        end

                        return {
                            line.sep('', hl, theme.fill),
                            tab_name,
                            modified and '',
                            line.sep('', hl, theme.fill),
                            hl = hl,
                            margin = ' ',
                        }
                    end),
                    line.spacer(),
                    {
                        line.sep('', theme.tail, theme.fill),
                        { '  ', hl = theme.tail },
                    },
                    hl = theme.fill,
                }
            end)
            vim.o.showtabline = 2
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
    {
        "sphamba/smear-cursor.nvim",
        opts = {
            cursor_color = "#945e80",
            stiffness = 0.8,
            dampling = 0.5,
            trailing_stiffness = 0.15,
            gamma = 1,
        }
    },
    {
        "yuttie/comfortable-motion.vim",
        config = function ()
            local modes = { 'n', 'v', 'x', 's', 'o' }

            for _, mode in ipairs(modes) do
                vim.keymap.set(mode, "<ScrollWheelUp>", ":call comfortable_motion#flick(-25)<CR>", { noremap = true, silent = true })
                vim.keymap.set(mode, "<ScrollWheelDown>", ":call comfortable_motion#flick(25)<CR>", { noremap = true, silent = true })
                vim.keymap.set(mode, "<PageUp>", ":call comfortable_motion#flick(-200)<CR>", { noremap = true, silent = true })
                vim.keymap.set(mode, "<PageDown>", ":call comfortable_motion#flick(200)<CR>", { noremap = true, silent = true })
            end
        end
    },
    {
        "dstein64/nvim-scrollview",
        opts = function ()
            vim.g.scrollview_character = "█"
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }
}
