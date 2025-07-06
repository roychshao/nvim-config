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
        'danilamihailov/beacon.nvim',
        opts ={
            enabled = true, --- (boolean | fun():boolean) check if enabled
            speed = 2, --- integer speed at wich animation goes
            width = 40, --- integer width of the beacon window
            winblend = 70, --- integer starting transparency of beacon window :h winblend
            fps = 60, --- integer how smooth the animation going to be
            min_jump = 1, --- integer what is considered a jump. Number of lines
            cursor_events = { 'CursorMoved' }, -- table<string> what events trigger check for cursor moves
            window_events = { 'WinEnter', 'FocusGained' }, -- table<string> what events trigger cursor highlight
            highlight = { bg = 'white', ctermbg = 15 }, -- vim.api.keyset.highlight table passed to vim.api.nvim_set_hl
        }
    }
}
