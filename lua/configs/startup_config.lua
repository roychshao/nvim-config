local settings = {
    -- 每行寬度應相同（不包含轉義符\）
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = {
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        },
        highlight = "Title",  -- 改為 Title 高亮組
        default_color = "#d79921",  -- Gruvbox yellow
        oldfiles_amount = 0,
    },

    -- 顯示名稱和對應命令
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
            { " Find File", "Telescope find_files", "<leader>ff" },
            { "󰍉 Find Word", "Telescope live_grep", "<leader>lg" },
            { " Recent Files", "Telescope oldfiles", "<leader>of" },
            { " File Browser", "Telescope file_browser", "<leader>fb" },
            { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
            { " Session Manager", "SessionManager load_session", "<leader>sm" },
        },
        highlight = "String",  -- Gruvbox green
        default_color = "#98971a",
        oldfiles_amount = 0,
    },

    footer = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = 5,
        content = function()
            local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
            local stats = require("lazy").stats()
            local uname = vim.loop.os_uname()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            local nvim_version = vim.version()
            local quote = {
                "「Stay hungry, stay foolish.」",
                "「Simplicity is the ultimate sophistication.」",
                "「First, solve the problem. Then, write the code.」",
                "「Any fool can write code that a computer can understand. Good programmers write code that humans can understand.」"
            }
            math.randomseed(os.time())
            return {
                datetime,
                " " .. uname.sysname .. " " .. uname.release,
                " v" .. nvim_version.major .. "." .. nvim_version.minor .. "." .. nvim_version.patch,
                " " .. stats.count .. " plugins loaded in " .. ms .. "ms",
                quote[math.random(#quote)],
                "startup.nvim"
            }
        end,
        highlight = "Comment",  -- Gruvbox gray
        default_color = "#928374",
        oldfiles_amount = 0,
    },

    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
    },

    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },

    colors = {
        background = "#282828",  -- Gruvbox dark background
        folded_section = "#d79921",  -- Gruvbox yellow
    },

    parts = { "header", "body", "footer" },
}

-- 應用 Gruvbox Material 配色
vim.cmd[[colorscheme gruvbox-material]]

return settings
