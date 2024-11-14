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
        })
        vim.cmd([[
            :hi      NvimTreeNormal    guibg=#282828
            :hi      NvimTreeEndOfBuffer guibg=#282828
        ]])
    end,
}
