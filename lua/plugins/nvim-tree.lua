return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.keymap.set("n", "<F2>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
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
        vim.cmd([[
            :hi      NvimTreeNormal    guibg=#282828
            :hi      NvimTreeEndOfBuffer guibg=#282828
        ]])
    end,
}
