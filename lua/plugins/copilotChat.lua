return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
        },
        opts = {
            debug = true, -- Enable debugging
            model = 'gpt-4o-2024-05-13',
            -- See Configuration section for rest
            -- window = {
            --     layout = 'float',
            --     relative = 'cursor',
            --     width = 0.7,
            --     height = 0.5,
            --     row = 0,
            --     border = 'double',
            -- }
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
}
