return  {
    'renerocksai/telekasten.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        'renerocksai/calendar-vim',
    },
    config = function()
        require("telekasten").setup({
            home = vim.fn.expand("~/notes"),
            template_new_note = vim.fn.expand("~/notes/templates/temporally.md"),
            template_new_daily = vim.fn.expand("~/notes/templates/daily.md"),
            template_new_weekly = vim.fn.expand("~/notes/templates/weekly.md"),
            calendar_opts = {
                weeknm = 4,
            }
        })
        vim.keymap.set("n", "<leader>nn", "<cmd>Telekasten panel<cr>", { desc = "Open Telekasten panel" })
    end
}
