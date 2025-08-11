return {
    {
        "Shatur/neovim-session-manager",
        config = function()
            local session_manager = require('session_manager')
            local config = require('session_manager.config')

            -- 設定 SessionManager
            session_manager.setup({
                sessions_dir = vim.fn.stdpath('data') .. '/sessions/', -- session 存放目錄
                path_replacer = '__',       -- 檔案路徑中的斜線會被換成 __ 方便檔名
                colon_replacer = '++',      -- windows 路徑可能有冒號，改成 ++
                autoload_mode = config.AutoloadMode.Disabled,  -- 不自動載入 session
                autosave_last_session = false,  -- 不自動儲存最後的 session
                autosave_ignore_not_normal = true, -- 不儲存非一般檔案（像是 help）
                autosave_ignore_filetypes = { 'gitcommit', 'gitrebase' }, -- 忽略特定 filetype
            })

            -- 快捷鍵設定
            local opts = { noremap = true, silent = true }

            vim.keymap.set('n', '<leader>ss', function()
                session_manager.save_current_session()
            end, { desc = "Save current session", noremap = true, silent = true })

            vim.keymap.set('n', '<leader>sm', function()
                session_manager.load_session()
            end, { desc = "Load session", noremap = true, silent = true })

            vim.keymap.set('n', '<leader>sd', function()
                session_manager.delete_session()
            end, { desc = "Delete session", noremap = true, silent = true })
        end,
    }
}

