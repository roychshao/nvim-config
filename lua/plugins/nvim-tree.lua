return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local api = require("nvim-tree.api")
        vim.keymap.set("n", "<F2>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
        vim.keymap.set("n", "vs", api.node.open.vertical, { desc = "Open in vertical split" })
        vim.keymap.set("n", "hs", api.node.open.horizontal, { desc = "Open in horizontal split" })
        require("nvim-tree").setup({
            view = {
                width = 30,
            },
            update_focused_file = {
                enable = true,
                update_root = true,
                update_cwd = true,
            },
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            root_dirs = {},
            prefer_startup_root = false
        })
        -- vim.cmd([[
        --     :hi      NvimTreeNormal    guibg=#282828
        --     :hi      NvimTreeEndOfBuffer guibg=#282828
        -- ]])
    end,
}
